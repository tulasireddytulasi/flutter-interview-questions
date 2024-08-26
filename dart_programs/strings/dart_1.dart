// Here’s how you can reverse a string in Dart without using inbuilt methods:

void main() {
  String input = "Hello, Dart!";

  // Convert the string to a list of characters
  List<String> charList = input.split('');

  // Initialize pointers
  int start = 0;
  int end = charList.length - 1;

  // Swap characters from both ends of the list
  while (start < end) {
    // Swap characters
    var temp = charList[start];
    charList[start] = charList[end];
    charList[end] = temp;

    // Move pointers
    start++;
    end--;
  }

  // Join the list back into a string
  String reversed = charList.join('');

  print("Reversed String: $reversed");
}


// ### Explanation:
// 1. **Convert the String to a List:**
//    - The string is first converted into a list of characters. This allows us to perform swaps, as strings are immutable in Dart.

// 2. **Use Two Pointers:**
//    - We use two pointers, `start` and `end`, initially set to the beginning and end of the list, respectively.
//    - These pointers are moved towards each other, swapping elements at each step until they meet in the middle.

// 3. **Join the List Back into a String:**
//    - After all swaps are done, the list is converted back into a string.

// 4. **Output:**
//    - The reversed string is printed.

// ### Example Output:
// For the input `"Hello, Dart!"`, the output will be:
// ```
// Reversed String: !traD ,olleH
// ```

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm only iterates through half of the string, so the time complexity is linear, O(n), where **n** is the length of the string.

// - **Space Complexity:** O(n)
//   - Although no additional space proportional to the input size is used, we do create a list of characters to manipulate, which takes O(n) space.

// This solution is efficient, with minimal extra space usage and a linear runtime.