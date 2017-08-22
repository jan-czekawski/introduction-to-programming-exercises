words = %w(goodbye bye just mark)
nums = [*1..10]

words_thread = Thread.new do
                 words.each { |word| p word}
               end

nums_thread = Thread.new do
                nums.each { |num| p num }
              end
              
[words_thread, nums_thread].each { |t| t.join }