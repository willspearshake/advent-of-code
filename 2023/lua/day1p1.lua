io.input("datap1.txt")

local result = 0
while true do
  local line = io.read()
  if line == nil then break end
  local fd = string.match(line,"%d")
  local ld = string.match(string.reverse(line),"%d")
  local number = string.format("%d%d  ", fd, ld)
  io.write(string.format("%d%d  ", fd, ld), line, "\n")
  result = result + number
end

io.write("The solution is ", result)