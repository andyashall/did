import os, strutils, times, streams, sequtils

if existsFile("did.txt") == false:
  writeFile("did.txt", "")

let file = readFile("did.txt")

var f : File;
discard f.open(0, fmRead)

var today = ""

var done = false

echo "What did you do today? (Use [-h] for help)"

while done == false:
  var nextLine = f.readLine() & "\n"
  if nextLine == "-h\n":
    echo "Enter what you did today separated by returns"
    echo "Use -s in a new line to save your lines"
    echo "Use -q in a new line to quit without saving"
    nextLine = ""
  if nextLine == "-q\n":
    done = true
  elif nextLine == "-s\n":
    let content = format(now(), "ddd d/MM/yyyy hh:mm") & "\n" & today & "\n" & file
    writeFile("did.txt", content)
    echo readFile("did.txt")
    done = true
  else:
    today &= nextLine