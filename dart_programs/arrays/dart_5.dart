// To find the intersection of two arrays (i.e., common elements between them),
//you can use different approaches based on time and space complexity.
//Here’s a method using hash sets for efficient intersection calculation:

// ### Approach: Using Hash Sets

// This approach utilizes hash sets to achieve an efficient solution. Here’s how it works:

// 1. **Create a Hash Set for the First Array:**
//    - Store all elements from the first array in a hash set.

// 2. **Iterate Through the Second Array:**
//    - Check if each element of the second array is present in the hash set.
//If it is, that element is part of the intersection.

// 3. **Store the Intersection Elements:**
//    - Use another hash set to store the intersection elements to avoid duplicates.

// ### Implementation in Dart

Set<int> findIntersection(List<int> arr1, List<int> arr2) {
  Set<int> set1 = arr1.toSet();
  Set<int> intersection = {};

  for (int num in arr2) {
    if (set1.contains(num)) {
      intersection.add(num);
    }
  }

  return intersection;
}

void main() {
  List<int> arr1 = [1, 2, 2, 3, 4];
  List<int> arr2 = [2, 2, 3, 5, 6];

  Set<int> commonElements = findIntersection(arr1, arr2);
  print("Intersection of the two arrays: $commonElements");
}

// ### Explanation:

// 1. **Convert First Array to Set:**
//    - `arr1.toSet()` converts the first array into a hash set, which allows O(1) average time complexity for lookups.

// 2. **Check for Intersection:**
//    - For each element in `arr2`, check if it exists in `set1`. If it does, add it to the `intersection` set.

// 3. **Result:**
//    - The `intersection` set contains all unique common elements between `arr1` and `arr2`.

// ### Example Output:
// For the arrays `[1, 2, 2, 3, 4]` and `[2, 2, 3, 5, 6]`, the output will be:
// ```
// Intersection of the two arrays: {2, 3}
// ```

// ### Time and Space Complexity:

// - **Time Complexity:**
//   - **Best Case:** O(n1 + n2) (where n1 is the length of the first array and n2 is the length of the second array)
//   - **Explanation:** Converting the first array to a set takes O(n1),
//and checking for intersection with the second array takes O(n2). Therefore,
//the total time complexity is linear in terms of the combined size of the two arrays.

// - **Space Complexity:**
//   - **Best Case:** O(n1 + min(n1, n2)) (or O(n1) in the worst case where `n1` is larger)
//   - **Explanation:** The space complexity is determined by the storage used for the hash set.
//We store up to `n1` elements in the set and additional space for the intersection set,
//which in the worst case can be as large as the smaller of the two arrays.

// This approach is efficient for finding the intersection of two arrays,
//making good use of hash sets for quick lookups and ensuring minimal space usage compared to other methods.
