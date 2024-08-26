// ###  Insertion Sort

// **Description:** Insertion Sort builds the sorted array one element at a time by
//repeatedly picking the next element and inserting it into the correct position in the sorted portion.

void insertionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 1; i < n; i++) {
    int key = arr[i];
    int j = i - 1;

    // Move elements that are greater than key to one position ahead
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6];
  insertionSort(arr);
  print("Sorted array using Insertion Sort: $arr");
}

// **Time Complexity:**
// - Best Case: O(n) (when the array is already sorted)
// - Average Case: O(n²)
// - Worst Case: O(n²)

// **Space Complexity:** O(1) (In-place sorting)