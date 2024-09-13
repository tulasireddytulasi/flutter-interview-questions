### Dart Interview Questions:

------------

#### 1. What is final, const, var and dynamic in Dart?

- **`final`**: The variable is assigned once at runtime and cannot be modified afterward.

- **`const`**: The value is determined at compile-time and is deeply immutable, meaning it can't be changed at all during runtime.

- **`var`**: The type is inferred at compile-time based on the initial value, and it cannot change to a different type later.

- **`dynamic`**: Allows a variable to hold any type, with type checks deferred until runtime, making it flexible but less safe.

------------

#### 2. What Value Types and Reference Types in dart?

In Dart, data types are categorized into value types and reference types:

##### Value Types:
- **Description**: Value types are simple types where the variable holds the actual data. When you assign a value type variable to another variable, a copy of the value is created.
- **Examples**: `int`, `double`, `bool`, `enum`, and `runes`.
- **Behavior**: Modifying one variable does not affect the other because they are separate copies.

##### Reference Types:
- **Description**: Reference types are more complex types where the variable holds a reference (or pointer) to the data rather than the data itself. When you assign a reference type variable to another variable, both variables refer to the same data in memory.
- **Examples**: `String`, `List`, `Map`, `Set`, and user-defined classes (objects).
- **Behavior**: Modifying the data through one variable affects all references to that data.

In summary, value types store the actual value and are copied on assignment, while reference types store references to the data and share the data across variables.

Here’s a small example to illustrate value types and reference types in Dart:

##### Value Type (e.g., `int`):
```dart
int a = 5;
int b = a;  // b gets a copy of the value of a
b = 10;     // Changing b does not affect a

print(a);  // Output: 5
print(b);  // Output: 10
```

##### Reference Type (e.g., `List`):
```dart
List<int> x = [1, 2, 3];
List<int> y = x;  // y references the same list as x
y[0] = 100;       // Changing y affects x

print(x);  // Output: [100, 2, 3]
print(y);  // Output: [100, 2, 3]
``` 

In the value type example, `a` and `b` are independent. In the reference type example, `x` and `y` point to the same list.

Here’s an example that demonstrates value and reference types using a class in Dart:

##### Reference Type Example (Class):
```dart
class Person {
  String name;
  
  Person(this.name);
}

void main() {
  Person person1 = Person('John');
  Person person2 = person1;  // person2 references the same object as person1
  
  person2.name = 'Doe';      // Modifying person2 affects person1
  
  print(person1.name);  // Output: Doe
  print(person2.name);  // Output: Doe
}
```

##### Explanation:
- `Person` is a reference type (class).
- `person1` and `person2` reference the same object in memory.
- Changing the `name` using `person2` affects `person1` because both variables point to the same object.

#### 3. What is Deep Copy?

A **deep copy** is a process in which a new object is created that is an exact replica of the original object, but with completely independent copies of all nested objects and fields. This means that any changes made to the deep copy do not affect the original object, and vice versa.

##### Key Characteristics:
1. **Independent Copies**: A deep copy duplicates not only the top-level object but also all objects referenced by that object (i.e., nested objects).
2. **No Shared References**: After a deep copy, the original and copied objects are fully independent. Changing one does not affect the other.

##### Deep Copy vs. Shallow Copy:
- **Shallow Copy**: Only the top-level object is copied, and the references to nested objects are shared. Modifying a nested object in one copy will affect the other.
- **Deep Copy**: A new instance is created for both the top-level object and all nested objects, ensuring full independence.

##### Example:
##### Shallow Copy:
```dart
List<int> originalList = [1, 2, 3];
List<int> shallowCopy = originalList;  // References the same list
shallowCopy[0] = 100;

print(originalList);  // Output: [100, 2, 3] (original is affected)
```

##### Deep Copy:
```dart
List<int> originalList = [1, 2, 3];
List<int> deepCopy = List.from(originalList);  // Creates a new list

deepCopy[0] = 100;

print(originalList);  // Output: [1, 2, 3] (original is unaffected)
print(deepCopy);      // Output: [100, 2, 3] (deep copy is modified)
```

##### When to Use Deep Copy:
- When you want to duplicate an object without any shared state between the original and copied objects, especially when dealing with complex objects or data structures.

##### **Copy Constructor (Recommended for Simple Classes)**:
   - A copy constructor creates a new instance of the class, copying the fields from the original object.

```dart
class Person {
  String name;
  
  // Copy constructor
  Person.copy(Person other) : name = other.name;
}

void main() {
  Person person1 = Person('John');
  Person person2 = Person.copy(person1);  // Create a copy of person1
  
  person2.name = 'Doe';  // Modifying person2 does not affect person1
  
  print(person1.name);  // Output: John
  print(person2.name);  // Output: Doe
}
```

------------

#### 4. What factory keyword in Dart?

In Dart, the **`factory`** keyword is used to define a constructor that can return an instance of a class, which may or may not be a new object. It allows more flexibility compared to a regular constructor by enabling logic before deciding whether to create a new instance or return an existing one (e.g., for caching or singleton patterns).

