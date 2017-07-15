# # GLOBALS
# arr = "harry"
# arr.match(/arr/)

# p $`, $', $&, $~, $=, $/, $`

# bar = [1, 2, 3]
# p bar.join
# $, = "!"
# p bar.join
# $, = "ERROR"
# p bar.join
# p "boss bass bolly".split
# $; = ""
# p "boss bass bolly".split
# p $:
# p $"
# p $"
# p "hash", "hash"
# p ENV

=begin

# KEYWORDS
BEGIN { p __ENCODING__, __LINE__ }
# END { p __ENCODING__, __LINE__ }
p "boss"

def arr
  arr = [1, 2, 3]
end

alias boss arr
p boss

$bill = "gosh"
alias $boss $bill
p $boss
p defined?(arr), defined?(balla)
undef arr
p defined?(arr)

p "hay" =~ /y/
p /y/ =~ "hay"
p "boss".match(/os/)
p /os/.match("boss")
p Regexp.last_match
# p \u{6771 4eac 90fd}
# p /\s\u{6771 4eac 90fd}/.match("Go to 東京都")
p /[a-dw-z]+/.match("Waze")

p /[a-w&&[^c-g]z]/.match("bos") # ([a-w] AND ([^c-g] OR z))

p /\$(?<dollars>\d+)\.(?<cents>\d+)/ =~ "$32.123"
p dollars, cents

p /([aeiouy]\w){2}/.match("Caenorhabditis elegans")
p /(?:[aeiouy]\w){2}/.match("Caenorhabditis elegans")

p /I(n)ves(ti)ga\2ons/.match("Investigations")
p /I(?:n)ves(ti)ga\1ons/.match("Investigations")
# p /I(?>n)ves(?>ti)gations/.match("Investigations")

# p "\u0667"
# p "\u07c4".match(/[[:digit:]]/)

# p /\p{Arabic}/.match("\u06E9")

# "    a b c".gsub(/ /, '_')    #=> "____a_b_c"
# "    a b c".gsub(/\G /, '_')  #=> "____a b c"
p "    a b c".gsub(/ /, '_')
p "    a b c".gsub(/\G /, '_')
p "abcdef".match(/abc(?=def)/)
p "abcde".match(/abc(?=def)/)
p "1234def".match(/.*(?=def)/)
p "1234def".match(/\d\d(?!def)/)
p "defabc".match(/(?<=def).*/)

# /\Band.+/.match("Supply and demand curve") #=> #<MatchData "and curve">
p "Supply and demand curve".match(/\Band.+/)

# /(?<=<b>)\w+(?=<\/b>)/.match("Fortune favours the <b>bold</b>")
p /(?<=<b>)\w+(?=<\/b>)/.match("Fortune favours the <b>bold</b>")

p /a(?i:b)c/.match("aBc")
p /a(?i:b)c/.match("abc")
p /a(?i:b)c/.match("aBC")


p /a(?x: #pretty good he     
  b)c/.match("abc")
  
p /a(?x: #pretty good he     
  b) c/.match("ab c")  

p /a(?x:     
  b) c/.match("abc")  
  
  
p /a # first we're asking for a
   b # then we're asking for b
   c # and now we're asking for c
   /x.match("abc")

p Regexp.new("abc", Regexp::IGNORECASE)
p Regexp.new("abc")

float_pat = /\A
    [[:digit:]]+ # 1 or more digits before the decimal point
    (\.          # Decimal point
        [[:digit:]]+ # 1 or more digits after the decimal point
    )? # The decimal point and following digits are optional
\Z/x
# float_pat.match('3.14') #=> #<MatchData "3.14" 1:".14">

float_pat = /\A
              [[:digit:]]+  # 1 or more digits before decimal point
              (\.           # decimal point
                [[:digit:]]+ # 1 or more digits after the decimal point
              )? # the decimal point and following digits are optional
            \Z/x
            
p float_pat.match('3.14')
float_pat = /\A [[:digit:]]+(\.[[:digit:]]+)?\z/x
            
            
p float_pat.match('3.14')

float_pat = /\A
    [[:digit:]]+ # 1 or more digits before the decimal point
    (\.          # Decimal point
        [[:digit:]]+ # 1 or more digits after the decimal point
    )? # The decimal point and following digits are optional
\Z/x
p float_pat.match('3.14')

=end

p s = 'a' * 25 + 'd' + 'a' * 4 + 'c'

# p /(b|a)/ =~ s #=> 0
# p /(b|a+)/ =~ s #=> 0
# p /(b|a+)*/ =~ s #=> 0

# p /(b|a+)*c/ =~ s #=> 26 # => VERY POOR PERFORMANCE
# p /(?>b|a+)*c/ =~ s #=> 26 # => GOOD PERFORMANCE


# p Regexp.new('a?' * 29 + 'a' * 29) =~ 'a' * 29 # => POOR PERFORMANCE
p Regexp.new('a{0,29}' + 'a' * 29) =~ 'a' * 29 # => GOOD PERFORMANCE