wget: curl's alternative to get site's Location
Added by over 3 years ago

Some sites (esp. with mirrors) are often redirected to the nearest locations (server), and sometimes you really want to know which server are used.

I often used curl

src=http://google.com/
echo "$src" 
while true; do
  location="`curl -sI $src 2>/dev/null |grep Location: 2>/dev/null`" 
  if [ $? -eq 0 ]; then
    src="`echo $location | cut -d' ' -f2`" 
    echo "=> $src" 
  else
    break
  fi
done

# The output
#   google.com
#   => http://www.google.com/
#   => http://www.google.com.vn/
The problem is that a system may not have curl installed. If we have wget can we get the same results?

src=http://google.com/
echo $src
while true; do
  location="`wget --max-redirect=0 $src 2>&1 1>/dev/null | grep Location: 2>/dev/null`" 
  if [ $? -eq 0 ]; then
    src="`echo $location | cut -d' ' -f2`" 
    echo "=> $src" 
  else
    break
  fi
done
The result:

#   google.com
#   => http://www.google.com/
#   => http://www.google.com.vn/
Yes it works:) I may call this HTTP traceroute but such tool seems to exist.