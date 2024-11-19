Array2d := Object clone

Array2d dim := method(cols, rows,
  data := List clone
  for(i, 1, rows, data append(
      row := List clone
      for(j, 1, cols, row append(nil))
    )
  )

  self data := data
  self
)

Array2d set := method(col_no, row_no, value,
  row := self data at(row_no)
  row atPut(col_no, value)
)

Array2d get := method(col_no, row_no,
  row := self data at(row_no)
  row at(col_no)
)

Array2d transpose := method(
  Array2d old_get := self getSlot("get")

  Array2d get := method(col_no, row_no,
    self old_get(row_no, col_no)
  )

  old_set := self getSlot("set")
  
  Array2d set := method(col_no, row_no, value,
    self old_set(row_no, col_no, value)
  )

  self
)

array2d := Array2d dim(2,3)

"allocated Array2d:-----------------------------------" println
array2d data println

"array2d set(1,0,5):-----------------------------------" println
array2d set(1,0,5)
array2d getSlot("data") println
"array2d get(1,0):-----------------------------------" println
array2d get(1,0) println

"transposed-----------------------------------" println
transposed := array2d transpose
transposed data println
"transposed get(0,1):-----------------------------------" println
transposed get(0,1) println
"transposed get(1,0):-----------------------------------" println
transposed get(1,0) println
"transposed set(1,0,7):-----------------------------------" println
transposed data println
"transposed get(1,0):-----------------------------------" println
transposed get(1,0) println