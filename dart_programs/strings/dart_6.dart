// To check if two strings are anagrams of each other, you need to determine
//if they contain the same characters in the same frequencies, regardless of the order.

// ### Approach 1: Sorting-Based Method

// 1. **Sort Both Strings:**
//    - Convert both strings to character arrays, sort them, and compare the sorted arrays.
//    - If the sorted arrays are equal, the strings are anagrams.

// 2. **Implementation in Dart:**

bool areAnagrams(String str1, String str2) {
  // If lengths differ, they can't be anagrams
  if (str1.length != str2.length) {
    return false;
  }

  // Convert to lists, sort, and compare
  List<String> sortedStr1 = str1.split('')..sort();
  List<String> sortedStr2 = str2.split('')..sort();

  return sortedStr1.join() == sortedStr2.join();
}

// ### Time and Space Complexity (Sorting-Based Method):

// - **Time Complexity:** O(n log n)
//   - Sorting both strings dominates the time complexity, where `n` is the length of each string.

// - **Space Complexity:** O(n)
//   - Additional space is required to store the sorted character arrays.

// ### Approach 2: Counting-Based Method (Optimal)

// 1. **Count Character Frequencies:**
//    - Use an array or hash map to count the frequency of each character in both strings.
//    - Compare the frequency counts. If they match, the strings are anagrams.

// 2. **Implementation in Dart:**

bool areAnagrams2(String str1, String str2) {
  // If lengths differ, they can't be anagrams
  if (str1.length != str2.length) {
    return false;
  }

  // Initialize a map to count character frequencies
  Map<String, int> charCount = {};

  // Count characters in the first string
  for (int i = 0; i < str1.length; i++) {
    String char = str1[i];
    charCount[char] = (charCount[char] ?? 0) + 1;
  }

  // Subtract character counts using the second string
  for (int i = 0; i < str2.length; i++) {
    String char = str2[i];
    if (!charCount.containsKey(char) || charCount[char] == 0) {
      return false;
    }
    charCount[char] = charCount[char]! - 1;
  }

  return true;
}

void main() {
  String str1 = "listen";
  String str2 = "silent";

  print("Method 1: ${areAnagrams(str1, str2)}"); // Output: true

  String str3 = "listen";
  String str4 = "silent";

  print("Method 2: ${areAnagrams2(str3, str4)}");
}

// ### Time and Space Complexity (Counting-Based Method):

// - **Time Complexity:** O(n)
//   - The algorithm makes two passes over the strings, each requiring O(n) time,
//     where `n` is the length of the strings.

// - **Space Complexity:** O(1) or O(m)
//   - If the character set is fixed (e.g., ASCII), the space complexity is O(1).
//   For a dynamic character set, it’s O(m), where `m` is the number of distinct characters.

// ### Conclusion:

// - The **sorting-based method** is easier to implement but has a higher time complexity due to sorting.
// - The **counting-based method** is more efficient with linear time complexity and minimal space usage,
//  making it the preferred approach for checking if two strings are anagrams.
