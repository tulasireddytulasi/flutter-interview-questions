// To determine if a string is a palindrome, you can use a straightforward approach
// that involves checking if the string reads the same forwards and backwards.
// Here’s how you can implement this in Dart:

// ### Approach: Two-Pointer Technique

// 1. **Initialize Two Pointers:**
//    - Use two pointers: one starting at the beginning of the string and the other at the end.

// 2. **Compare Characters:**
//    - Compare the characters at the two pointers. If they are equal, move both pointers towards the center.
//    - If they are not equal, the string is not a palindrome.

// 3. **Continue Until Pointers Meet:**
//    - Continue this process until the two pointers cross each other or meet.

// ### Implementation in Dart

// Here’s how you can implement the palindrome check using the two-pointer technique:

bool isPalindrome(String str) {
  int left = 0;
  int right = str.length - 1;

  while (left < right) {
    if (str[left] != str[right]) {
      return false;
    }
    left++;
    right--;
  }

  return true;
}

void main() {
  String str1 = "racecar";
  String str2 = "hello";

  print("Is '$str1' a palindrome? ${isPalindrome(str1)}");
  print("Is '$str2' a palindrome? ${isPalindrome(str2)}");
}

// ### Explanation:

// 1. **Initialize Pointers:**
//    - `left` starts at the beginning (`0`) and `right` starts at the end (`str.length - 1`).

// 2. **Compare Characters:**
//    - Compare characters at `left` and `right`. If they are not equal, return `false`.

// 3. **Move Pointers:**
//    - Move `left` forward and `right` backward. Continue comparing until the pointers meet.

// 4. **Return Result:**
//    - If all corresponding characters are equal, return `true`.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm iterates through half of the string (n/2 comparisons),
//     where `n` is the length of the string. Thus, the time complexity is linear.

// - **Space Complexity:** O(1)
//   - The algorithm uses a fixed amount of extra space for the pointers,
//     regardless of the input size. Hence, the space complexity is constant.

// This approach efficiently checks if a string is a palindrome with linear
// time complexity and constant space complexity.
