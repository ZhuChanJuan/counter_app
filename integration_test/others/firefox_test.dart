import 'package:test/test.dart';
import 'package:webdriver/async_io.dart';

void main() {
  // WebDriver? driver;

  // setUpAll(() async {
  //   // Set up the WebDriver capabilities
  //   final capabilities = Capabilities.firefox;

  //   // Create the WebDriver instance
  //   driver = await createDriver(
  //     desired: capabilities,
  //   );
  // });

  // tearDownAll(() async {
  //   // Close the WebDriver session
  //   await driver?.quit();
  // });

  test('My Flutter Web Test', () async {
    final driver = await createDriver(
      desired: {
        Capabilities.browserName: 'edge',
        // Capabilities.browserName: 'firefox',
      },
    );

    await driver.get('https://flutter.dev');
    Future.delayed(const Duration(seconds: 2));
    await driver.quit();
  });
}


    // Navigate to your Flutter web app
    // await driver.get('https://pulse-nprd.wedopulse.com/uat/my/welcome');