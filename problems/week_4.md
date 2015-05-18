# Week 4 Warmups
## JavaScript Event Loop
To be prepared, watch [this video](http://latentflip.com/loupe). Afterwards, play around with the event loop visualization on the website.

This is less of a CS warmup, but more of a quick lesson. We will watch the video again in the morning.

## Bubble Sort
Another sorting algorithm! Implement a function called `bubbleSort()` that takes an array of numbers and returns a sorted array.

Internally, it should loop through the array until it is sorted. Every time it loops, it compares each pair of numbers and switches them if the left one is greater than the right one.

For example, `bubbleSort([2,3,1,4])` should do the following internally:

```javascript
[2,3,1,4]
[2,1,3,4]
[1,2,3,4]
```

It's called a "bubble sort" because the bigger numbers bubble up the array to the higher indices.

For help, check out this video: https://www.youtube.com/watch?v=8Kp-8OGwphY

## Merge Sort
Merge sorting recursively cuts an array in two and sorts all halves before merging them back together. If the the first element of the first half is greater than its last element, their positions are swapped. This step is repeated for that half, then the other halves, recursively, until all sub-arrays are joined (merged) back together. The result is a fully sorted array.

Implement a function called `mergeSort()` that takes an array of numbers and returns a sorted array. It should resemble the above functionality.

For help, check out these videos:

- https://www.youtube.com/watch?v=e5ik2UGjHBk
- https://www.youtube.com/watch?v=EeQ8pwjQxTM

## Quick Sort
In most cases, quick sort is faster than bubble sort or merge sort.

Quick sort picks the final element of the array (called the "pivot"). We can put an imaginary "wall" in front of the array. All elements less than the pivot are put to the left of the wall by switching it with the lowest index and the current element; all those larger stay on the right of the wall. If an element that's less than the current element is found, they are swapped, and the wall is moved one index. At the end of each iteration, the pivot replaces the wall, placing it between the smaller and larger elements.

Implement this algorithm with a function called `quickSort()` that takes an array and returns a sorted array.

For help, check out this video: https://www.youtube.com/watch?v=aQiWF4E8flQ