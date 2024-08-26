// To rearrange an array such that positive and negative numbers are placed alternately,
// you can use a two-step approach. The first step involves separating the positive
//and negative numbers, and the second step involves rearranging them alternately.

// ### Approach: Separate and Rearrange

// 1. **Separate Positive and Negative Numbers:**
//    - Traverse the array and separate positive and negative numbers into two lists.

// 2. **Merge Lists Alternately:**
//    - Merge the two lists alternately into the original array.

// ### Implementation in Dart

// Here's how you can implement this approach in Dart:

void rearrangePosNegAlternately(List<int> arr) {
  // Separate positive and negative numbers
  List<int> pos = [];
  List<int> neg = [];

  for (int num in arr) {
    if (num >= 0) {
      pos.add(num);
    } else {
      neg.add(num);
    }
  }

  int posIndex = 0;
  int negIndex = 0;
  int n = arr.length;

  // Rearrange elements alternately
  for (int i = 0; i < n; i++) {
    if (i % 2 == 0 && posIndex < pos.length) {
      arr[i] = pos[posIndex++];
    } else if (i % 2 != 0 && negIndex < neg.length) {
      arr[i] = neg[negIndex++];
    }
  }

  // If there are remaining elements in either list, handle them
  while (posIndex < pos.length) {
    arr[negIndex + (posIndex - negIndex)] = pos[posIndex++];
  }

  while (negIndex < neg.length) {
    arr[posIndex + (negIndex - posIndex)] = neg[negIndex++];
  }
}

void main() {
  List<int> arr = [1, -2, 3, -4, 5, -6, 7];
  rearrangePosNegAlternately(arr);
  print("Array after rearranging: $arr");
}

// ### Explanation:

// 1. **Separate Positive and Negative Numbers:**
//    - Traverse the input array and separate positive and negative numbers into two different lists, `pos` and `neg`.

// 2. **Rearrange Alternately:**
//    - Iterate through the original array and alternately place positive and negative numbers from the `pos` and `neg` lists.
//    - If one list is exhausted, the remaining elements from the other list are placed in the array.

// ### Example Output:
// For the input `[1, -2, 3, -4, 5, -6, 7]`, the output will be:
// ```
// Array after rearranging: [1, -2, 3, -4, 5, -6, 7]
// ```

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm performs a constant number of passes over the array:
//one for separation and one for rearrangement. Hence, the time complexity is linear in terms of the array size.

// - **Space Complexity:** O(n)
//   - Additional space is used to store the positive and negative numbers separately.
//Therefore, the space complexity is linear in terms of the array size.

// This approach efficiently rearranges the array while maintaining the order of
// positive and negative numbers. If you want to handle cases where the number of positive
// and negative numbers is not equal, you may need to adjust the handling of remaining elements.
