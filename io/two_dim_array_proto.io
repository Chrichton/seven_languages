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

array2d := Array2d dim(2,3)
array2d getSlot("data") println

array2d set(1,0,5)
array2d getSlot("data") println
array2d get(1,0) println