### Key Use Cases:
1. **Control Instance Creation**: Return an existing instance (like a singleton) or decide which subclass to return.
2. **Custom Initialization Logic**: Perform operations before creating the instance.

### Example:
```dart
class Logger {
  static final Logger _instance = Logger._internal();  // Singleton instance

  factory Logger() {
    return _instance;  // Always returns the same instance
  }

  Logger._internal();  // Private constructor
}

void main() {
  var logger1 = Logger();
  var logger2 = Logger();

  print(logger1 == logger2);  // Output: true (both are the same instance)
}
```

In this example, `Logger()` uses the `factory` constructor to always return the same instance, implementing the **singleton pattern**.

------------


#### 5. What are extension methods in Dart? How do they help improve code reusability and flexibility?

**Extension methods in Dart** allow you to add new functionality to existing classes without modifying the original class or creating a subclass. You can "extend" classes like `String`, `List`, or even your own custom classes with additional methods.

### Key Benefits:
- **Improves code reusability**: You can add methods to frequently used classes, making the code cleaner and more reusable.
- **Increases flexibility**: No need to modify or subclass existing classes, which is useful when working with third-party libraries.

### Example:
```dart
extension StringExtension on String {
  String reverse() => split('').reversed.join();
}

void main() {
  print('hello'.reverse());  // Output: olleh
}
```

This allows you to call `reverse()` on any `String` object without modifying the original `String` class.

------------

#### 6. What in Null Safety in Flutter? and its operators

**Null Safety** in Dart (and thus Flutter) is a feature that ensures variables cannot contain `null` values unless explicitly allowed. This helps avoid common runtime errors like `null` dereferencing, making your code safer and more robust.

##### Key Features:
1. **Non-nullable by default**: Variables cannot hold `null` unless explicitly declared as nullable.
2. **Nullable types**: Use a `?` to allow a variable to hold a `null` value.

##### Null Safety Operators:
1. **`?` (Nullable Type)**: Allows a variable to hold a `null` value.
   ```dart
   String? name;  // `name` can be null
   ```
   
2. **`!` (Null Assertion)**: Asserts that a nullable variable is non-null at that point.
   ```dart
   String? name;
   print(name!);  // Throws an error if `name` is null
   ```

3. **`??` (Null Coalescing)**: Provides a fallback value if the variable is `null`.
   ```dart
   String? name;
   print(name ?? 'Unknown');  // Output: 'Unknown' if `name` is null
   ```

4. **`?.` (Null-aware Access)**: Safely accesses a property or method, only if the object is not `null`.
   ```dart
   String? name;
   print(name?.length);  // Returns `null` if `name` is null
   ```

##### Example:
```dart
String? name = null;
int length = name?.length ?? 0;  // Safely handles null and gives default value
```

##### Benefits:
- Avoids `NullPointerExceptions`.
- Helps catch potential null-related issues at compile-time.

------------

#### 7. Explain the advanced enum in Dart 2.17

Here are single-line points explaining advanced enums in Dart:

In **Dart 2.17**, enums were significantly enhanced to provide more flexibility and functionality. These advanced enums are much more powerful than traditional enums, allowing enums to hold data and have methods. Here’s a breakdown of the key features introduced:

##### Key Features of Advanced Enums in Dart 2.17:

1. **Enums with Fields**:
   - Enums can now have properties/fields, allowing each enum value to hold additional data.
   - Each enum value can store unique data for these fields.
   - Example:
     ```dart
     enum Weather {
       sunny(30),
       rainy(20),
       snowy(0);

       final int temperature;

       const Weather(this.temperature);
     }

     void main() {
       print(Weather.sunny.temperature); // Output: 30
     }
     ```

2. **Enums with Methods**:
   - You can define methods within an enum, enabling more complex behavior associated with enum values.
   - Example:
     ```dart
     enum Vehicle {
       car,
       bike,
       bus;

       void start() {
         switch (this) {
           case Vehicle.car:
             print('Starting a car...');
             break;
           case Vehicle.bike:
             print('Starting a bike...');
             break;
           case Vehicle.bus:
             print('Starting a bus...');
             break;
         }
       }
     }

     void main() {
       Vehicle.car.start(); // Output: Starting a car...
     }
     ```

3. **Enums with Named Constructors**:
   - Enum constructors can be named, providing flexibility when initializing enum values.
   - Example:
     ```dart
     enum Beverage {
       coffee(price: 5),
       tea(price: 3);

       final int price;

       const Beverage({required this.price});
     }

     void main() {
       print(Beverage.coffee.price); // Output: 5
     }
     ```

4. **Interfaces and Mixins in Enums**:
   - Enums can implement interfaces and mixins, allowing enums to behave more like classes with advanced capabilities.
   - Example:
     ```dart
     abstract class Drivable {
       void drive();
     }

     enum Vehicle implements Drivable {
       car,
       bike;

       @override
       void drive() {
         print('$this is being driven.');
       }
     }

     void main() {
       Vehicle.car.drive(); // Output: Vehicle.car is being driven.
     }
     ```

