import strutils

proc count(s, sub: string): int =
  var i = 0
  while true:
    i = s.find(sub, i)
    if i < 0:
      break
    i += sub.len
    inc result

echo count("the three truths","th")

echo count("ababababab","abab")
