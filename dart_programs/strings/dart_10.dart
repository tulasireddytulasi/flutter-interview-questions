// To manually convert a string to uppercase or lowercase without using inbuilt methods,
// you can manipulate the ASCII values of the characters. This approach involves iterating
// over each character in the string and converting it based on its ASCII value.

// ### Approach

// 1. **Uppercase Conversion:**
//    - For each character, if it is a lowercase letter (between 'a' and 'z'),
//convert it to uppercase by subtracting 32 from its ASCII value.

// 2. **Lowercase Conversion:**
//    - For each character, if it is an uppercase letter (between 'A' and 'Z'),
//convert it to lowercase by adding 32 to its ASCII value.

// ### Implementation in Dart

// #### Convert to Uppercase

String toUpperCase(String str) {
  String result = '';

  for (int i = 0; i < str.length; i++) {
    int charCode = str.codeUnitAt(i);

    // Check if it's a lowercase letter (a-z)
    if (charCode >= 97 && charCode <= 122) {
      result += String.fromCharCode(charCode - 32);
    } else {
      result += str[i];
    }
  }

  return result;
}

// #### Convert to Lowercase

String toLowerCase(String str) {
  String result = '';

  for (int i = 0; i < str.length; i++) {
    int charCode = str.codeUnitAt(i);

    // Check if it's an uppercase letter (A-Z)
    if (charCode >= 65 && charCode <= 90) {
      result += String.fromCharCode(charCode + 32);
    } else {
      result += str[i];
    }
  }

  return result;
}

void main() {
  String str = "Hello World!";
  print(toUpperCase(str)); // Output: "HELLO WORLD!"

  String str2 = "Hello World!";
  print(toLowerCase(str2)); // Output: "hello world!"
}

// ### Explanation:

// 1. **Character Conversion:**
//    - Each character is checked to see if it falls within the range of lowercase or uppercase ASCII values.
//    - Conversion is done by adjusting the ASCII value:
//      - **Uppercase to Lowercase:** Add 32 to the ASCII value.
//      - **Lowercase to Uppercase:** Subtract 32 from the ASCII value.

// 2. **Construct Result String:**
//    - The converted characters are appended to the result string.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The function iterates through the string once, where `n` is the length of the string.

// - **Space Complexity:** O(n)
//   - A new string of the same length is constructed, so the space complexity is linear.

// This approach allows you to manually convert a string to uppercase or lowercase with linear time and space complexity.
