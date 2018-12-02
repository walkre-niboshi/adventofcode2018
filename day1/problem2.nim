import strutils, intsets

var l: seq[int]
while true:
  try:
    let a = readline(stdin).parseInt
    l.add(a)
  except IOError:
    break

var
  f = initIntSet()
  s = 0
while true:
  for a in l:
    if f.contains(s):
      echo(s)
      quit()
    f.incl(s)
    s += a
