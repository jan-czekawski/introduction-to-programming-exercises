# Challenge: write a method that changes dates in the 
# format 2016-06-17 or 2016/06/17 to the format 17.06.2016. You 
# must use a regular expression and should only use methods
# described in this section.

def format_date(org_date)
  # org_date.gsub(/\A(\d{4})([\-\/])(\d{2})\2(\d{2})\z/, '\4.\3.\1')
  org_date.gsub(/\A(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)\z/, '\4.\3.\1')
end

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
               .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)\z/, '\3.\2.\1')
end

# Alternate solution

def format_date(original_date)
  date_regex = /\A(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)\z/
  original_date.sub(date_regex, '\4.\3.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)

