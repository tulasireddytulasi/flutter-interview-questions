// **Heap Sort** is a comparison-based sorting algorithm that uses a binary heap data structure. It is an in-place, non-recursive algorithm that efficiently sorts an array by first building a max-heap and then repeatedly extracting the maximum element to achieve a sorted array.

// ### Approach

// 1. **Build a Max-Heap:**
//    - Convert the array into a max-heap, where the largest element is at the root of the heap.

// 2. **Heapify Process:**
//    - Starting from the last non-leaf node, apply the heapify process to maintain the max-heap property.

// 3. **Extract Elements:**
//    - Swap the root (maximum element) with the last element of the heap.
//    - Reduce the heap size and apply heapify to the root to restore the max-heap property.
//    - Repeat this process until the heap size is reduced to one.

// ### Implementation in Dart

// Here's how you can implement Heap Sort in Dart:


void heapSort(List<int> array) {
  int n = array.length;

  // Build max heap
  for (int i = n ~/ 2 - 1; i >= 0; i--) {
    heapify(array, n, i);
  }

  // Extract elements from heap one by one
  for (int i = n - 1; i > 0; i--) {
    // Move current root to end
    int temp = array[0];
    array[0] = array[i];
    array[i] = temp;

    // Call heapify on the reduced heap
    heapify(array, i, 0);
  }
}

void heapify(List<int> array, int n, int i) {
  int largest = i; // Initialize largest as root
  int left = 2 * i + 1; // left = 2*i + 1
  int right = 2 * i + 2; // right = 2*i + 2

  // If left child is larger than root
  if (left < n && array[left] > array[largest]) {
    largest = left;
  }

  // If right child is larger than largest so far
  if (right < n && array[right] > array[largest]) {
    largest = right;
  }

  // If largest is not root
  if (largest != i) {
    int swap = array[i];
    array[i] = array[largest];
    array[largest] = swap;

    // Recursively heapify the affected sub-tree
    heapify(array, n, largest);
  }
}

void main() {
  List<int> array = [12, 11, 13, 5, 6, 7];
  heapSort(array);
  print(array);  // Output: [5, 6, 7, 11, 12, 13]
}


// ### Explanation:

// 1. **Build Max-Heap:**
//    - The array is first converted into a max-heap by applying the `heapify` function to each non-leaf node, starting from the last non-leaf node and moving up to the root.

// 2. **Heapify:**
//    - `heapify` ensures that the subtree rooted at a given node maintains the max-heap property, where the parent node is greater than or equal to its children.

// 3. **Extract and Sort:**
//    - The maximum element (root of the heap) is swapped with the last element of the array.
//    - The heap size is reduced, and `heapify` is called again on the root to restore the max-heap property.
//    - This process continues until the entire array is sorted.

// ### Time and Space Complexity:

// - **Time Complexity:**
//   - **Best Case:** O(n log n)
//   - **Average Case:** O(n log n)
//   - **Worst Case:** O(n log n)
  
//   The time complexity of Heap Sort is consistently O(n log n) in all cases:
//   - Building the max-heap takes O(n) time.
//   - Extracting elements from the heap and restoring the heap property takes O(log n) time for each element, repeated `n` times.

// - **Space Complexity:**
//   - **O(1)**
  
//   Heap Sort is an in-place sorting algorithm, meaning it requires only a constant amount of additional memory space (for variable storage, swapping, etc.).

// ### Summary:

// - **Heap Sort** is efficient with O(n log n) time complexity in the worst, average, and best cases.
// - It is an in-place sorting algorithm with O(1) space complexity.
// - It is not a stable sort, meaning it does not preserve the relative order of equal elements.

// Heap Sort is a good choice when you need an in-place sort with guaranteed O(n log n) time complexity, especially when memory usage needs to be minimized.