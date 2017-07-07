# Challenge: write a method that changes dates in the format 2016-06-17
# to the format 17.06.2016. You must use a regular expression and should
# only use methods described in this section.

# def format_date(date)
#   date.gsub(/(\d+)-(\d+)-(\d+)/, '\3.\2.\1')
# end

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)