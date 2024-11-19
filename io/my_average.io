

List myAverage := method(
  self foreach(element, 
    if(element type != "Number", 
      Exception raise("myAverage works with Numbers only")
    )
  )

  self average
)

list(1,2,3) myAverage println
list(1,2,"") myAverage println
