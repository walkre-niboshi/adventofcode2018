import strutils, tables

var xs, ys, ws, hs: seq[int]
while true:
  try:
    let
      input = readline(stdin).split({' ', ',', ':', 'x'})
      x = input[2].parseInt
      y = input[3].parseInt
      w = input[5].parseInt
      h = input[6].parseInt
    xs.add(x)
    ys.add(y)
    ws.add(w)
    hs.add(h)

  except IOError:
    break


var count = initTable[int, CountTable[int]]()
for i in 0 ..< xs.len:
  let
    x = xs[i]
    y = ys[i]
    w = ws[i]
    h = hs[i]
  for j in x ..< x+w:
    if not count.contains(j):
      count[j] = initCountTable[int]()
    for k in y ..< y+h:
      count[j].inc(k)

var ans = 0
for v in count.values:
  for c in v.values:
    if c >= 2: inc(ans)

echo(ans)
