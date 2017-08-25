p Thread.main
p Thread.new { sleep }.kill

p Thread.new { sleep }
thread1 = Thread.new {}
p thread1.status
thread2 = Thread.new { raise("Exception raised!") }
sleep(1)
p thread2