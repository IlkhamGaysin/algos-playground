require 'thread'

semaphore = Mutex.new
available_resources = 3

thread1 = Thread.new do
  semaphore.synchronize do
    if available_resources > 0
      available_resources -= 1
      puts "Thread 1 acquired a resource"
    else
      puts "Thread 1 waiting for a resource"
    end
  end
end

thread2 = Thread.new do
  semaphore.synchronize do
    if available_resources > 0
      available_resources -= 1
      puts "Thread 2 acquired a resource"
    else
      puts "Thread 2 waiting for a resource"
    end
  end
end

thread1.join
thread2.join
