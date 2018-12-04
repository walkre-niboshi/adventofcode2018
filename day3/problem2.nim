import strutils, tables

var ids, xs, ys, ws, hs: seq[int]
while true:
  try:
    let
      input = readline(stdin).split({'#', ' ', ',', ':', 'x'})
      id = input[1].parseInt
      x = input[3].parseInt
      y = input[4].parseInt
      w = input[6].parseInt
      h = input[7].parseInt
    ids.add(id)
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

for i in 0 ..< xs.len:
  let
    id = ids[i]
    x = xs[i]
    y = ys[i]
    w = ws[i]
    h = hs[i]
  var ok = true
  for j in x ..< x+w:
    if not ok: break
    for k in y ..< y+h:
      if count[j][k] > 1:
        ok = false
        break
  if ok:
    echo(id)
    quit()
