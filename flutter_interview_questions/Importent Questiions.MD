# Flutter Main Interview Questions:

##### 1. What is Deep linking in flutter? give example

Deep linking in Flutter refers to the ability to navigate directly to a specific screen or location
within your app from an external source, such as a website, another app, or a system-level action (
e.g., a push notification). This allows you to provide a seamless user experience by taking users
directly to the relevant content without requiring them to navigate through multiple screens.

To implement deep linking in Flutter, you need to configure platform-specific settings and handle
the incoming deep links within your app. Here's an example of how you can set up deep linking
inFlutter:

**Step 1: Configure platform-specific settings**

**Android**:
For Android, you need to define the deep link routes in your android/app/src/main/*
*AndroidManifest.xml** file:

```xml

<manifest>
    <activity>
        <intent-filter>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.DEFAULT" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:host="example.com" android:pathPrefix="/productDetails"
                android:scheme="https" />
        </intent-filter>
    </activity>
</manifest>
```

**IOS**:
For iOS, you need to define the deep link routes in your ios/Runner/**Info.plist** file:

```xml

<dict>
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>example</string>
            </array>
        </dict>
    </array>
    <key>CFBundleURLName</key>
    <string>com.example.myapp</string>
</dict>
```

**Step 2: Handle incoming deep links in your Flutter app**

In your Flutter app, you need to listen for incoming deep links and handle them accordingly. You can
use the **getInitialLink** and **getLinksStream** methods from the **flutter/services.dart**
library:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _initialLink;

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  Future<void> initDeepLinks() async {
    String initialLink;
    try {
      initialLink = await getInitialLink();
      setState(() {
        _initialLink = initialLink;
      });
    } on PlatformException {
      _initialLink = 'Failed to get initial link.';
    }

    getLinksStream().listen((String link) {
      setState(() {
        _initialLink = link;
      });
      // Handle the incoming deep link
      handleDeepLink(link);
    });
  }

  void handleDeepLink(String link) {
    // Parse the deep link and navigate to the appropriate screen
    if (link.contains('/productDetails')) {
      final productId = link
          .split('/')
          .last;
      Navigator.pushNamed(context, '/productDetails', arguments: productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deep Link Example',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/productDetails': (context) =>
            ProductDetailsScreen(
              productId: ModalRoute
                  .of(context)
                  .settings
                  .arguments as String,
            ),
      },
    );
  }
}
```

In this example:

1. We initialize the deep linking setup in the **initState** method of our **_MyAppState** class.
2. We use the **getInitialLink** method to retrieve the initial deep link if the app was launched
   from a deep link.
3. We listen for incoming deep links using the **getLinksStream** method and handle them in the *
   *handleDeepLink** method.
4. In the **handleDeepLink** method, we parse the deep link and navigate to the appropriate screen (
   e.g., **/productDetails** in this case).
5. We define the app routes and create a **ProductDetailsScreen** widget that accepts the product ID
   as an argument.

With this setup, when a user clicks on a deep link (e.g., **https://example.com/productDetails/123
**), the app will be launched (or resumed if already running), and the **ProductDetailsScreen** will
be displayed with the corresponding product ID (**123** in this case).

Deep linking is a powerful feature that can significantly improve the user experience by providing
direct access to specific content within your app. It's important to configure deep linking
correctly for both Android and iOS platforms to ensure a seamless experience across different
devices and platforms.

------------

##### 2. What is dependency Injection in flutter and give example

**Dependency Injection** (DI) is a software design pattern that allows you to decouple the creation
and management of object dependencies from the objects themselves. In Flutter, DI is often used to
provide instances of classes or services to other parts of the application that require them,
without those parts having to create or manage those dependencies directly.

There are several ways to implement **Dependency Injection** in Flutter, but one common approach is
to use a package like **get_it** or **injectable**.

------------

##### 3. How to Implement Flavours in Flutter?

