// To remove symbols (non-alphanumeric characters) from a string, you can filter
// out characters that are not letters or digits. This approach typically involves
// iterating through the string and constructing a new string with only the alphanumeric characters.

// ### Approach

// 1. **Filter Characters:**
//    - Iterate through each character in the string.
//    - Include the character in the result if it is a letter or digit.

// 2. **Construct Result:**
//    - Build a new string containing only alphanumeric characters.

// ### Implementation in Dart

// Here's how you can implement this approach in Dart:

String removeSymbols(String str) {
  StringBuffer result = StringBuffer(); // Buffer to build the result string

  for (int i = 0; i < str.length; i++) {
    String char = str[i];

    // Check if the character is alphanumeric
    if (char.contains(RegExp(r'[a-zA-Z0-9]'))) {
      result.write(char); // Append alphanumeric characters to the result
    }
  }

  return result.toString(); // Convert StringBuffer to String
}

void main() {
  String str = "Hello, World! %v&**#&@ 123";
  print(removeSymbols(str)); // Output: "HelloWorld123"
}

// ### Explanation:

// 1. **Character Filtering:**
//    - Each character is checked to see if it is alphanumeric using a regular expression.
//    - Only alphanumeric characters (`[a-zA-Z0-9]`) are added to the result.

// 2. **String Construction:**
//    - Use a `StringBuffer` to efficiently build the result string, especially useful for longer strings.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The function processes each character of the string once, where `n` is the length of the string.

// - **Space Complexity:** O(n)
//   - A new string (or `StringBuffer`) of the same length is created to store the filtered characters.
//     Thus, the space complexity is linear.

// This approach efficiently removes non-alphanumeric symbols from a string while maintaining linear time and space complexity.
