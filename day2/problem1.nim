import tables

var
  two: int
  three: int
while true:
  try:
    let id = readline(stdin)
    var t = initCountTable[char]()
    for c in id: t.inc(c)
    
    for k, v in t:
      if v == 2:
        inc(two)
        break
    for k, v in t:
      if v == 3:
        inc(three)
        break
  except IOError:
    break

echo(two*three)
