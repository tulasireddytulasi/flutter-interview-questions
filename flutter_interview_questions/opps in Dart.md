Object-Oriented Programming (OOP) is a programming paradigm based on the concept of objects, which can contain data and code that manipulates that data. Dart, being an object-oriented language, fully supports OOP principles. Here's how OOP concepts are implemented in Dart:

### 1. **Classes and Objects**
   - **Class:** A blueprint for creating objects (instances). It defines the properties and methods that the objects created from the class can have.
   - **Object:** An instance of a class. Objects are concrete entities that have the attributes and behaviors defined by their class.

   ```dart
   class Car {
     String brand;
     int year;

     Car(this.brand, this.year);

     void drive() {
       print('$brand is driving');
     }
   }

   void main() {
     var myCar = Car('Toyota', 2022);
     myCar.drive(); // Outputs: Toyota is driving
   }
   ```

### 2. **Encapsulation**
   - **Definition:** The bundling of data (variables) and methods that operate on the data into a single unit, or class. Dart supports encapsulation through access modifiers.
   - **Access Modifiers:** In Dart, encapsulation is enforced using the `_` prefix, making properties or methods private to the library.

   ```dart
   class BankAccount {
     double _balance = 0; // Private field

     void deposit(double amount) {
       _balance += amount;
     }

     double get balance => _balance; // Public getter
   }
   ```

### 3. **Inheritance**
   - **Definition:** The mechanism by which one class (child or subclass) can inherit the properties and methods of another class (parent or superclass). Dart supports single inheritance.
   - **Syntax:** The `extends` keyword is used to define a subclass.

   ```dart
   class Vehicle {
     void start() {
       print('Vehicle started');
     }
   }

   class Car extends Vehicle {
     void honk() {
       print('Car honking');
     }
   }

   void main() {
     var myCar = Car();
     myCar.start(); // Inherited from Vehicle
     myCar.honk();  // Defined in Car
   }
   ```

### 4. **Polymorphism**
   - **Definition:** The ability for different classes to be treated as instances of the same class through inheritance. Polymorphism is achieved in Dart through method overriding and interfaces.
   - **Method Overriding:** A subclass can provide its specific implementation for a method that is already defined in its superclass.

   ```dart
   class Animal {
     void sound() {
       print('Animal sound');
     }
   }

   class Dog extends Animal {
     @override
     void sound() {
       print('Bark');
     }
   }

   void main() {
     Animal myDog = Dog();
     myDog.sound(); // Outputs: Bark
   }
   ```

### 5. **Abstraction**
   - **Definition:** Abstraction is the concept of hiding the complex implementation details and showing only the essential features of an object.
   - **Abstract Classes:** Dart uses `abstract` classes to define interfaces with abstract methods that must be implemented by subclasses.

   ```dart
   abstract class Shape {
     void draw(); // Abstract method
   }

   class Circle extends Shape {
     @override
     void draw() {
       print('Drawing a circle');
     }
   }

   void main() {
     Shape shape = Circle();
     shape.draw(); // Outputs: Drawing a circle
   }
   ```

### Summary
In Dart, OOP principles like encapsulation, inheritance, polymorphism, and abstraction are key to building structured and maintainable applications. Dart's object-oriented features allow you to model real-world problems effectively using classes and objects, making the code more reusable, scalable, and easier to manage.

------------

#### 2. Diff b/w abstract and interface in dart

In Dart, both **abstract classes** and **interfaces** are used to define structure and enforce a contract for other classes to follow, but they differ in several key ways:

##### 1. **Abstract Class:**
   - **Definition:** An abstract class is a class that cannot be instantiated directly. It can have both concrete (implemented) and abstract methods.
   - **Purpose:** Used to provide partial implementation that other classes can extend and complete.
   - **Method Implementation:** Can contain implemented methods and fields that a subclass can inherit.
   - **Usage:** Classes that extend an abstract class inherit its implemented methods and fields.

   ```dart
   abstract class Animal {
     void sound();  // Abstract method
     void walk() {
       print("Animal walking");
     }
   }

   class Dog extends Animal {
     @override
     void sound() {
       print("Bark");
     }
   }
   ```

##### 2. **Interface (Using `implements`):**
   - **Definition:** Dart does not have a separate keyword for interfaces; instead, every class can be treated as an interface. When a class implements another class (interface), it must provide its own implementation for **all** methods, even if they have been implemented in the class being implemented.
   - **Purpose:** Enforces that a class provides its own implementation for all methods and fields from the class it implements.
   - **Method Implementation:** All methods must be overridden, even if they are already implemented in the class used as an interface.
   - **Usage:** A class can implement multiple interfaces.

   ```dart
   class Printer {
     void printDocument();
   }

   class Scanner {
     void scanDocument();
   }

   class AllInOneDevice implements Printer, Scanner {
     @override
     void printDocument() {
       print("Printing...");
     }

     @override
     void scanDocument() {
       print("Scanning...");
     }
   }
   ```

##### Key Differences:
| Feature                   | Abstract Class                          | Interface (Implements)                  |
|---------------------------|------------------------------------------|-----------------------------------------|
| **Keyword**                | `abstract`                              | `implements`                            |
| **Method Implementation**  | Can have both abstract and concrete methods | Must implement all methods, even concrete ones |
| **Instantiation**          | Cannot be instantiated                  | N/A (It's not a separate construct)     |
| **Multiple Inheritance**   | Can extend only one abstract class       | Can implement multiple interfaces       |
| **Usage**                  | Used for partial implementation         | Used for enforcing method signatures    |

In summary, abstract classes in Dart are used when you want to provide partial implementation and inheritance, while interfaces (using `implements`) enforce that all methods are implemented in the class, promoting flexibility through multiple interface implementations.