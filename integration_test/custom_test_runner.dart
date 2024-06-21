import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  final String? tag =
      Platform.environment['TAG'] ?? (args.isNotEmpty ? args[0] : null);
  final String? fileName =
      Platform.environment['FILENAME'] ?? (args.isNotEmpty ? args[1] : null);
  // print("--> the filename : $fileName");

  if (tag == null || fileName == null) {
    // print('Please provide a tag to filter tests.');
    exit(1);
  }

  final testFiles = Directory('.')
      // .listSync(recursive: true)
      .listSync()
      .whereType<File>()
      .where((file) => file.path.endsWith('_test.dart'))
      .map((file) => file.path.replaceFirst("./", ""))
      .toList();

  // print(">>> testFiles : $testFiles");
  generateTempTestFileAndRun(tag, testFiles, fileName);
}

// Function to extract specific testWidgets by tag and create a temporary Dart file.
void generateTempTestFileAndRun(
    String tag, List<String> testFiles, String fileName) {
  // Define the path for the new temporary Dart file.
  final tempTestFilePath = '${Directory.current.path}/$fileName';

  // Check if the file already exists and delete it.
  if (File(tempTestFilePath).existsSync()) {
    File(tempTestFilePath).deleteSync();
  }

  // Start creating the content of the temporary Dart file.
  final tempTestFileContent = StringBuffer('''
    // GENERATED CODE - DO NOT MODIFY BY HAND
  ''');

  // Set to keep track of added imports.
  final addedImports = <String>{};
  final tempFileContent = <String>{};
  // Extract and add tests by tag.
  for (var filePath in testFiles) {
    print(">>>>> filePath : $filePath");

    final fileContent = File(filePath).readAsStringSync();
    // tempFileContent.add(extractTaggedTestsAndWriteTempFile(fileContent, tag));
    tempFileContent.add(extractGroupsWithSpecifiedTag(fileContent, tag));

    // Add unique imports from the current test file.
    fileContent.split('\n').forEach((line) {
      if (line.startsWith('import ') || line.startsWith('export ')) {
        if (addedImports.isEmpty) {
          addedImports.add(line);
        } else if (addedImports.isNotEmpty && !addedImports.contains(line)) {
          addedImports.add(line);
        }
      }
    });
  }

  // print(">>> addedImports : $addedImports");
  for (var theImport in addedImports) {
    tempTestFileContent.writeln(theImport);
  }
  // addedImports.forEach((theImport){
  //   tempTestFileContent.writeln(theImport);
  // });
  // addedImports.forEach((theImport) => tempTestFileContent.writeln(theImport));

  // Add the main function opening.
  tempTestFileContent.writeln('void main() {');
  tempTestFileContent
      .writeln('  IntegrationTestWidgetsFlutterBinding.ensureInitialized();');

  for (var theContent in tempFileContent) {
    tempTestFileContent.writeln(theContent);
  }

  // Close the main function.
  tempTestFileContent.writeln('}');
  // Write the content to the temporary Dart file.
  File(tempTestFilePath).writeAsStringSync(tempTestFileContent.toString());

  // Run the temporary Dart file using flutter drive. can't work at all.
  // var command =
  //     'flutter drive --driver=integration_test/integration_driver.dart --target=$tempTestFilePath -d chrome';
  // print('Running command: $command');
  // Process.runSync(command, [], runInShell: true);
}

// Function to extract group blocks containing tests with the specified tag.
String extractGroupsWithSpecifiedTag(String fileContent, String specifiedTag) {
  // StringBuffer to hold the content of the temporary file.
  final tempFileContent = StringBuffer();

  bool captureGroup = false;
  bool captureTest = false;
  String groupBlock = '';
  String testBlock = '';
  int testCount = 0;

  // Process each line.
  for (var line in fileContent.split('\n')) {
    if (line.contains('group(')) {
      // We found the start of a new group block.
      captureGroup = true;
      groupBlock = '$line\n';
      // tempFileContent.writeln('$line\n');
    } else if (!captureTest &&
        captureGroup &&
        !line.contains('testWidgets(') &&
        !line.contains('test(') &&
        !line.contains('testGoldens(')) {
      groupBlock += '$line\n';
      // tempFileContent.writeln('$line\n');
    } else if (line.contains('testWidgets(') ||
        line.contains('test(') ||
        line.contains('testGoldens(')) {
      // We found the start of a new test block.
      captureTest = true;

      if (testBlock.isNotEmpty) {
        // deal with previous test function
        final tagsMatch = RegExp(r'tags:\s*(\[[^\]]*\])').firstMatch(testBlock);
        // print("--- the tag : ${tagsMatch?.group(1)!}");

        if (tagsMatch != null &&
            tagsMatch.group(1)!.contains("'$specifiedTag'")) {
          testCount++;
          tempFileContent.writeln(groupBlock);
          tempFileContent.writeln(testBlock);
        }
      }
      testBlock = '$line\n';
    } else if (captureTest && line.trim() != "});" && line.trim() != "}") {
      testBlock += '$line\n';
    } else if (line.trim() == "});" && testBlock.isNotEmpty) {
      // print("--- testBlock : $testBlock");
      final tagsMatch = RegExp(r'tags:\s*(\[[^\]]*\])').firstMatch(testBlock);
      // print("--- the tag : ${tagsMatch?.group(1)!}");
      if (tagsMatch != null &&
          tagsMatch.group(1)!.contains("'$specifiedTag'")) {
        testCount++;
        tempFileContent.writeln(groupBlock);
        tempFileContent.writeln(testBlock);
      }
    }
  }

  if (testCount > 0) {
    tempFileContent.writeln("});");
  }
  // print("--- tempFileContent : $tempFileContent");
  return tempFileContent.toString();
}

