regexes = [/\b\d\d\d\d*\b/]
strings = ["Four and 20 black birds", "365 days in a year, 100 years in a century.",
          "My phone number is 222-555-1212.", "My serial number is 345678912."]

strings.each do |str|
  regexes.each do |regex|
    puts "#{str} matches #{regex}" if str.match(regex)
    puts "#{str} does not match #{regex}" unless str.match(regex)
  end
end

fetch_url(text) if text.match(/\Ahttps?:\/\/\S+\z/)

fetch_url(text) if text =~ /\Ahttps?:\/\/\S+\z/

record = "xyz\tabscas\t123423\tabs023"
fields = record.split("\t")

record = "xyzz  3456    \t   3334\t\t\tabc"
fields = record.split(/\s+/)

"abc:xyz".split(/:*/)

string = "'house\" is a great \"tv show'"
# capture = string.match(/['"].+['"]/)
capture = string.match(/['"].+?['"]/)
capture = string.match(/(['"]).+?\1/)
p capture[0]

text = "Four score and seven"
voweless = text.gsub(/[aeiou]/, "")

text = %(We read "War of the Worlds".)
puts text.sub(/(['"]).+\1/, '\1The Time Machine\1')
puts text.sub(/(['"]).+\1/, "\1The Time Machine\1")
puts text.sub(/(['"]).+\1/, "\\1The Time Machine\\1")