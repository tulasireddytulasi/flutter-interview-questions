# Flutter Main Interview Questions:

##### 1. What is Deep linking in flutter? give example

Deep linking in Flutter refers to the ability to navigate directly to a specific screen or location
within your app from an external source, such as a website, another app, or a system-level action (
e.g., a push notification). This allows you to provide a seamless user experience by taking users
directly to the relevant content without requiring them to navigate through multiple screens.

To implement deep linking in Flutter, you need to configure platform-specific settings and handle
the incoming deep links within your app. Here's an example of how you can set up deep linking in
Flutter:

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

































