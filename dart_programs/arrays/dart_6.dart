// To move all zeros in an array to the end while maintaining the order of non-zero elements,
// you can use an efficient in-place approach. This approach ensures that the array
//is modified without requiring extra space beyond the given array.

// ### Approach: Two-Pointer Technique

// This technique involves using a pointer to keep track of the position where
//the next non-zero element should be placed. The steps are as follows:

// 1. **Initialize a Pointer:**
//    - Start with a pointer `lastNonZeroIndex` to track the position of the last non-zero element.

// 2. **Traverse the Array:**
//    - For each element in the array, if it's non-zero, move it to the `lastNonZeroIndex`
//position and increment `lastNonZeroIndex`.

// 3. **Fill the Remaining Positions with Zeros:**
//    - After all non-zero elements are moved to their correct positions,
//fill the rest of the array with zeros.

// ### Implementation in Dart

void moveZerosToEnd(List<int> arr) {
  int lastNonZeroIndex = 0;

  // Move all non-zero elements to the beginning of the array
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] != 0) {
      arr[lastNonZeroIndex] = arr[i];
      lastNonZeroIndex++;
    }
  }

  // Fill the rest of the array with zeros
  for (int i = lastNonZeroIndex; i < arr.length; i++) {
    arr[i] = 0;
  }
}

void main() {
  List<int> arr = [0, 1, 0, 3, 12, 0];
  moveZerosToEnd(arr);
  print("Array after moving zeros to the end: $arr");
}

// ### Explanation:

// 1. **Move Non-Zero Elements:**
//    - Iterate through the array, and for each non-zero element, place it at the
//`lastNonZeroIndex` and increment `lastNonZeroIndex`.

// 2. **Fill Remaining with Zeros:**
//    - After all non-zero elements have been moved, the `lastNonZeroIndex` marks
//the start of the remaining positions. Fill these positions with zeros.

// ### Example Output:
// For the input `[0, 1, 0, 3, 12, 0]`, the output will be:
// ```
// Array after moving zeros to the end: [1, 3, 12, 0, 0, 0]
// ```

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The array is traversed twice: once to move non-zero elements and once to
//     fill the remaining positions with zeros. Therefore, the time complexity is linear in terms of the array size.

// - **Space Complexity:** O(1)
//   - The algorithm operates in-place and does not require additional space
//     proportional to the input size, only a few extra variables for indexing.

// This approach is efficient and straightforward for moving all zeros in an
// array to the end while preserving the order of non-zero elements.
