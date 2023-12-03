io.input("data.txt")

function firstStringToNumberReverse(line) 
    local numbers ={
        ["eno"]=1,
        ["owt"]=2, 
        ["eerht"]=3,
        ["ruof"]=4,
        ["evif"]=5,
        ["xis"]=6,
        ["neves"]=7,
        ["thgie"]=8, 
        ["enin"]=9
    }
    
    line = string.reverse(line)
    local lowest_index = nil
    local replace_key = nil
    
    for i, j in pairs(numbers) do
        index, _index = string.find(line,i)
        if(not (index == nil)) then
            if(lowest_index == nil) then
             lowest_index = index
             replace_key = i
            end
            if(lowest_index > index) then
                lowest_index = index
                replace_key = i
            --    io.write("New lowest index: ", lowest_index, "\n")
            end
        end
    end
    if(replace_key == nil) then return line end
    new_line = string.gsub(line, replace_key, numbers[replace_key])
    return new_line   
end

function firstStringToNumber(line) 
    local numbers ={
        ["one"]=1,
        ["two"]=2, 
        ["three"]=3,
        ["four"]=4,
        ["five"]=5,
        ["six"]=6,
        ["seven"]=7,
        ["eight"]=8, 
        ["nine"]=9
    }
    
    local lowest_index = nil
    local replace_key = nil
    
    for i, j in pairs(numbers) do
        index, _index = string.find(line,i)
        if(not (index == nil)) then
            if(lowest_index == nil) then
             lowest_index = index
             replace_key = i
            end
            if(lowest_index > index) then
                lowest_index = index
                replace_key = i
            --    io.write("New lowest index: ", lowest_index, "\n")
            end
        end
    end
    if(replace_key == nil) then return line end
    new_line = string.gsub(line, replace_key, numbers[replace_key])
    return new_line   
end



local result = 0
while true do
  local line = io.read()
  if line == nil then break end
  replace_line = firstStringToNumber(line)
  new_replace_line = firstStringToNumberReverse(line) 
  local fd = string.match(replace_line,"%d")
  local ld = string.match(new_replace_line,"%d")
  local number = string.format("%d%d  ", fd, ld)
  io.write(string.format("%d%d  ", fd, ld), replace_line, " ",new_replace_line, "\n")
  result = result + number
end

io.write("The solution is ", result)