https://www.mouritech.com/it-technical-articles/implementing-flutter-flavors-for-android-ios-applications/

**Android (app/build.gradle)**:

    android {
        flavorDimensions "default"
        productFlavors {
            sit {
                dimension "default"
                resValue "string","app_name","Karkinos SIT"
                applicationIdSuffix ".sit"
                flutter.target "lib/main_sit.dart"
            }
            qa {
                dimension "default"
                resValue "string","app_name","Karkinos QA"
                applicationIdSuffix ".qa"
                flutter.target "lib/main_qa.dart"
            }
            prod {
                dimension "default"
                resValue "string","app_name","Karkinos"
                applicationIdSuffix ""
                flutter.target "lib/main_prod.dart"
            }
        }
        namespace 'com.karkinos'
    }

1. Edit `android/app/build.gradle`:
    - Add `flavorDimensions "default"`
    - Define product flavors (e.g., dev and prod) with specific applicationId and resValue

2. Create flavor-specific folders in `android/app/src/`:
    - E.g., `dev` and `prod` folders

3. Update `pubspec.yaml` with flavor configurations

4. Create a `Flavor` enum and helper class in Dart

5. Modify `main.dart` to use the appropriate flavor

6. Run the app using:
   `flutter run --flavor dev` or `flutter run --flavor prod`

This setup allows different app configurations (package name, app name, etc.) based on the selected
flavor, useful for managing development and production builds.

------------

##### 4. How to implement Flovours in Flutter IOS?

To implement flavors in Flutter for iOS:

1. Create different build configurations in Xcode (e.g., Debug-Dev, Release-Dev).
2. Set up schemes in Xcode for each flavor.
3. Add a "Flavor" key to Info.plist.
4. Update the Podfile to handle flavors.
5. Configure flavors in pubspec.yaml.
6. Create a Flavor enum and helper class in Dart.
7. Use the flavor in main.dart.
8. Run with `flutter run ios --flavor dev` or `flutter run ios --flavor prod`.

This allows for different app configurations (e.g., app name, bundle ID) based on the selected
flavor, useful for development and production environments.


------------

##### 5. What is the pupose of http_interceptor library in flutter?

The `http_interceptor` library in Flutter is used to add interceptors to HTTP requests and
responses. This allows developers to implement cross-cutting concerns such as logging, error
handling, authentication, and modifying requests or responses without scattering such logic
throughout the codebase.

##### Purpose of `http_interceptor` Library

1. **Logging**: Interceptors can be used to log HTTP requests and responses for debugging and
   monitoring purposes.

2. **Authentication**: Automatically add authentication tokens to headers of outgoing requests.

3. **Error Handling**: Intercept responses to handle errors in a centralized place, such as
   refreshing tokens or displaying error messages.

4. **Modifying Requests and Responses**: Modify outgoing requests (e.g., adding headers, changing
   endpoints) and incoming responses (e.g., transforming data).

5. **Retry Logic**: Implement retry logic for failed requests without having to duplicate the code
   where the requests are made.

##### Benefits:

- **Separation of Concerns:** Keeps cross-cutting concerns separated from business logic.
- **Reusability:** Interceptors can be reused across multiple HTTP clients or projects.
- **Maintainability:** Makes it easier to manage and update HTTP-related logic in one place.

By using the `http_interceptor` library, developers can ensure that their HTTP requests and
responses are handled consistently and cleanly across their Flutter applications.

------------

##### 6. What is the difference between http and Dio package?

Here's a concise comparison between the http and Dio packages in Flutter:

1. Features:
    - http: Basic, lightweight, part of Dart's standard library
    - Dio: Feature-rich, supports more advanced use cases

2. Interceptors:
    - http: Not built-in
    - Dio: Supports request/response interceptors

3. Request cancellation:
    - http: Not supported natively
    - Dio: Supports request cancellation

4. Timeout handling:
    - http: Basic timeout support
    - Dio: More advanced timeout options

