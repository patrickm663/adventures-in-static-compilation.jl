# Example 1: Prime Checker

To test things out, first thing I always do in a brand-new language is a prime checker. From that, it becomes a prime counter and so-on and so-forth. This also leads to some _Project Euler_-style examples to learn parts of the syntax before moving on to something more complex.

The algorithm here isn't too important, but I did come across it on this blog: https://www.adityathebe.com/sum-of-first-million-prime-numbers/

To execute the script, run:

```
julia --project=. main.jl
```

It should create an executable called `is_prime` and a shared object file called `is_prime.o` in the current directory.

The executable can be run as follows:

```
./is_prime 1000000007

1000000007 is prime
```

**More to come on the code itself**