Map<String, List<String>> getTestsFromFilePath(
    String fileContent, String theTag) {
  final testsWithTags = <String, List<String>>{};
  // Regex to match the test function and capture its tags.
  final patterns = [
    RegExp(r'testWidgets.*?\((.*?)\s*,\s*tags:\s*(\[[^\]]*\]\);)',
        dotAll: true),
    RegExp(r'test.*?\((.*?)\s*,\s*tags:\s*(\[[^\]]*\]\);)', dotAll: true),
    RegExp(r'testGoldens.*?\((.*?)\s*,\s*tags:\s*(\[[^\]]*\]\);)',
        dotAll: true),
  ];

  for (final pattern in patterns) {
    print('--- the match times : ${pattern.allMatches(fileContent).length}');

    for (var match in pattern.allMatches(fileContent)) {
      final testPrefix = match.group(0);
      if (testPrefix != null) {
        print("--- testPrefix : $testPrefix");
        // final testCode = match.group(1)!;
        // print("--- testCode : $testCode");
        var tags = match.group(2);
        // print("--- tags : $tags");

        if (tags != null && tags.endsWith(");")) {
          tags = tags.replaceRange(tags.length - 2, null, "");
          // print("--- tags : $tags");

          final tagList =
              List<String>.from(jsonDecode(tags.replaceAll("'", '"')));
          print("--- the tag list : $tagList");
          // the match.input means the whole file content
          if (tagList.contains(theTag)) {
            testsWithTags[testPrefix] = tagList;
          }
        }
      }
    }
  }

  return testsWithTags;
}

// Function to extract group blocks and testWidgets with the specified tag. won't use this function any more
String extractTaggedTestsAndWriteTempFile(String fileContent, String theTag) {
  final testWidgetsRegex = RegExp(
      r'testWidgets.*?\((.*?)\s*,\s*tags:\s*(\[[^\]]*\]\));',
      dotAll: true);
  final groupRegex = RegExp(r'group\((.*?)\)\s*\{(.*?)\}', dotAll: true);

  // StringBuffer to hold the content of the temporary file.
  final tempFileContent = StringBuffer();

  // Function to check if the test tags contain the specified tag.
  bool hasTag(List<String> tags, String tag) => tags.any((t) => t == tag);

  // Find all group blocks and process them.
  for (var match in groupRegex.allMatches(fileContent)) {
    final groupName = match.group(1)!;
    print("--- groupName : $groupName");

    final groupBody = match.group(2)!;
    print("--- groupBody : $groupBody");

    // Check all testWidgets within the group for the specified tag.
    for (var testMatch in testWidgetsRegex.allMatches(groupBody)) {
      final testCode = testMatch.group(0)!;
      final tagsString = testMatch.group(2)!;
      final tags =
          List<String>.from(jsonDecode(tagsString.replaceAll("'", '"')));
      print("--- tags : $tags");

      if (hasTag(tags, theTag)) {
        // Add the group header if it's not already added.
        if (!tempFileContent.toString().contains(groupName)) {
          tempFileContent.writeln(groupName);
        }
        // Add the testWidgets function to the temporary file.
        tempFileContent.writeln(testCode);
      }
    }
  }

  print("------------------------------------------------------------- ");
  print(tempFileContent);
  print("------------------------------------------------------------- ");

  return tempFileContent.toString();
}

// Function to extract tests and their tags from a file, then return tests with given 'theTag', won't use anymore
Map<String, List<String>> extractTestsWithTags(String filePath, String theTag) {
  final fileContent = File(filePath).readAsStringSync();
  final testsWithTags = <String, List<String>>{};

  // Regex to match the testWidgets function and capture its tags.
  final testPattern = RegExp(
      r'testWidgets.*?\((.*?)\s*,\s*tags:\s*(\[[^\]]*\]\);)',
      dotAll: true);

  for (var match in testPattern.allMatches(fileContent)) {
    final testPrefix = match.group(0);
    if (testPrefix != null) {
      print("--- testPrefix : $testPrefix");
      // final testCode = match.group(1)!;
      // print("--- testCode : $testCode");
      var tags = match.group(2);
      // print("--- tags : $tags");

      if (tags != null && tags.endsWith(");")) {
        tags = tags.replaceRange(tags.length - 2, null, "");

        final tagList =
            List<String>.from(jsonDecode(tags.replaceAll("'", '"')));
        // print("--- the tag list : $tagList");
        // the match.input means the whole file content
        // testsWithTags[match.input] = tagList;
        testsWithTags[testPrefix] = tagList;
      }
    }
  }

  // print("--- testsWithTags : $testsWithTags");
  return testsWithTags;
}
