sum_2d := method(
  result := 0
  self foreach(row, row foreach(elememt,
      result = result + elememt
    )
  )
  result
)

  list(
    list(1,2,3),
    list(4,5,6)
  ) sum_2d println