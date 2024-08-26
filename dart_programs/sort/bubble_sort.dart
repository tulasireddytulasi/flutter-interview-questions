// Here are the implementations of three basic sorting algorithms in Dart:
//**Bubble Sort**, **Insertion Sort**, and **Selection Sort**. Each algorithm is
//explained along with its time and space complexity.

// ### 1. Bubble Sort

// **Description:** Bubble Sort repeatedly swaps adjacent elements if they are in
//the wrong order. This process continues until the array is sorted.

void bubbleSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Swap arr[j] and arr[j + 1]
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

void main() {
  List<int> arr = [64, 34, 25, 12, 22, 11, 90];
  bubbleSort(arr);
  print("Sorted array using Bubble Sort: $arr");
}

// **Time Complexity:**
// - Best Case: O(n) (when the array is already sorted)
// - Average Case: O(n²)
// - Worst Case: O(n²)

// **Space Complexity:** O(1) (In-place sorting)


// ### Summary

// - **Bubble Sort:**
//   - **Time Complexity:** Best: O(n), Average/Worst: O(n²)
//   - **Space Complexity:** O(1)

// - **Insertion Sort:**
//   - **Time Complexity:** Best: O(n), Average/Worst: O(n²)
//   - **Space Complexity:** O(1)

// - **Selection Sort:**
//   - **Time Complexity:** Best/Average/Worst: O(n²)
//   - **Space Complexity:** O(1)

// All three algorithms are simple to implement but are inefficient for large datasets due to their quadratic time complexity.
