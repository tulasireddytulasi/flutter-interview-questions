// To find a subarray with a given sum, you can use the **sliding window technique**
//(also known as the two-pointer technique) for an efficient solution.
//This technique works well for finding subarrays with a sum in linear time,
//assuming the array contains only positive numbers.

// ### Approach: Sliding Window Technique

// 1. **Initialize Two Pointers:**
//    - Use two pointers, `start` and `end`, to represent the current subarray.

// 2. **Expand and Contract the Window:**
//    - Expand the window by moving the `end` pointer and add the element at `end` to the current sum.
//    - If the current sum exceeds the target sum, contract the window by moving
//     the `start` pointer and subtracting the element at `start` from the current sum.
//    - Continue this process until you either find a subarray with the given sum or traverse the entire array.

// ### Implementation in Dart

// Here’s how you can implement this approach in Dart:

List<int> findSubarrayWithSum(List<int> arr, int targetSum) {
  int start = 0;
  int currentSum = 0;

  for (int end = 0; end < arr.length; end++) {
    currentSum += arr[end];

    // Contract the window as long as the current sum is greater than the target sum
    while (currentSum > targetSum && start <= end) {
      currentSum -= arr[start];
      start++;
    }

    // Check if the current sum matches the target sum
    if (currentSum == targetSum) {
      return arr.sublist(start, end + 1);
    }
  }

  // Return an empty list if no subarray with the given sum is found
  return [];
}

void main() {
  List<int> arr = [1, 2, 3, 7, 5];
  int targetSum = 12;
  List<int> result = findSubarrayWithSum(arr, targetSum);

  if (result.isNotEmpty) {
    print("Subarray with sum $targetSum: $result");
  } else {
    print("No subarray with sum $targetSum found.");
  }
}

// ### Explanation:

// 1. **Initialization:**
//    - Initialize `start` to 0 and `currentSum` to 0. The `end` pointer iterates through the array.

// 2. **Expand the Window:**
//    - Add the current element to `currentSum`.

// 3. **Contract the Window:**
//    - If `currentSum` exceeds `targetSum`, move the `start` pointer to the
//      right and adjust `currentSum` by subtracting the element at `start`.

// 4. **Check for the Target Sum:**
//    - If `currentSum` matches `targetSum`, return the subarray from `start` to `end`.

// 5. **Return Result:**
//    - If no subarray with the target sum is found by the end of the loop, return an empty list.

// ### Time and Space Complexity:

// - **Time Complexity:** O(n)
//   - The sliding window technique ensures each element is processed a constant number of times,
//    resulting in linear time complexity.

// - **Space Complexity:** O(1)
//   - The algorithm uses a fixed amount of extra space beyond the input array, making the space complexity constant.

// This approach is efficient for finding a subarray with a given sum in an array
// with non-negative integers. If the array contains negative numbers, you might need to use different techniques, such as hash maps, to handle such cases.
