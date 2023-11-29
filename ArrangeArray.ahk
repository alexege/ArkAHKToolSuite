; MyArray := []
; itemsToDrop := ["sto", "ber", "fli", "see", "woo", "tha"]

; Sort, itemsToDrop, Random

; Loop, Parse, itemsToDrop, `n, `r
;     MyArray.Push(StrSplit(A_LoopField, ";"))

; for i, v in MyArray
;     s .= i "=" v[1] "," v[2] "`n"
;     ; MsgBox, % s

; MsgBox, % MyArray
; return


; Function to perform Fisher-Yates shuffle on an array
FisherYatesShuffle(arr, size) {
    Random, rand, 1, % size
    Loop, % size - 1 {
        temp := arr[A_Index]
        arr[A_Index] := arr[rand]
        arr[rand] := temp
        rand := A_Index
    }
}

; Example array of strings
myArray := ["Apple", "Banana", "Cherry", "Date", "Elderberry"]

; Display the original array
; MsgBox, Original Array:`n%myArray%

; Perform Fisher-Yates shuffle
FisherYatesShuffle(myArray, myArray.Length())
FisherYatesShuffle(myArray, myArray.Length())
FisherYatesShuffle(myArray, myArray.Length())

; Display the randomly sorted array
; MsgBox, Randomly Sorted Array:`n%myArray%

For i in myArray
    MsgBox, % myArray[i]