import 'dart:convert';
import 'dart:io';
// import 'package:meta/meta.dart';

// Map<String, List<String?>> extractTestsWithTags(String testFilePath) {
void extractTestsWithTags(String testFilePath) {
  // List<String> extractTestCasesWithTag(String testFilePath, String tag) {
  // final testsWithTags = <String, List<String?>>{};
  // const partenString = 'testWidgets.*?((.*?)s*,s*tags:s*([[^]]*\'\$tag\'[^]]*])';
  // final testPattern = RegExp(partenString);
  // final testPattern = RegExp(r'testWidgets.*?\(([^)]+)\s*,\s*tags:\s*(\[[^\]]*\'$tag\'[^\]]*\])', dotAll: true);
  final testPattern =
      RegExp(r'testWidgets.*?\((.*?)\s*,\s*tags:\s*(\[[^\]]*\])', dotAll: true);
  // final tagPattern = RegExp(r'\'(.*?)\'');

  final testFile = File(testFilePath);
  final fileContent = testFile.readAsStringSync();
  final matches = testPattern.allMatches(fileContent);

  for (final match in matches) {
    final testMethod = match.group(1)?.trim();
    final tags = match.group(2);
    // final tagsMatch = tagPattern.allMatches(match.group(2) ?? '');

    // if (testMethod != null && tagsMatch.isNotEmpty) {
    //   final tags = tagsMatch.map((match) => match.group(1)).toList();
    //   testsWithTags[testMethod] = tags;
    // }
    print(">>> testMethod : $testMethod");
    print(">>> other match : $tags");

    // convert the tag string to string list
    final tagList = List<String>.from(jsonDecode(tags!.replaceAll("'", '"')));
    print(">>> the tag list : $tagList");
  }

  // return testsWithTags;
}

// Usage
// void main() {
//   const tag = 'tag1';
//   const testFilePath = 'integration_test/counter_test.dart';

//   final testCases = extractTestCasesWithTag(testFilePath, tag);
//   print(testCases);
// }

void main() {
  const testFilePath = 'integration_test/counter_test.dart';

  extractTestsWithTags(testFilePath);
  // final testsWithTags = extractTestsWithTags(testFilePath);
  // for (final testMethod in testsWithTags.keys) {
  //   final tags = testsWithTags[testMethod];
  //   print('$testMethod: $tags');
  // }
}
