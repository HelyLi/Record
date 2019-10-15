-- print(type(os.time()))
-- local timetable = os.date("*t", 1566360526000/1000);   -->os.date用法
-- for i, v in pairs(timetable) do
--       print(i, v);
--     print(type(i), type(v))
-- end

-- print(math.floor((os.time() - 1508902620000/1000)/(60*60*24)))


local T = {
  ["16"] = 8,
  ["8"] = 4
}

for i,v in pairs(T) do
  print(i,v)
end

T = {
  [1] = 8,
  [2] = 4
}

table.sort(T, function(a, b) 
  print("a:",a,",b:", b)
return a > b
end)

print(T["8"])

local str = "sssddd/adddd/lymj"

print(string.find(str, "%l%lmj"))

local sstr = string.gsub(str, '%l%lmj', "pxmj")

print(sstr)