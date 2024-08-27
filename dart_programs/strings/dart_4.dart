// To remove duplicate characters from a string without using inbuilt methods,
// you can use a simple approach involving a hash set (to track seen characters)
// and build a new string with unique characters. Here's how you can do it:

// ### Approach: Using a Hash Set

// 1. **Initialize a Hash Set:**
//    - Use a hash set to keep track of characters that have already been encountered.

// 2. **Traverse the String:**
//    - Iterate through each character of the string.
//    - Add each character to the hash set if it hasn't been seen before.
//    - Append characters to the result string if they are not already in the hash set.

// 3. **Build the Result String:**
//    - Construct the result string from characters that were added to the hash set.

// ### Implementation in Dart

// Here’s a Dart implementation for removing duplicate characters from a string:

String removeDuplicates(String str) {
  Set<int> seenChars = {}; // Set to track seen characters
  StringBuffer result = StringBuffer(); // Buffer to build the result string

  for (int i = 0; i < str.length; i++) {
    int charCode = str.codeUnitAt(i); // Get ASCII code of the character
    if (!seenChars.contains(charCode)) {
      seenChars.add(charCode); // Mark character as seen
      result.writeCharCode(charCode); // Append character to result
    }
  }

  return result.toString(); // Convert StringBuffer to String
}

List<T> removeDuplicates2<T>(List<T> list) {
  List<T> result = []; // List to store result

  for (T element in list) {
    if (!result.contains(element)) {
      // Add element to result list if it's not already in the list
      result.add(element);
    }
  }

  return result;
}

void main() {
  String str = "programming";
  String uniqueStr = removeDuplicates(str);
  print("String after removing duplicates: $uniqueStr");

  // Method 2
  List<int> numbers = [1, 2, 3, 2, 4, 1, 5];
  List<int> uniqueNumbers = removeDuplicates2(numbers);
  print("Original No list: $numbers");
  print("List after removing duplicates: $uniqueNumbers");
}

// ### Explanation:

// 1. **Initialize Hash Set:**
//    - `seenChars` tracks ASCII codes of characters that have already been added.

// 2. **Initialize StringBuffer:**
//    - `result` is used to build the final string without duplicates.

// 3. **Traverse the String:**
//    - For each character in the string, check if its ASCII code is in the hash set.
//    - If not, add the ASCII code to the hash set and append the character to `result`.

// 4. **Build and Return Result:**
//    - Convert `StringBuffer` to a `String` to get the final result.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm traverses the string once, where `n` is the length of the string.
//     Each character is processed in constant time.

// - **Space Complexity:** O(m)
//   - The space complexity is determined by the size of the hash set,
//     where `m` is the number of unique characters in the string. In the worst case,
//     this could be proportional to the length of the string.

// This approach efficiently removes duplicate characters from a string,
// using linear time and space relative to the number of unique characters.
