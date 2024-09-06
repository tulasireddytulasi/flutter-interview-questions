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



























