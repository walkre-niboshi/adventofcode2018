import strutils, algorithm, tables

var records: seq[string]
while true:
  try:
    let input = readline(stdin)
    records.add(input)
  except IOError:
    break

sort(records, system.cmp[string])

var
  total = initCountTable[int]()
  duration = initTable[int, seq[tuple[b, e: int]]]()
  id, b: int
for r in records:
  if r.contains("Guard"):
    id = r.split[3].substr(1).parseInt
  elif r.contains("falls"):
    b = r.split({' ', ']', ':'})[2].parseInt
  else:
    let e = r.split({' ', ']', ':'})[2].parseInt
    total.inc(id, e-b)
    if not duration.contains(id): duration.add(id, @[])
    duration[id].add((b, e))

var maxfreq, ans:int
for k, v in total:
  var count = initCountTable[int]()
  for i in 0 ..< duration[k].len:
    let
      b = duration[k][i].b
      e = duration[k][i].e
    for j in b ..< e: count.inc(j)
  if count.largest.val > maxfreq:
    maxfreq = count.largest.val
    ans = k * count.largest.key

echo(ans)
