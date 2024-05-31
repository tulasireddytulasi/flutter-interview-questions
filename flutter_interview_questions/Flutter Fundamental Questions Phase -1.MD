# Flutter Fundamental Questions:

##### 1. What is Flutter?

Flutter is an open-source mobile app development framework created by Google. It allows developers to build high-performance, visually attractive, and natively compiled applications for mobile, web, and desktop platforms using a single codebase.

--------

##### 2.  What is Dart?

Dart is the programming language used by Flutter. It's an object-oriented, class-based language that is easy to learn, especially for those familiar with languages like Java or C#. Dart code is compiled into native machine code, ensuring high performance and smooth UI rendering.

--------

##### 3. What is Flutter render pipe line?

The Flutter render pipeline is the process through which Flutter converts the widget tree into a visual representation on the screen. It consists of several phases:
1. The widget tree is created and updated based on the app's state.
2. The render tree is generated from the widget tree, containing lightweight render objects.
3. The render tree is walked to compute the layout of each render object.
4. Painting is performed by traversing the render tree and drawing each object on the canvas.

--------

##### 4. How the widgets render?

Widgets in Flutter are the building blocks of the user interface. They are immutable descriptions of UI elements, and when a widget's state changes, Flutter creates a new instance of the widget, compares it with the previous one, and efficiently updates the render tree with the necessary changes.

--------

##### 5. What is widget tree, Element tree, Render tree?
 **Widget Tree**:

- The widget tree is a representation of the UI using Flutter's widget classes.
- It's an immutable, declarative description of the UI, created by composing widgets together.
- Widgets are lightweight, stateless UI descriptions that define how the UI should look and behave.
- When the app's state changes, a new widget tree is created and compared with the previous one to determine the necessary updates.

**Element Tree**:

- The element tree is a lightweight tree that maps one-to-one with the widget tree.
- Elements are created for each widget and act as a bridge between the widget tree and the render tree.
- Elements store the configuration for a widget and manage its lifecycle, such as building the render object and handling state updates.
- When a widget is rebuilt, its corresponding element is updated with the new configuration.

**Render Tree**:

- The render tree is a separate tree of render objects that represent the UI elements on the device's screen.
- Render objects are heavyweight objects that handle the layout, painting, and compositing of the UI.
- Each element in the element tree is responsible for creating and managing its corresponding render object.
- The render tree is traversed to compute layout, paint, and composite the UI onto the device's screen.

##### The relationship between these trees is as follows:

1. The widget tree is a declarative UI description and the root of the Flutter rendering pipeline.
2. The element tree is created from the widget tree and manages the widget lifecycle and configuration.
3. The render tree is created from the element tree and contains the actual objects that handle layout, painting, and compositing of the UI on the device's screen.

When the app's state changes, a new widget tree is created, which triggers updates to the element tree and, subsequently, the render tree. This separation of concerns allows Flutter to efficiently update only the parts of the UI that have changed, resulting in smooth and performant UI rendering.

--------
##### 6. What is tree shaking and how to implement in code?

Tree shaking is a process in Flutter that removes unused code from the final compiled application. It analyzes the codebase, identifies the parts that are not being used, and trims them away, resulting in a smaller application size and improved performance. To implement tree shaking, you need to follow best practices, such as:

- Using code splitting and lazy loading to load code only when needed.
- Avoiding importing unnecessary libraries or packages.
- Enabling tree shaking in the build configuration for release builds.

--------

##### 7. What is Dev tools?

DevTools is a suite of performance tooling provided by Flutter for debugging, profiling, and analyzing Flutter applications. It includes tools like:
- Widget Inspector: Allows you to explore the widget tree and view widget properties.
- Timeline: Visualizes the app's rendering performance and identifies potential bottlenecks.
- Memory: Monitors memory usage and helps identify memory leaks.
- Logging: Provides a structured view of log output from the app.
- Network: Inspects network traffic and HTTP requests made by the app.

DevTools is an essential tool for optimizing Flutter applications and understanding their performance characteristics.

------------

##### 8. What is Flutter inspector?

Flutter inspector is a tool that helps in visualizing and exploring the widget trees. It helps in understanding the present layout and diagnoses various layout issues.

------------

##### 9. What are 3 layers of Flutter?

Upper layers: The Dart-based platform that takes care of app widgets, gestures, animations, illustrations, and materials; 
Flutter engine: Handles the display and formatting of text. 
Built-in service: Used for the management of plugins, packages, and event loops.

------------



