Array2d := Object clone

Array2d dim := method(col_count, row_count,
  data := List clone
  for(i, 1, row_count, data append(
      row := List clone
      for(j, 1, col_count, row append(nil))
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

  Array2d old_set := self getSlot("set")
  Array2d set := method(col_no, row_no, value,
    self old_set(row_no, col_no, value)
  )

  self
)

Array2d save := method(filename,
  f := File with(filename)
  f remove
  f openForUpdating

  col_count := self data at(0) size
  f write(col_count asString ..",")

  row_count := self data size
  f write(row_count asString ..",")

  for(i, 0, col_count - 1,
    for(j, 0, row_count - 1,
      element := self get(i,j)
      if(element == nil, f write("nil" ..","), 
        element_str := element asString ..","
        f write(element_str)
      )
    )
  )
  f close
)

Array2d read := method(filename,
  f := File with(filename)
  f openForReading

  line := f readLine
  numbers := line split(",")
  col_count := numbers at(0) asNumber
  row_count := numbers at(1) asNumber

  array2d := Array2d dim(col_count, row_count)

  "read--------" println

  for(row_no, 0, row_count - 1,
    for(col_no, 0, col_count - 1,
      numbers_index := 2 + row_no * col_count + col_no
      element := nil
      element_str := numbers at(numbers_index)
      if(element_str != "nil", element = element_str asNumber)

      array2d set(row_no, col_no, element)
    )
  )

  array2d
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
transposed set(1,0,7)
transposed data println
"transposed get(1,0):-----------------------------------" println
transposed get(1,0) println

"save/read-----------------------------------" println
transposed save("transposed.data")
read_array2d := Array2d read("transposed.data")
read_array2d data println
