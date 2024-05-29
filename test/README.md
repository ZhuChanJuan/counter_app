# 1.How to write BDD test case in flutter project ?

* Create featuers in the test folder (i tried to create feature file in other folder except test, but test file can't be generated successfully, so i can only use the test folder )
* Create feature file like "login_test.feature" in the features folder
* Execute command in the terminal : **flutter packages pub run build_runner watch --delete-conflicting-outputs**
* Then test file like "login_test_test.dart" will be generated in the test folder automatically
* By the way all test steps like "the app is running.dart" will be generated in the step folder of features folder automatically
* Check whether all test steps could work well
* **Add "IntegrationTestWidgetsFlutterBinding.ensureInitialized();" in each of generated test file ( to support integration test )**
* Run the test cases in the generated test file like "login_test_test.dart" with command : flutter test test/features/login_test_test.dart

# 2.What commands will we use ?

* Generate test files and steps automatically (test files and steps all generated in the test folder by deault, if needs change, we need add build.yaml file ) :
* `	flutter packages pub run build_runner watch --delete-conflicting-outputs`
* **dart run build_runner watch --delete-conflicting-outputs**
* **flutter pub run build_runner watch --delete-conflicting-outputs**

If we use the default settings without build.yaml, then steps folder will be created just under the parent folder of feature file (for example, if login_test.feature in test/features folder, then the login_test_test.dart will be generated in the same path. but test/features/step folder will be generated and all test steps for this feature will be generated in the step folder)

The steps folder you see in the test folder isn't the original location, i change it by setting the "stepFolderName: steps" in the build.yaml file.

* Run the test file without UI : `flutter test test/features/login_test_test.dart `
* Add one lline in the login_test_test.dart to support flutter drive command :  `IntegrationTestWidgetsFlutterBinding.ensureInitialized();`
* Start chrome driver :   `chromedriver --port=4444`
* Run the test file with UI : ` flutter drive --driver=test_driver/integration_test.dart --target=test/features/login_test_test.dart -d chrome`

If we move the login_test_test.dart file and all steps file to integration_test manually, we could

* Run the test file with UI : ` flutter drive --driver=test_driver/integration_test.dart --target=integration_test/homepage/loin_test_test.dart -d chrome  `


# 3.What're the pros and cons ?

Cons :

* **We need add "IntegrationTestWidgetsFlutterBinding.ensureInitialized();" in each of generated test file manually.**
* We can't get the page url in the test steps since we only could use flutter_test package
* We can only locate elements with hard-coded methods of flutter_test like : text, icon, tooltip, key...
* **We can only write test case correctly with understanding frontend code**
* The native test cases can only support Chrome browser
* **Flutter test doesn't support to parse the test steps with import starts like "../../" path, so test steps and files should be in the same folder "test" or "integration_test", otherwise the test steps can't be found**
* Only feature file in test folder could generate test file and steps by default, we need add build.yaml file to change it

```
targets:
  $default:
    sources:
      - test_driver/**        # by default, build runner will not generate code in the test_driver folder
      - integration_test/**   # by default, build runner will not generate code in the integration_test folder . test file in integration_test folder will has `IntegrationTestWidgetsFlutterBinding.ensureInitialized();` automatically
      - test/**
      - lib/**
      - $package$
    builders:
      bdd_widget_test|featureBuilder:
        options:
          stepFolderName: steps  # this trick is required to share steps between widget and integration tests (steps folder will be generated under steps folder)
	# stepFolderName: .../../integration_test/bdd_steps  # this trick is required to share steps between widget and integration tests  (bdd_steps folder will be generated under integration_test folder)

```

# 4.What can we do with BDD ?

* Encapsule commen steps in the step folder
* Make standards for adding new feature file, so those steps could be used
* **It would be great if those fixed steps could be made into feature dropdown menus, that would save much time writing test cases**
* e

# 5.Predefined steps by bdd_widget_test package

This library comes with a list of predefined steps. They will be auto-generated for you, but you may want to adjust their implementation according to your needs.

List of predefined steps:

* I dismiss the page
* I don't see {..} icon
* I don't see {..} rich text
* I don't see {..} text
* I don't see {..} widget
* I enter {..} into {..} input field
* I see disabled elevated button
* I see enabled elevated button
* I see exactly {..} {..} widgets
* I see {..} icon
* I see multiple {..} texts
* I see multiple {..} widgets
* I see {..} rich text
* I see {..} text
* I tap {..} icon
* I tap {..} text
* The app is running

# 6.Configure test step generation

* Create one **build.yaml** file in the root path of project
* Copy and paste the content
* ```
  targets:
    $default:
      sources:
        - test_driver/**        # by default, build runner will not generate code in the test_driver folder
        - integration_test/**   # by default, build runner will not generate code in the integration_test folder
        - test/**
        - lib/**
        - $package$
      builders:
        bdd_widget_test|featureBuilder:
          options:
            stepFolderName: steps  # this trick is required to share steps between widget and integration tests


  ```
  by default, only feature in test folder could generate test steps and test files by the command. but we could add more path in the "sources" folder, so they all could be generated
