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

------------

#### 3. Why we use `mixin` in Dart?

A mixin is a class with methods and properties utilized by other classes in Dart. It is a way to reuse code and write code clean. Mixins, in other words, are regular classes from which we can grab methods (or variables) without having to extend them.

##### Usage:
- **Code Reusability:** Mixins allow you to reuse code across multiple classes.
- **Flexibility:** They provide a way to add functionality to a class without using inheritance.
- **Interface Implementation:** Mixins can be used to implement interfaces.

##### Example:

```dart 
mixin Flyable {
  void fly() {
    print("Flying");
  }
}

class Bird with Flyable {}  

void main() {
  Bird bird = Bird();
  bird.fly(); // Outputs: Flying
}
```

In this example, the `Flyable` mixin is used to add the `fly` method to the `Bird` class.

------------

#### 4. What is `extends` and `implements` in Dart?

In Dart, both `extends` and `implements` are used to create class inheritance and interface implementation, respectively. However, they serve different purposes and have different implications:

##### `extends`:
- **Usage:** Used to create a subclass that inherits from a superclass.
- **Purpose:** Allows the subclass to inherit all non-private properties and methods from the superclass.

##### `implements`:
- **Usage:** Used to implement an interface in a class.
- **Purpose:** Forces the class to implement all methods and properties defined in the interface.

##### Example:

```dart
class Animal {
  void sound() {
    print("Animal sound");
  }
}

class Dog extends Animal {
  @override 
  void sound() {
    print("Bark");
  }
}

class Bird implements Animal {
  @override
  void sound() {  
    print("Tweet");
  }
}
```

In this example:
- `Dog` extends `Animal`, inheriting its `sound` method.
- `Bird` implements `Animal`, requiring it to provide its own implementation of the `sound` method. 

------------

#### 5. What is `is` and `as` in Dart?

In Dart, both `is` and `as` are operators used for type checking and type casting, respectively.

##### `is`:
- **Usage:** Used to check if an object is of a specific type.
- **Purpose:** Returns `true` if the object is of the specified type, otherwise `false`.

##### `as`:
- **Usage:** Used to cast an object to a specific type.
- **Purpose:** Allows you to treat an object as if it is of a different type.

##### Example:

```dart
class Animal {} 
class Dog extends Animal {}

void main() {
  Animal animal = Dog();
  if (animal is Dog) {
    print("animal is a Dog");
  }
}

```

In this example:
- `animal is Dog` checks if `animal` is an instance of `Dog`.
- `animal as Dog` casts `animal` to `Dog`.

------------

#### 6. What is `super` in Dart?

In Dart, `super` is a keyword used to refer to the parent class of a subclass. It is primarily used in subclass constructors to call the constructor of the superclass.

##### Usage:
- **Constructor:** Used to call the constructor of the superclass.
- **Method:** Used to call methods of the superclass.
- **Variable:** Used to refer to variables of the superclass.

##### Example:

```dart
class Animal {
  String name;  

  Animal(this.name);

  void display() {
    print("Animal name: $name");
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);
}

void main() {
  Dog dog = Dog("Buddy");
  dog.display(); // Outputs: Animal name: Buddy
}
``` 

In this example:
- `super(name)` calls the constructor of the superclass `Animal` with the `name` parameter.
- `super.display()` calls the method `display` of the superclass `Animal`.

------------
