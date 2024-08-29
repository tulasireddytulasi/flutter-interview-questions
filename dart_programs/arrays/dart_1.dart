// Find the maximum and minimum elements in an array

// To find the maximum and minimum elements in an array in Dart,
// you can use a straightforward approach by iterating through the array
// and comparing each element. Here’s a Dart program to do that without using inbuilt methods:

void main() {
  List<int> numbers = [5, 7, 2, 9, 1, 6, 3, 8, 4];

  // Initialize max and min with the first element of the array
  int max = numbers[0];
  int min = numbers[0];

  // Iterate through the array starting from the second element
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > max) {
      max = numbers[i];
    }
    if (numbers[i] < min) {
      min = numbers[i];
    }
  }

  print("Maximum element: $max");
  print("Minimum element: $min");
}

// ### Explanation:
// 1. **Initialization**:
//    - `max` and `min` are initialized with the first element of the array.

// 2. **Iteration**:
//    - The loop starts from the second element and compares each element with the current `max` and `min`.
//    - If an element is greater than `max`, it becomes the new `max`.
//    - If an element is smaller than `min`, it becomes the new `min`.

// 3. **Output**:
//    - The program prints the maximum and minimum elements found in the array.

// ### Example Output:
// If the input array is `[5, 7, 2, 9, 1, 6, 3, 8, 4]`, the output will be:
// ```
// Maximum element: 9
// Minimum element: 1
// ```

// This approach has a time complexity of O(n) since it goes through the array only once.

// ### Time Complexity

// The time complexity of this approach is **O(n)**, where **n** is the number of elements in the array. This is because the algorithm iterates through each element of the array exactly once to determine both the maximum and minimum values.

// - **Best case:** O(n) (You still have to check all elements.)
// - **Worst case:** O(n) (Every element must be checked once.)

// ### Space Complexity

// The space complexity of this approach is **O(1)**, as it only uses a fixed amount of extra space regardless of the size of the input array.

// - The variables `max` and `min` are used to store the maximum and minimum values, respectively, which do not scale with the input size.
// - No additional space is used that depends on the input size.

// ### Summary

// - **Time Complexity:** O(n)
// - **Space Complexity:** O(1)

// This makes the solution efficient for finding the maximum and minimum values in an array.
