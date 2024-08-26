// To count the occurrences of a character in a string, you can use a simple traversal approach.
// You iterate through the string and count how many times the target character appears.

// ### Approach: Iterative Count

// 1. **Initialize a Counter:**
//    - Start with a counter set to zero.

// 2. **Traverse the String:**
//    - Iterate through each character in the string.
//    - Increment the counter whenever the current character matches the target character.

// ### Implementation in Dart

// Here’s how you can implement this approach in Dart:

int countOccurrences(String str, String char) {
  if (char.length != 1) {
    throw ArgumentError('The target must be a single character.');
  }

  int count = 0;
  for (int i = 0; i < str.length; i++) {
    if (str[i] == char) {
      count++;
    }
  }

  return count;
}

void main() {
  String str = "hello world";
  String char = "o";

  int count = countOccurrences(str, char);
  print("The character '$char' occurs $count times in the string.");
}

// ### Explanation:

// 1. **Check Target Character:**
//    - Ensure that `char` is a single character. If not, throw an `ArgumentError`.

// 2. **Initialize Counter:**
//    - Set `count` to zero.

// 3. **Traverse the String:**
//    - Loop through each character in the string. If the character matches `char`, increment the `count`.

// 4. **Return Result:**
//    - Return the final count of occurrences.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm traverses the entire string exactly once, where `n` is the
//     length of the string. Therefore, the time complexity is linear.

// - **Space Complexity:** O(1)
//   - The algorithm uses a fixed amount of extra space for the counter and loop variables.
//     The space complexity is constant.

// This approach is efficient for counting occurrences of a character in a string,
// with linear time complexity and constant space complexity.
