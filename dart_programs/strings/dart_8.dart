// To count the number of vowels and consonants in a string, you can traverse the
// string and check each character to determine if it’s a vowel or a consonant. Here's how to do it:

// ### Approach

// 1. **Define Vowels:**
//    - Consider vowels as the characters `a, e, i, o, u` (both uppercase and lowercase).

// 2. **Traverse the String:**
//    - Iterate through each character in the string.
//    - Check if the character is a vowel, consonant, or neither (like spaces or punctuation).

// 3. **Count Vowels and Consonants:**
//    - Maintain separate counters for vowels and consonants.

// ### Implementation in Dart

Map<String, int> countVowelsAndConsonants(String str) {
  int vowelCount = 0;
  int consonantCount = 0;
  Set<String> vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};

  for (int i = 0; i < str.length; i++) {
    String char = str[i];

    // Check if character is a letter
    if (char.contains(RegExp(r'[a-zA-Z]'))) {
      if (vowels.contains(char)) {
        vowelCount++;
      } else {
        consonantCount++;
      }
    }
  }

  return {'vowels': vowelCount, 'consonants': consonantCount};
}

void main() {
  String str = "Hello, World!";
  Map<String, int> result = countVowelsAndConsonants(str);
  print("Vowels: ${result['vowels']}, Consonants: ${result['consonants']}");
}

// ### Explanation:

// 1. **Vowels Set:**
//    - A set of vowels is defined for quick lookup.

// 2. **Character Check:**
//    - Each character is checked to see if it’s a vowel, consonant, or neither.

// 3. **Counting:**
//    - If a character is a letter, it's classified as either a vowel or consonant.

// 4. **Return Result:**
//    - The function returns a map with the counts of vowels and consonants.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm traverses the string once, where `n` is the length of the string.

// - **Space Complexity:** O(1)
//   - The space complexity is constant because the extra space used for counting is fixed.

// This solution efficiently counts vowels and consonants with linear time complexity and constant space complexity.
