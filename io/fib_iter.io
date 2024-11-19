fib := Object clone
fib calc := method(arg,
  previousPreviousNumber := 0
  previousNumber := 0
  currentNumber := 1

  for(i, 1, arg,
    previousPreviousNumber = previousNumber
    previousNumber = currentNumber
    currentNumber = previousPreviousNumber + currentNumber
  )

  currentNumber
)

fib calc(0) println
fib calc(1) println
fib calc(2) println
fib calc(3) println
fib calc(4) println
