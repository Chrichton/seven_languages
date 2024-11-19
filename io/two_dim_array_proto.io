Array2d := Object clone
Array2d dim := method(x, y,
  data := List clone
  for(i, 1, y, data append(
      row := List clone
      for(j, 1, x, row append(nil))
    )
  )

  self data := data
  self
)

array2d := Array2d dim(2,3)
array2d getSlot("data") println
