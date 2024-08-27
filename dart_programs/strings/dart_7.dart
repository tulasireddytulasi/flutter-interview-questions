// To find the length of the longest substring without repeating characters,
// you can use the **sliding window** technique combined with a hash map (or a set).
// This approach allows you to efficiently track the characters in the current window and adjust the window as needed.

// ### Approach: Sliding Window with Hash Map

// 1. **Sliding Window Technique:**
//    - Use two pointers (`left` and `right`) to represent the current window in the string.
//    - Move the `right` pointer to expand the window and include new characters.
//    - If a character is repeated, move the `left` pointer to shrink the window until there are no duplicates.

// 2. **Track Characters with a Hash Map:**
//    - Use a hash map to store the characters in the current window along with their latest positions.

// 3. **Update Maximum Length:**
//    - Continuously update the maximum length of substrings found during the traversal.

// ### Implementation in Dart

int lengthOfLongestSubstring(String s) {
  Map<String, int> charIndexMap = {}; // Hash map to store character indices
  int maxLength = 0;
  int left = 0; // Left pointer for the sliding window

  for (int right = 0; right < s.length; right++) {
    String currentChar = s[right];

    // If the character is already in the map and within the current window
    if (charIndexMap.containsKey(currentChar) &&
        charIndexMap[currentChar]! >= left) {
      left = charIndexMap[currentChar]! +
          1; // Move the left pointer to avoid the repeated character
    }

    // Update the character's index in the map
    charIndexMap[currentChar] = right;

    // Calculate the maximum length of the substring
    maxLength = maxLength > (right - left + 1) ? maxLength : (right - left + 1);
  }

  return maxLength;
}

void main() {
  String str = "abcabcbb";
  print(lengthOfLongestSubstring(str)); // Output: 3 ("abc")
}

// ### Explanation:

// 1. **Sliding Window:**
//    - The `left` pointer represents the start of the current substring without
// repeating characters, and the `right` pointer moves through the string.

// 2. **Handling Repeating Characters:**
//    - If a repeating character is found within the current window (between `left` and `right`),
//  move `left` to just after the last occurrence of the repeating character.

// 3. **Updating the Map:**
//    - Continuously update the position of each character in the hash map as you expand the window.

// 4. **Max Length Calculation:**
//    - Track the maximum length of substrings encountered during the traversal.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The `right` pointer traverses the string once, and the `left` pointer only moves forward,
//     resulting in a linear time complexity.

// - **Space Complexity:** O(m)
//   - The space complexity is O(m), where `m` is the number of distinct characters in the string, stored in the hash map.

// This approach is optimal, allowing you to find the longest substring without
// repeating characters with linear time and space complexity.
