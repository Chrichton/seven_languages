orgDiv := Number getSlot("/")

Number / := method(denominator,
  if(denominator == 0, 0, self orgDiv(denominator))
)

4 / 2 println
4 / 0 println