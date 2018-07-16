import os, strutils, times, streams, sequtils

if existsFile("did.txt") == false:
  writeFile("did.txt", "")

let file = readFile("did.txt")

var f : File;
discard f.open(0, fmRead)

var today = ""

var done = false

while done == false:
  var nextLine = f.readLine()
  if nextLine == ":q":
    done = true
  elif nextLine == ":s":
    let content = format(now(), "ddd d/MM/yyyy hh:mm") & "\n" & today & "\n" & file
    writeFile("did.txt", content)
    echo readFile("did.txt")
    done = true
  else:
    today &= nextLine & "\n"