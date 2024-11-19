fib := Object clone

fib calc := method(arg, 
  if(arg == 0, 1, 
    if(arg == 1, 1, fib calc(arg - 2) + fib calc(arg - 1))
  )
)

fib calc(0) println
fib calc(1) println
fib calc(2) println
fib calc(3) println
fib calc(4) println