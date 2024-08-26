// To detect duplicates in an array where elements are within a given range,
//we can use an efficient approach with a time complexity of **O(n)** and
//space complexity of **O(1)** by modifying the array itself.
//This method works when the array contains elements in the range from `0` to `n-1`.

// ### Approach: Marking Visited Elements

// The idea is to traverse the array and mark elements as visited by negating
//the value at the index corresponding to the current element. If an element leads
//to an index that has already been negated, it means the element is a duplicate.

// ### Implementation in Dart:

void findDuplicates(List<int> arr) {
  bool hasDuplicates = false;

  for (int i = 0; i < arr.length; i++) {
    int index = arr[i].abs();

    if (arr[index] >= 0) {
      arr[index] = -arr[index];
    } else {
      print("Duplicate found: $index");
      hasDuplicates = true;
    }
  }

  if (!hasDuplicates) {
    print("No duplicates found");
  }

  // Restore the original array if needed
  for (int i = 0; i < arr.length; i++) {
    arr[i] = arr[i].abs();
  }
}

void main() {
  List<int> arr = [1, 2, 3, 1, 3, 6, 6];
  findDuplicates(arr);
}

// ### Explanation:

// 1. **Marking Elements:**
//    - For each element `arr[i]`, the corresponding index `arr[i].abs()` is calculated.
//    - If the value at that index is positive, it is negated to mark that this index has been visited.
//    - If the value at that index is already negative, it means the element is a duplicate.

// 2. **Restoring the Array:**
//    - After detecting duplicates, we restore the original array by taking the absolute value of each element, which is optional.

// ### Example Output:
// For the input `[1, 2, 3, 1, 3, 6, 6]`, the output will be:
// ```
// Duplicate found: 1
// Duplicate found: 3
// Duplicate found: 6
// ```

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm traverses the array a constant number of times, making the time complexity O(n).

// - **Space Complexity:** O(1)
//   - No additional space proportional to the input size is used. The modifications are made in place within the original array.

// ### Important Notes:
// - This method assumes that the array contains elements within the range `[0, n-1]`.
// - The array is modified during the process, but it can be restored if necessary.

// This approach is both time-efficient and space-efficient, making it suitable for detecting duplicates in large arrays.
