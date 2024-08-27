// To check if a string consists only of numeric digits, you can iterate through
// each character and verify whether it's a digit.

// ### Approach

// 1. **Iterate Through the String:**
//    - Traverse the string character by character.
//    - For each character, check if it falls within the range of '0' to '9'.

// 2. **Return Result:**
//    - If all characters are digits, return `true`; otherwise, return `false`.

// ### Implementation in Dart

bool containsOnlyDigits(String str) {
  for (int i = 0; i < str.length; i++) {
    if (str[i].compareTo('0') < 0 || str[i].compareTo('9') > 0) {
      return false;
    }
  }
  return true;
}

void main() {
  String str1 = "123456";
  String str2 = "123a56";

  print(containsOnlyDigits(str1)); // Output: true
  print(containsOnlyDigits(str2)); // Output: false
}

// ### Explanation:

// 1. **Character Comparison:**
//    - Each character is compared to see if it is between '0' and '9'.
//    - If any character does not satisfy this condition, the function immediately returns `false`.

// 2. **Return True If All Are Digits:**
//    - If the loop completes without finding a non-digit character, the function returns `true`.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The function checks each character once, where `n` is the length of the string.

// - **Space Complexity:** O(1)
//   - No additional space is used other than a few variables, so the space complexity is constant.

// This approach efficiently verifies whether a string contains only numeric digits
//with linear time complexity and constant space complexity.
