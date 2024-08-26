// To merge two sorted arrays into a single sorted array without using inbuilt methods,
// you can use a two-pointer approach. This method efficiently combines the arrays
// while maintaining their sorted order.

// ### Merge Two Sorted Arrays in Dart

// Here’s a Dart implementation that merges two sorted arrays:

List<int> mergeSortedArrays(List<int> arr1, List<int> arr2) {
  int n1 = arr1.length;
  int n2 = arr2.length;

  List<int> merged =
      List.filled(n1 + n2, 0); // Create an empty list to store merged elements
  int i = 0, j = 0, k = 0;

  // Traverse both arrays and merge them
  while (i < n1 && j < n2) {
    if (arr1[i] <= arr2[j]) {
      merged[k++] = arr1[i++];
    } else {
      merged[k++] = arr2[j++];
    }
  }

  // Copy any remaining elements from arr1
  while (i < n1) {
    merged[k++] = arr1[i++];
  }

  // Copy any remaining elements from arr2
  while (j < n2) {
    merged[k++] = arr2[j++];
  }

  return merged;
}

void main() {
  List<int> arr1 = [1, 3, 5, 7];
  List<int> arr2 = [2, 4, 6, 8];

  List<int> mergedArray = mergeSortedArrays(arr1, arr2);
  print("Merged sorted array: $mergedArray");
}

// ### Explanation:

// 1. **Initialization:**
//    - `i` and `j` are pointers for traversing `arr1` and `arr2`, respectively.
//    - `k` is a pointer for the `merged` array, which will hold the final sorted elements.

// 2. **Merging Process:**
//    - Compare elements from `arr1` and `arr2`. Append the smaller element to `merged` and move the corresponding pointer (`i` or `j`).
//    - If all elements from one array are merged, copy the remaining elements from the other array.

// 3. **Remaining Elements:**
//    - After the main loop, any remaining elements in `arr1` or `arr2` are copied to `merged` since those elements are already sorted.

// ### Example Output:
// For the arrays `[1, 3, 5, 7]` and `[2, 4, 6, 8]`, the output will be:
// ```
// Merged sorted array: [1, 2, 3, 4, 5, 6, 7, 8]
// ```

// ### Time and Space Complexity:

// - **Time Complexity:** O(n1 + n2)
//   - The algorithm traverses both arrays exactly once. Therefore, the time complexity is linear in terms of the combined size of the two arrays.

// - **Space Complexity:** O(n1 + n2)
//   - The space complexity is linear because the merged array is of size `n1 + n2`, where `n1` and `n2` are the lengths of the input arrays.

// This approach is efficient for merging two sorted arrays, leveraging linear time complexity and simple array manipulation.
