import strutils

var ids: seq[string]
while true:
  try:
    let id = readline(stdin)
    ids.add(id)
  except IOError:
    break

for i in 0..<ids.len:
  for j in i+1..<ids.len:
    if editDistance(ids[i], ids[j]) == 1:
      var ans: string
      for k in 0..<ids[i].len:
        if ids[i][k] == ids[j][k]: ans &= ids[i][k]
      echo(ans)
      quit()
      
