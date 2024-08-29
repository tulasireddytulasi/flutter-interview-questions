// **Merge Sort** is a classic divide-and-conquer algorithm used for sorting arrays or lists.
// It recursively divides the array into two halves until each subarray contains a single element
// and then merges them back together in sorted order.

// ### Approach

// 1. **Divide:**
//    - Split the array into two halves.

// 2. **Conquer:**
//    - Recursively apply merge sort to each half.

// 3. **Combine:**
//    - Merge the two sorted halves back into a single sorted array.

// ### Implementation in Dart

// Here's how you can implement Merge Sort in Dart:

List<int> mergeSort(List<int> array) {
  // Base case: a single element is already sorted
  if (array.length <= 1) {
    return array;
  }

  // Divide the array into two halves
  int mid = array.length ~/ 2;
  List<int> left = mergeSort(array.sublist(0, mid));
  List<int> right = mergeSort(array.sublist(mid));

  // Merge the two sorted halves
  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  // Merge the two lists by comparing the elements one by one
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  // Append any remaining elements from the left list
  while (i < left.length) {
    result.add(left[i]);
    i++;
  }

  // Append any remaining elements from the right list
  while (j < right.length) {
    result.add(right[j]);
    j++;
  }

  return result;
}

void main() {
  List<int> array = [38, 27, 43, 3, 9, 82, 10];
  List<int> sortedArray = mergeSort(array);
  print(sortedArray); // Output: [3, 9, 10, 27, 38, 43, 82]
}

// ### Explanation:

// 1. **Base Case:**
//    - If the array has one or zero elements, it's already sorted, so return it.

// 2. **Divide:**
//    - The array is split into two halves using `sublist`.

// 3. **Merge:**
//    - The `merge` function combines two sorted arrays by comparing elements from each and building a sorted list.

// 4. **Recursion:**
//    - `mergeSort` is called recursively to sort the left and right halves.

// ### Time and Space Complexity:

// - **Time Complexity:**
//   - **Best Case:** O(n log n)
//   - **Average Case:** O(n log n)
//   - **Worst Case:** O(n log n)

//   Merge Sort consistently has O(n log n) time complexity in all cases due to its divide-and-conquer nature.
//   The array is divided into halves log(n) times, and merging takes linear time O(n) for each division.

// - **Space Complexity:**
//   - **O(n)**

//   Merge Sort requires O(n) additional space for the temporary arrays used during the merging process.
//   This space is needed to store the elements as they are merged back together.

// ### Summary:

// - **Merge Sort** is efficient with a guaranteed O(n log n) time complexity.
// - It requires O(n) additional space, making it less space-efficient compared to some other algorithms like Quick Sort.
// - It is a stable sort, meaning it maintains the relative order of equal elements.

// This makes Merge Sort an excellent choice for sorting, especially when stability
// is required or when dealing with large datasets where guaranteed O(n log n) performance is necessary.
