// ### Selection Sort

// **Description:** Selection Sort divides the array into a sorted and unsorted region.
//  It repeatedly selects the smallest (or largest) element from the unsorted region
//  and moves it to the sorted region.

void selectionSort(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    // Find the minimum element in the unsorted portion
    int minIndex = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }
    // Swap the found minimum element with the first element
    int temp = arr[minIndex];
    arr[minIndex] = arr[i];
    arr[i] = temp;
  }
}

void main() {
  List<int> arr = [64, 25, 12, 22, 11];
  selectionSort(arr);
  print("Sorted array using Selection Sort: $arr");
}

// **Time Complexity:**
// - Best Case: O(n²)
// - Average Case: O(n²)
// - Worst Case: O(n²)

// **Space Complexity:** O(1) (In-place sorting)
