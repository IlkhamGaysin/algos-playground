require 'thread'

mutex = Mutex.new

thread1 = Thread.new do
  # mutex.synchronize do
    # Critical section
    puts "Thread 1 is in the critical section"
    sleep(2)
  # end
end

thread2 = Thread.new do
  # mutex.synchronize do
    # Critical section
    puts "Thread 2 is in the critical section"
  # end
end

thread1.join
thread2.join
