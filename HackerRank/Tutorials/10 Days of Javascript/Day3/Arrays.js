'use strict';

process.stdin.resume();
process.stdin.setEncoding('utf-8');

let inputString = '';
let currentLine = 0;

process.stdin.on('data', inputStdin => {
    inputString += inputStdin;
});

process.stdin.on('end', _ => {
    inputString = inputString.trim().split('\n').map(string => {
        return string.trim();
    });
    
    main();    
});

function readLine() {
    return inputString[currentLine++];
}

/**
*   Return the second largest number in the array.
*   @param {Number[]} nums - An array of numbers.
*   @return {Number} The second largest number in the array.
**/
function getSecondLargest(nums) {
    // Complete the function
    nums.sort()                               // Sort the array
    
    var maximum = Math.max.apply(null, nums); // Find the largest number
    
    var belowMaxValues = []
    
    for(var i = 0; i < nums.length; i++) {
        if (nums[i] < maximum) {
            belowMaxValues.push(nums[i]);     // Add values less than the max to the array
        }
    }

    return Math.max.apply(null, belowMaxValues);       // Return the largest value
}


function main() {
    const n = +(readLine());
    const nums = readLine().split(' ').map(Number);
    
    console.log(getSecondLargest(nums));
}
