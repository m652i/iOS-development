//Binary Search

let array = [0,1,2,3,4,5,6,7,8,9,10]
let array2 = [0,2,4,6,8,10,12,14,16,18,20]

func rank(Array arr : [Int], search s : Int)->Int{
    var left = 0
    var right = arr.count - 1                                   //array.count gives array length
    while (left <= right){
        let mid = (left + (right)) / 2                          //variables that won't be modified use let
        if(arr[mid] == s){
            print("number \(s) found at index \(mid)")
            return mid
        }
        if(arr[mid] < s){
            left = mid + 1
        }
        else{
            right = mid - 1
        }
    }
    print("number \(s) not found in array")
    return -1
}

for i in 0...20 { rank(Array : array2, search : i) }            //function calls

/*
results 

number 0 found at index 0
number 1 not found in array
number 2 found at index 1
number 3 not found in array
number 4 found at index 2
number 5 not found in array
number 6 found at index 3
number 7 not found in array
number 8 found at index 4
number 9 not found in array
number 10 found at index 5
number 11 not found in array
number 12 found at index 6
number 13 not found in array
number 14 found at index 7
number 15 not found in array
number 16 found at index 8
number 17 not found in array
number 18 found at index 9
number 19 not found in array
number 20 found at index 10
*/
