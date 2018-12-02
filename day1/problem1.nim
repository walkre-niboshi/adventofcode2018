import strutils

var ans = 0
while true:
  try:
    let a = readline(stdin).parseInt
    ans += a
  except IOError:
    break

echo(ans)