5. File uploading:
    - http: Basic support
    - Dio: More robust file upload capabilities

6. Download tracking:
    - http: Not built-in
    - Dio: Supports download progress tracking

7. Error handling:
    - http: Basic error types
    - Dio: More detailed error information

8. Transformers:
    - http: Not built-in
    - Dio: Supports request/response transformers

9. Configuration:
    - http: Minimal configuration options
    - Dio: Highly configurable (base options, etc.)

10. Learning curve:

- http: Simpler, easier for beginners
- Dio: More complex, but powerful for advanced use cases

In summary, http is simpler and sufficient for basic needs, while Dio offers more features and
flexibility for complex networking requirements.

------------

##### 7. What is test coverage in flutter unit testing?

Here's a concise answer suitable for an interview:

Test coverage in Flutter unit testing:

1. Measures the percentage of code executed by tests
2. Run with `flutter test --coverage`
3. Generates lcov report
4. Helps identify untested code
5. Aim for high coverage (e.g., >80%) but focus on critical paths
6. Can be viewed with lcov tools or IDE plugins
7. Important metric, but test quality matters too
8. Useful for ensuring comprehensive testing of codebase

Remember, while high coverage is good, it doesn't guarantee bug-free code. The relevance and quality
of tests are equally important.

------------

##### 8. what is fatel error and non - fatel error in Firebase Analytics?

Here's a concise explanation of fatal and non-fatal errors in Firebase Analytics, suitable for an
interview:

Fatal errors:

1. Cause app to crash or terminate unexpectedly
2. Severely impact user experience
3. Automatically reported by Firebase Crashlytics
4. Examples: null pointer exceptions, out of memory errors

Non-fatal errors:

1. Don't cause app termination
2. May degrade user experience but allow continued app use
3. Need to be manually logged using Firebase Analytics
4. Examples: network timeouts, minor UI glitches, caught exceptions

Key differences:

- Impact: Fatal errors end the session, non-fatal don't
- Reporting: Fatal are auto-reported, non-fatal require manual logging
- Analysis: Both help improve app stability but are analyzed differently

Logging non-fatal errors helps track issues that don't crash the app but still affect user
experience. This information is valuable for improving overall app quality and performance.

------------

##### 9. How to change App name in IOS and Android?

Here's a concise guide to changing the app name in iOS and Android for a Flutter project:

iOS:

1. Open iOS module in Xcode
2. Go to Runner target > General tab
3. Edit "Display Name" field
4. Update Info.plist: CFBundleDisplayName and CFBundleName

Android:

1. Open android/app/src/main/AndroidManifest.xml
2. Update android:label in <application> tag
3. For different names per flavor, edit android/app/build.gradle:
    - In productFlavors, set resValue "string", "app_name", "Your App Name"

Flutter:

- Update app name in pubspec.yaml under flutter > name

For localized names:

- iOS: Use localizable.strings files
- Android: Use strings.xml in res/values-[language code] folders

Remember to clean and rebuild your project after making these changes.

This approach allows you to set different app names for iOS and Android, and even for different
build flavors if needed.

------------

##### 10. What is Dart Analyser?

Here's a concise explanation of the Dart Analyzer, suitable for an interview:

The Dart Analyzer is a static analysis tool that:

1. Examines Dart code without executing it
2. Identifies potential errors, warnings, and style issues
3. Enforces best practices and coding standards
4. Checks for type safety in Dart's type system
5. Provides quick fixes and refactoring suggestions
6. Integrates with IDEs and editors for real-time feedback
7. Can be run from the command line using 'dart analyze'
8. Uses analysis options defined in analysis_options.yaml
9. Helps improve code quality and catch issues early
10. Is customizable to fit project-specific needs

Key benefits:

- Catches errors before runtime
- Improves code consistency across teams
- Enhances code maintainability and readability

The Dart Analyzer is an essential tool for Flutter and Dart developers, helping to produce higher
quality, more reliable code.

------------

