

def sieve(max)
  
  primes = (0..max).to_a
  
  primes[0] = primes[1] = nil
  
  
  counter = 0
  primes.each do |p|
    # Skip if nil
    next unless p

    # Break if we are past the square root of the max value 
    break if p*p > max
    counter += 1
    # Start at the square of the current number, and step through.
    # Go up to the max value, by multiples of the current number, and replace
    # that value with nil in the primes array
    (p*p).step(max,p) { |m| primes[m] = nil }
  end

  # Finally, return the compacted array.
  #puts "Solved for #{max} in #{counter} steps."
  
  primes.compact
end
	
def prime?(num)
  sieve(num).include?(num)
end	
	
Benchmark.bm do |x|
  x.report ()
	
	