// To rotate an array in Dart, you can use the following approach, which rotates the array
// to the left or right by a given number of positions without using inbuilt methods:

// ### Rotating an Array to the Left or right by a given number of positions without using inbuilt methods

void leftRotate(List<int> arr, int positions) {
  int n = arr.length;
  positions = positions % n; // Handle cases where positions > n

  // Temporary array to store the rotated array
  List<int> temp = List.filled(n, 0);

  // Copy the rotated elements into the temporary array
  for (int i = 0; i < n; i++) {
    temp[i] = arr[(i + positions) % n];
  }

  // Copy the temporary array back into the original array
  for (int i = 0; i < n; i++) {
    arr[i] = temp[i];
  }
}

// ### Rotating an Array to the Right

void rightRotate(List<int> arr, int positions) {
  int n = arr.length;
  positions = positions % n; // Handle cases where positions > n

  // Temporary array to store the rotated array
  List<int> temp = List.filled(n, 0);

  // Copy the rotated elements into the temporary array
  for (int i = 0; i < n; i++) {
    temp[(i + positions) % n] = arr[i];
  }

  // Copy the temporary array back into the original array
  for (int i = 0; i < n; i++) {
    arr[i] = temp[i];
  }
}

void main() {
  List<int> arr1 = [1, 2, 3, 4, 5, 6, 7];
  int positionsResult1 = 2;

  leftRotate(arr1, positionsResult1);

  print("Array after left rotation: $arr1");

  List<int> arr2 = [1, 2, 3, 4, 5, 6, 7];
  int positionsResult2 = 2;

  rightRotate(arr2, positionsResult2);
  print("Array after right rotation: $arr2");
}

// ### Explanation:

// 1. **Handling Rotations Greater than Array Length:**
//    - `positions % n` ensures that we handle cases where the number of positions is greater than the array length.

// 2. **Temporary Array:**
//    - A temporary array `temp` is used to store the rotated elements.

// 3. **Copying Elements:**
//    - The loop calculates the correct positions and places the elements in the temporary array.

// 4. **Copy Back:**
//    - The temporary array is copied back to the original array.

// ### Example Output:
// For the array `[1, 2, 3, 4, 5, 6, 7]` and `positions = 2`:
// - **Left Rotation:** `[3, 4, 5, 6, 7, 1, 2]`
// - **Right Rotation:** `[6, 7, 1, 2, 3, 4, 5]`

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The algorithm iterates through the array twice: once to populate the temporary
//     array and once to copy it back. Hence, the time complexity is O(n).

// - **Space Complexity:** O(n)
//   - A temporary array of the same size as the original array is used, so the space complexity is O(n).

// This approach is efficient for array rotation, though it requires additional space proportional to the size of the array.
