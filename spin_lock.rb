require 'thread'

spinlock = Mutex.new

thread1 = Thread.new do
  spinlock.lock
  # Critical section
  puts "Thread 1 is in the critical section"
  spinlock.unlock
end

thread2 = Thread.new do
  spinlock.lock
  # Critical section
  puts "Thread 2 is in the critical section"
  spinlock.unlock
end

thread1.join
thread2.join