5. **Enum Index and Name Properties**:
   - Enums automatically get a `name` and `index` property.
   - `index`: The position of the enum value in the declaration (starting from 0).
   - `name`: The string representation of the enum value's name.
   - Example:
     ```dart
     enum Color {
       red,
       green,
       blue,
     }

     void main() {
       print(Color.red.index); // Output: 0
       print(Color.green.name); // Output: green
     }
     ```

6. **Enum with Static Methods**:
   - Enums can contain static methods to provide additional functionality.
   - Example:
     ```dart
     enum DaysOfWeek {
       monday,
       tuesday,
       wednesday;

       static DaysOfWeek getDayByIndex(int index) {
         return DaysOfWeek.values[index];
       }
     }

     void main() {
       print(DaysOfWeek.getDayByIndex(1)); // Output: DaysOfWeek.tuesday
     }
     ```

##### Summary of Advanced Enum Features:
- **Fields**: Each enum value can hold associated data.
- **Methods**: Enum values can have methods to define behavior.
- **Named Constructors**: Provides flexibility in initializing enum values.
- **Interfaces and Mixins**: Enums can implement interfaces for more complex behavior.
- **Properties**: Enums have `index` and `name` by default.
- **Static Methods**: Static utility methods can be added to enums.

These advanced enums make enums in Dart far more versatile and closer to the functionality you’d expect from full-fledged classes.

------------

#### What are **Dart Keywords**:

1. **abstract** – Used to define abstract classes that can't be instantiated directly.
2. **as** – Used for type casting.
3. **assert** – Used to make assertions for debugging purposes.
4. **async** – Used for asynchronous functions or methods.
5. **await** – Used to pause execution until a `Future` is completed in an `async` function.
6. **break** – Exits a loop or switch statement.
6. **base** – Used to mark a class as extendable by direct subclasses but prevents further inheritance beyond them.
7. **case** – Used in a `switch` statement to define different cases.
8. **catch** – Used to handle exceptions in a `try-catch` block.
9. **class** – Defines a class.
10. **const** – Declares a compile-time constant value.
11. **continue** – Skips the remaining code in a loop iteration and starts the next iteration.
12. **covariant** – Specifies that a method parameter’s type can be overridden with a subtype.
13. **default** – Defines the default case in a `switch` statement.
14. **deferred** – Used for deferred loading of libraries.
15. **do** – Defines the beginning of a `do-while` loop.
16. **dynamic** – Represents a type that disables static type checking.
17. **else** – Defines the alternative branch of an `if` statement.
18. **enum** – Declares an enumeration.
19. **export** – Exports functionality from a library.
20. **extends** – Indicates inheritance of a class.
21. **extension** – Adds new functionality to existing classes without modifying them.
22. **external** – Declares that a function or variable will be provided outside of Dart.
23. **factory** – Used to define a constructor that can return an instance or a subclass.
24. **false** – Represents the boolean value `false`.
25. **final** – Declares a variable that can only be set once.
26. **finally** – Specifies code to execute after a `try` block, regardless of whether an exception was thrown.
27. **for** – Starts a `for` loop.
28. **Function** – Represents a function object.
29. **get** – Defines a getter in a class.
30. **if** – Starts an `if` conditional statement.
31. **implements** – Indicates that a class implements an interface.
32. **import** – Imports a library into the file.
33. **in** – Used in a `for-in` loop to iterate over collections.
34. **interface** – Not used in Dart; interfaces are defined using classes.
35. **is** – Checks if an object is of a specific type.
36. **late** – Allows for lazy initialization of non-nullable variables.
37. **library** – Specifies a library name.
38. **mixin** – Declares a mixin.
39. **new** – Instantiates an object (optional in Dart 2).
40. **null** – Represents the absence of a value.
41. **on** – Used in `catch` clauses to specify exception types, or in mixin declarations.
42. **operator** – Defines an operator overload for a class.
43. **part** – Includes a part of a library.
44. **required** – Marks a named parameter as required.
45. **rethrow** – Re-throws the caught exception.
46. **return** – Returns a value from a function or method.
47. **set** – Defines a setter in a class.
48. **show** – Limits the scope of an imported library.
49. **static** – Declares a static class member.
50. **super** – Refers to the superclass of a class.
51. **switch** – Defines a switch statement.
52. **sync** – Marks a generator function that returns an iterable.
53. **this** – Refers to the current instance of a class.
54. **throw** – Throws an exception.
55. **true** – Represents the boolean value `true`.
56. **try** – Starts a `try-catch` block to handle exceptions.
57. **typedef** – Declares a function type alias.
58. **var** – Declares a variable with automatic type inference.
59. **void** – Specifies that a function doesn’t return a value.
60. **while** – Starts a `while` loop.
61. **with** – Implements mixin functionality in a class.
62. **yield** – Pauses a generator function and returns a value.

These keywords are integral to the Dart programming language and serve specific syntactic purposes in code.

------------





















