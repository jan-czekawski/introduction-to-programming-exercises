# Challenge: Write a regex that matches HTML h1 header tags, e.g.,

# <h1>Main Heading</h1>
# <h1>Another Main Heading</h1>

# and the content between the opening and closing tags. If multiple header 
# tags appear on one line, your regex should not match any other text on the
# line: just the opening and closing tags, and the text that makes up the header.
# You may assume that there are no nested tags in the textual
# part between <h1> and </h1>.

# <h1>Main Heading</h1>
# <h1>Another Main Heading</h1>
# <h1>ABC</h1> <p>Paragraph</p> <h1>DEF</h1><p>Done</p>


# regex = /<h1>.*<\/h1>/
regex = /<h1>.*?<\/h1>/

strings = ["<h1>Main Heading</h1>", "<h1>Another Main Heading</h1>",
           "<h1>ABC</h1> <p>Paragraph</p> <h1>DEF</h1><p>Done</p>"]

strings.each do |word|
  if word.match(regex)
    puts "#{word} matches #{regex}"
  else
    puts "#{word} does not match #{regex}"
  end
end