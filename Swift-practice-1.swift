//Binary Search

let array = [0,1,2,3,4,5,6,7,8,9,10]
let array2 = [0,2,4,6,8,10,12,14,16,18,20]

func rank(Array arr : [Int], search s : Int)->Int{
    var left = 0
    var right = arr.count - 1
    while (left <= right){
        let mid = (left + (right)) / 2
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

for i in 0...20 { rank(Array : array2, search : i) }
