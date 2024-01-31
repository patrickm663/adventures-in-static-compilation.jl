# A simple prime checker -- blazingly fast!
# Licence: MIT

using StaticCompiler, StaticTools

# Standard Julia
function is_prime(n::Int64)::Bool
  if n ≤ 1
    return false
  end
  if n ≤ 3
    return true
  end
  if n % 2 == 0 || n % 3 == 0
    return false
  end
  k = 5
  while k*k ≤ n && k > 0 # needs the test that k > 0 else won't compile since it can't guarantee no division by zero
    if n % k == 0 || n % (k+2) == 0
      return false
    end
    k = k + 6
  end
  return true
end

# Acts like the 'C' main function and parses arguments
function is_prime(argc::Int, argv::Ptr{Ptr{UInt8}})
  # the 2 arguments represent the executable + the input
  argc == 2 || return printf(c"Incorrect number of command-line arguments\n") 
  n = argparse(Int64, argv, 2)
  if is_prime(n)
    printf(c"%d is prime\n", n) # how printing to console needs to be handled via C strings
  else
    printf(c"%d is not prime\n", n)
  end
end

# Creates an executable called `is_prime`
compile_executable(is_prime, (Int64, Ptr{Ptr{UInt8}}), "./")
