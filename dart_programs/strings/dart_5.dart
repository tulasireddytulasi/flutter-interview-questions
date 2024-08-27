// To identify the first non-repeating character in a string, you can use a two-pass approach. The first pass counts the occurrences of each character, and the second pass identifies the first character with a count of one.

// ### Approach: Two-Pass Hash Map

// 1. **Count Occurrences:**
//    - Traverse the string and store the count of each character in a hash map (or dictionary).

// 2. **Find First Non-Repeating Character:**
//    - Traverse the string again and check the count of each character in the hash map. The first character with a count of one is the first non-repeating character.

// ### Implementation in Dart

// Here’s how you can implement this approach in Dart:

String firstNonRepeatingCharacter(String str) {
  Map<String, int> charCount = {}; // Hash map to store character counts

  // First pass: Count the occurrences of each character
  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    if (charCount.containsKey(char)) {
      charCount[char] = charCount[char]! + 1;
    } else {
      charCount[char] = 1;
    }
  }

  // Second pass: Find the first character with count 1
  for (int i = 0; i < str.length; i++) {
    if (charCount[str[i]] == 1) {
      return str[i];
    }
  }

  return ""; // Return empty string if no non-repeating character is found
}

void main() {
  String str = "swiss";
  String result = firstNonRepeatingCharacter(str);

  if (result.isNotEmpty) {
    print("The first non-repeating character is: $result");
  } else {
    print("No non-repeating character found.");
  }
}


// ### Explanation:

// 1. **First Pass - Count Occurrences:**
//    - Iterate through the string and count the occurrences of each character using a hash map.

// 2. **Second Pass - Identify First Non-Repeating Character:**
//    - Traverse the string again and check the hash map for the first character with a count of one.

// 3. **Return Result:**
//    - Return the first non-repeating character found. If no such character exists, return an empty string.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm requires two passes through the string, each taking O(n) time, where `n` is the length of the string. Therefore, the overall time complexity is linear.

// - **Space Complexity:** O(m)
//   - The space complexity is O(m), where `m` is the number of distinct characters in the string (stored in the hash map). In the worst case, `m` could be up to `n`.

// This approach efficiently identifies the first non-repeating character with linear time and space complexity.