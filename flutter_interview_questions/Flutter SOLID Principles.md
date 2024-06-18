# SOLID Principles in Flutter

## Introduction

This document outlines the SOLID principles and how they can be applied in Flutter development. By
adhering to these principles, you can make your codebase easier to understand, maintain, and extend,
leading to more efficient development and a better user experience.

## SOLID Principles Overview

SOLID is an acronym representing five design principles intended to make software designs more
understandable, flexible, scalable and maintainable. These principles are:

1. **Single Responsibility Principle (SRP)**: A class should have only one reason to change, meaning
   it should have only one responsibility.
2. **Open/Closed Principle (OCP)**: A class should be open for extension but closed for
   modification.
3. **Liskov Substitution Principle (LSP)**: Subtypes must be substitutable for their base types
   without affecting the correctness of the program.
4. **Interface Segregation Principle (ISP)**: Clients should not be forced to depend on interfaces
   they do not use.
5. **Dependency Inversion Principle (DIP)**: High-level modules should not depend on low-level
   modules. Both should depend on abstractions.

## 1. Single Responsibility Principle (SRP)

**Definition:** A class should have only one reason to change, meaning it should have only one
responsibility.

- The SRP states that a class should have only one reason to change. In other words, a class should 
have only one responsibility. This makes the class easier to understand, maintain and test.

- **Example**: Suppose we have a class called user which is responsible or storing user data.
This class should not be responsible for sending an email or any other unrelated tasks. Instead, we 
can create a separate class called **EmailSender** to handle the **EmailSending** task.

**Example:**

```dart
class User {
  String name;
  String email;
  String password;

  User({this.name, this.email, this.password});
}

class EmailSender {
  void sendEmail(String recipient, String subject, String body) {
    // send email using a third-party email service provider
  }
}
```

In this example, **User** class is responsible for storing user data, while **EmailSender** is
responsible for sending emails.

## 2. Open/Closed Principle (OCP)

**Definition:** A class should be open for extension but closed for modification.

- The OCP states that a class should be open for extension but closed for modification. This means
  that we should be able to add new features to class without modifying the existing code.

- **Example:** Suppose we have a class called which is responsible for processing payments. If we
  want to add support for a new payment method like **GooglePay**, we should not modify the existing
  **PaymentGateway** class. Instead, we can create a new class called **GooglepayGateway** which
  extends the paymentgateway class.

**Example:**

```dart
abstract class PaymentGateway {
  void processPayment();
}

class CreditCardGateway implements PaymentGateway {
  void processPayment() {
    // process payment using credit card
  }
}

class GooglePayGateway implements PaymentGateway {
  void processPayment() {
    // process payment using Google Pay
  }
}
```

Here, **PaymentGateway** can be extended with new payment methods without modifying existing code.

## 3. Liskov Substitution Principle (LSP)

**Definition:** Subtypes must be substitutable for their base types without affecting the
correctness of the program.

- The LSP states that a subclass should be able to replace its parent class without affecting the
  correctness of the program. This means that the subclass should be able to implement all the
  methods of the parent class and behave in the same way as parent class.

- **Example**: Suppose we have a class called **Animal** and its subclass called Dog. If we have a
  method that accepts an **Animal** object, we should be able to pass a **Dog** object to that
  method without causing any issues.

**Example:**

```dart
class Animal {
  void makesound() {
    print('Animal sound');
  }
}

class Dog extends Animal {
  void makesound() {
    print('Bark');
  }
}

void makeAnimalSound(Animal animal) {
  animal.makesound();
}

void main() {
  Animal animal = Animal();
  Dog dog = Dog();

  makeAnimalSound(animal); // prints 'Animal sound'
  makeAnimalSound(dog); // prints 'Bark'
}

```

The **Dog** class can replace the **Animal** class without affecting the program's correctness.

## 4. Liskov Substitution Principle (LSP)

**Definition:** Clients should not be forced to depend on interfaces they do not use.

- The ISP states that a client should not be forced to implement methods it does not use. In other
  words, we should not have large interfaces that contain methods that are not relevant to all
  clients.

- **Example**: Suppose we have interface class Printer and another interface called Scanner. The *
  *MultiFunctionPrinter** class implements both interfaces, but the LaserPrinter class only
  implements that printer interface. This way, a client can use the LaserPrinter class without being
  forced to implement the **ScanDocument** method which is not relevant in this case.

**Example:**

```dart
abstract class Printer {
  void printDocument();
}

abstract class Scanner {
  void scanDocument();
}

class MultiFunctionPrinter implements Printer, Scanner {
  void printDocument() {
    // print document
  }

  void scanDocument() {
    // scan document
  }
}

class LaserPrinter implements Printer {
  void printDocument() {
    // print document
  }
}
```

Here, **LaserPrinter** only implements the **Printer** interface without being forced to implement *
*Scanner** methods.

## 5. Dependency Inversion Principle (DIP)

**Definition:** High-level modules should not depend on low-level modules. Both should depend on
abstractions.

- The DIP states that high-level modules should not depend on low-level modules, Both should depend
  on abstraction. In other words, classes should depend on interfaces or abstract classes instead of
  concrete classes.

- **Example**: Suppose we have class called PaymentProcessor which needs to process payment gateway
  like **PayPal** or **Stripe**, the Paymentprocesser should depend on an interface called
  PaymentGateway that provides the necessary methods for processing payments. This way can easily
  switch between different payment gateway without modifying the **PaymentProcessor** class.

**Example:**

```dart
abstract class PaymentGateway {
  void processPayment();
}

class PayPal implements PaymentGateway {
  void processPayment() {
    // process payment using PayPal
  }
}

class Stripe implements PaymentGateway {
  void processPayment() {
    // process payment using Stripe
  }
}

class PaymentProcessor {
  final PaymentGateway _gateway;

  PaymentProcessor(this._gateway);

  void processPayment() {
    _gateway.processPayment();
  }
}

```

In this example, **PaymentProcessor** depends on the **PaymentGateway** interface, allowing it to
use different payment gateways without changing its code.

## Conclusion

Applying the SOLID principles in Flutter development enhances code maintainability, readability, and
scalability. By following these principles, developers can create robust and flexible applications
that are easier to manage and extend.


