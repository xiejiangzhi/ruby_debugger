require "./debugger"

def fn(a, b)
  binding.debug #change a and b

  puts a * b
end

fn(1, 2)
