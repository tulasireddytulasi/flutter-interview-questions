Here's a table summarizing the time and space complexities of various popular sorting algorithms:

| **Sorting Algorithm** | **Best Time Complexity** | **Average Time Complexity** | **Worst Time Complexity** | **Space Complexity** | **Stable?** |
|-----------------------|--------------------------|-----------------------------|---------------------------|----------------------|-------------|
| **Bubble Sort**       | O(n)                     | O(n²)                        | O(n²)                      | O(1)                 | Yes         |
| **Selection Sort**    | O(n²)                    | O(n²)                        | O(n²)                      | O(1)                 | No          |
| **Insertion Sort**    | O(n)                     | O(n²)                        | O(n²)                      | O(1)                 | Yes         |
| **Merge Sort**        | O(n log n)               | O(n log n)                   | O(n log n)                 | O(n)                 | Yes         |
| **Quick Sort**        | O(n log n)               | O(n log n)                   | O(n²)                      | O(log n)             | No          |
| **Heap Sort**         | O(n log n)               | O(n log n)                   | O(n log n)                 | O(1)                 | No          |
| **Counting Sort**     | O(n + k)                 | O(n + k)                     | O(n + k)                   | O(k)                 | Yes         |
| **Radix Sort**        | O(nk)                    | O(nk)                        | O(nk)                      | O(n + k)             | Yes         |
| **Bucket Sort**       | O(n + k)                 | O(n + k)                     | O(n²)                      | O(n + k)             | Yes         |
| **Timsort**           | O(n)                     | O(n log n)                   | O(n log n)                 | O(n)                 | Yes         |

### Key Points:

- **Best Time Complexity**: The time complexity in the best-case scenario.
- **Average Time Complexity**: The time complexity on average.
- **Worst Time Complexity**: The time complexity in the worst-case scenario.
- **Space Complexity**: The amount of extra memory space required by the algorithm.
- **Stable?**: Indicates whether the sorting algorithm is stable (i.e., it preserves the relative order of elements with equal keys).

### Notes:

- **O(n)** indicates linear time complexity, where the time taken grows directly in proportion to the number of elements.
- **O(n log n)** is typical of efficient sorting algorithms like Merge Sort, Quick Sort (on average), and Heap Sort.
- **O(n²)** is less efficient, typical of simpler algorithms like Bubble Sort and Selection Sort.
- **O(1)** space complexity indicates an in-place algorithm that does not require additional memory.
- **O(k)** or **O(n + k)** indicates that the algorithm's complexity depends on the range or distribution of the input elements (e.g., Counting Sort and Radix Sort).