# t1 = Thread.new do
#   while true
#     puts "Thread 1"
#   end
# end
# t2 = Thread.new do
#   while true
#     puts "Thread 2"
#   end
# end
# t1.join # wait for thread 1 to finish
# t2.join # wait for thread 2 to finish
