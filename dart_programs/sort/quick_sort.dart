// **Quick Sort** is an efficient, divide-and-conquer algorithm used for sorting.
//It works by selecting a "pivot" element from the array and partitioning the other
//elements into two sub-arrays: those less than the pivot and those greater than the pivot.
//The process is recursively applied to the sub-arrays.

// ### Quick Sort Implementation in Dart

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    // pi is the partitioning index, arr[pi] is now at the right place
    int pi = partition(arr, low, high);

    // Recursively sort elements before and after partition
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
}

int partition(List<int> arr, int low, int high) {
  int pivot = arr[high]; // Pivot element
  int i = low - 1; // Index of the smaller element

  for (int j = low; j < high; j++) {
    // If current element is smaller than or equal to pivot
    if (arr[j] <= pivot) {
      i++;
      // Swap arr[i] and arr[j]
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }

  // Swap arr[i + 1] and arr[high] (or pivot)
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;

  return i + 1;
}

void main() {
  List<int> arr = [10, 7, 8, 9, 1, 5];
  int n = arr.length;
  quickSort(arr, 0, n - 1);
  print("Sorted array using Quick Sort: $arr");
}

// ### Explanation:

// 1. **Partitioning:**
//    - The `partition` function selects the last element as the pivot and arranges the array so that all elements less than the pivot are on its left, and all elements greater than the pivot are on its right. The pivot is then placed at its correct position.

// 2. **Recursion:**
//    - After partitioning, the `quickSort` function is called recursively on the sub-arrays formed by partitioning.

// ### Example Output:
// For the input `[10, 7, 8, 9, 1, 5]`, the output will be:
// ```
// Sorted array using Quick Sort: [1, 5, 7, 8, 9, 10]
// ```

// ### Time and Space Complexity:

// - **Time Complexity:**
//   - **Best Case:** O(n log n) (When the pivot divides the array into nearly equal parts)
//   - **Average Case:** O(n log n) (Occurs for a random array)
//   - **Worst Case:** O(n²) (Occurs when the smallest or largest element is always chosen as the pivot, 
//       resulting in unbalanced partitions)

// - **Space Complexity:** O(log n)
//   - The space complexity is O(log n) due to the recursive stack space. However, 
//     it can go up to O(n) in the worst case (when the recursion tree is highly unbalanced).

// ### Summary:
// Quick Sort is a widely used and efficient sorting algorithm, especially
// when the average case of O(n log n) can be achieved. However,
// its worst-case time complexity can degrade to O(n²) if the pivot elements are poorly chosen,
// such as always picking the smallest or largest element as the pivot.
// To avoid this, choosing a random pivot or using the median-of-three method is recommended.
