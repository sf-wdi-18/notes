# Basic Solution to Exercise 1
def pTimes(statement,num)
  i = 0
  while i < num do
    puts statement
    i += 1
  end
end

# A spiffy way to do it
def pTimes2(statement,num)
  num.times do
    puts statement
  end
end

# pTimes('hello',5)

# Solution to Exercise 2
def letterCount(str)
  ans = {}
  i = 0
  while i < str.length do
    if ans[str[i]] == nil
      ans[str[i]] = 1
    else
      ans[str[i]] += 1
    end
    i += 1
  end
  ans
end

# puts letterCount 'hello'
def mockMe
  while true do
    mock = gets.chomp
    if mock == 'quit'
      break
    else 
      puts mock
    end
  end
end

# mockMe

# Exercise 4
def printContacts(contacts)
  contacts.each do |k,v,l|
    puts k, v
  end
end

contactsHash = {'michael' => '555-555-5555', 'del' => '666-666-6666'}
# printContacts contactsHash

# Exercise 5
def getContact(contacts)
  puts contacts
  puts 'Name: '
  name = gets.chomp
  puts 'Phone: '
  phone = gets.chomp
  contacts[name] = phone
  contacts
end

# puts getContact contactsHash

## List exercises
def getSum(xs)
  xs.inject do |memo,x|
    memo + x
  end
end

# puts getSum [1,2,3]

def getMax(xs)
  xs.inject do |memo,x|
    if memo < x
      x
    else
      memo
    end
  end
end

# puts getMax [1,2,5,4,3]

def getMin(xs)
  xs.inject do |memo,x|
    if memo < x
      memo
    else
      x
    end
  end
end

# puts getMin [1,2,-2,5,4,3]

def reverseStr(str)
  str.chars.inject do |memo, x|
    x + memo
  end
end

# puts reverseStr "hello world"

def partialSums(arr)
  sums = [0]
 arr.inject(0) do |memo,x|
    sums.push(memo+x)
    memo+x
  end
 sums
end

# p partialSums [1,2,3]

def multiplyBy(num,arr)
  arr.map do |x|
    x * num
  end
end

def reverseEach(arr)
  arr.map do |x|
    reverseStr x
  end
end

# p reverseEach ['hello','world','michael']

def getResponses(arr)
  arr.map do |x|
    puts x
    gets.chomp
  end
end

# p getResponses ['what','the','fuck']

def factorial(n)
  if n < 2
    1
  else
    n * factorial(n-1)
  end
end

# puts factorial 4


