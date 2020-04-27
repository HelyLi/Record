-- print(type(os.time()))
-- local timetable = os.date("*t", 1566360526000/1000);   -->os.date用法
-- for i, v in pairs(timetable) do
--       print(i, v);
--     print(type(i), type(v))
-- end

-- print(math.floor((os.time() - 1508902620000/1000)/(60*60*24)))


-- local T = {
--   ["16"] = 8,
--   ["8"] = 4
-- }

-- for i,v in pairs(T) do
--   print(i,v)
-- end

-- T = {
--   [1] = 8,
--   [2] = 4
-- }

-- table.sort(T, function(a, b) 
--   print("a:",a,",b:", b)
-- return a > b
-- end)

-- print(T["8"])

-- local str = "sssddd/adddd/lymj"

-- print(string.find(str, "%l%lmj"))

-- local sstr = string.gsub(str, '%l%lmj', "pxmj")

-- print(sstr)

-- local strttt = "com.ccca.mnyx"
-- local find = string.find(strttt, "%l%lyx")
-- print(find)
-- print(string.sub(strttt, 1, find - 1))

-- local st = "xxxx/"
-- if string.byte(st, #st) == 47 then
--   st = string.sub(st, 1, #st - 1)
-- end
-- print(st)


-- local MAX_HAND_CARD_NUM = 17

-- local handCardNum = 17

-- for i=MAX_HAND_CARD_NUM,0,-1 do
--   local startPosIndx = math.floor((MAX_HAND_CARD_NUM -i)/2)
--   print("handCardnum:", i, ",startPosIndx:", startPosIndx)

--   for j=1,i do
--     print("curPos:", j , ":pos:", startPosIndx + j)
--   end
-- end

-- local pb = require "pb"
-- local protoc = require "protoc"

-- load schema from text
-- assert(protoc:load [[
--    message Phone {
--       optional string name        = 1;
--       optional int64  phonenumber = 2;
--    }
--    enum INT32 {
--    }
--   message UINT32 {
--     optional int32  num = 1;
--  }
--    message Person {
--       optional string name     = 1;
--       optional int32  age      = 2;
--       optional string address  = 3;
--       repeated INT32 cardDataenum = 4;
--       repeated int32 cardData = 5;
--       repeated Phone  contacts = 6;
--       repeated UINT32 UINT32_d = 7;
--    } ]])

-- lua table data
-- local data = {
--    name = "ilse",
--    age  = 18,
--    cardDataenum = {0,1,2,3},
--    cardData = {
--      12,13,14
--    },
--    contacts = {
--       { name = "alice", phonenumber = 12312341234 },
--       { name = "bob",   phonenumber = 45645674567 }
--    },
--    UINT32_d = {
--      {num = 1},{num = 3}
--    }
-- }

-- encode lua table data into binary format in lua string and return
-- local bytes = assert(pb.encode("Person", data))
-- print(pb.tohex(bytes))

-- and decode the binary data back into lua table
-- local data2 = assert(pb.decode("Person", bytes))
-- print(require "serpent".block(data2))
-- local is = coroutine.isyieldable()
-- print(is)
-- coco = coroutine.create(function (a,b)
--    print("resume args:"..a..","..b)
--    is = coroutine.isyieldable()
--    print("3", is)
--    yreturn = coroutine.yield(2)
--    print ("yreturn :"..yreturn)
--    is = coroutine.isyieldable()
--    print("1", is)
-- end)
-- local a ,d = coroutine.resume(coco,0,1)
-- print(a, d)
-- is = coroutine.isyieldable()
-- print("2", is)
-- local b , c = coroutine.resume(coco,31)
-- print(b, c)

-- function status()
--    print("co1's status :"..coroutine.status(co1).." ,co2's status: "..coroutine.status(co2))
-- end

-- co1 = coroutine.create(function ( a )
--    print("arg is :"..a)
--    status()
--    local stat,rere = coroutine.resume(co2,"2")
--    print("resume's return is "..rere)
--    status()
--    local stat2,rere2 = coroutine.resume(co2,"4")
--    print("resume's return is "..rere2)
--    local arg = coroutine.yield("6")
-- end)
-- co2 = coroutine.create(function ( a )
--    print("arg is :"..a)
--    status()
--    local rey = coroutine.yield("3")
--    print("yeild's return is " .. rey)
--    status()
--    coroutine.yield("5")
-- end)
-- --主线程执行co1,传入字符串“main thread arg”
-- stat,mainre = coroutine.resume(co1,"1")
-- status()
-- print("last return is "..mainre)

-- local room = "19,20,22,36"
-- local rooms = string.split()

-- local sessionInfo = {}

-- local str = sessionInfo and sessionInfo.localTips or ""
-- print(str)

-- local name = {
--     "状元插金花",
--     "六杯红",
--     "六杯黑",
--     "五王",
--     "五子带一秀",
--     "五子登科",
--     "状元",
--     "对堂",
--     "三红",
--     "四进",
--     "二举",
--     "一秀",
-- }

-- local index = {
--     1,
--     2,
--     3,
--     4,
--     5,
--     6,
--     7,
--     8,
--     9,
--     10,
--     11,
--     12
-- }

-- local dice = {
--     {4,4,4,4,1,1},
--     {4,4,4,4,4,4},
--     {6,6,6,6,6,6},
--     {4,4,4,4,4,x},
--     {x,x,x,x,x,4},
--     {x,x,x,x,x,0},
--     {4,4,4,4,x,x},
--     {1,2,3,4,5,6},
--     {4,4,4,x,x,x},
--     {x,x,x,x,0,0},
--     {4,4,0,0,0,0},
--     {4,0,0,0,0,0}
-- }

-- function shuffle(tbl)
--     for i = #tbl, 2, -1 do
--         local j = math.random(i)
--         tbl[i], tbl[j] = tbl[j], tbl[i]
--     end
--     return tbl
-- end

--乱序
-- function shuffle(t)
--     if type(t)~="table" then
--         return
--     end
--     local tab={}
--     local index=1
--     while #t~=0 do
--         local n=math.random(0,#t)
--         if t[n]~=nil then
--             tab[index]=t[n]
--             table.remove(t,n)
--             index=index+1
--         end
--     end
--     return tab
-- end

-- for i,v in ipairs(dice[1]) do
--     print(i,v)
-- end
-- math.randomseed(os.time())
-- math.random()
-- table.sort(dice[1], function(a, b)
--     return math.random(1,10) < 5
-- end)

-- T = {}
-- repeat
--     local r = math.random(1, 6)
--     if r ~= 4 then
--         for i=1,5 do
--             table.insert(T, r)
--         end
--         repeat
--             local r2 = math.random(1, 6)
--             if r2 ~= r then
--                 table.insert(T, r2)
--             end
--         until (r2 ~= r)
--     end
-- until (r ~= 4)

-- function getZYIndex()
--     -- math.newrandomseed()
--     math.randomseed(os.time())
--     local indx =  7--math.random(1, #BC_ZY)
--     local T = {}
--     if indx == 1 then
--         T = {4,4,4,4,1,1}
--     elseif indx == 2 then
--         T = {4,4,4,4,4,4}
--     elseif indx == 3 then
--         T = {6,6,6,6,6,6}
--     elseif indx == 4 then
--         T = {4,4,4,4,4}
--         repeat
--             local r = math.random(1, 6)
--             if r ~= 4 then
--                 table.insert(T, r)
--             end
--         until (r ~= 4)
--     elseif indx == 5 then
--         T = {4}
--         repeat
--             local r = math.random(1, 6)
--             if r ~= 4 then
--                 for i=1,5 do
--                     table.insert(T, r)
--                 end
--             end
--         until (r ~= 4)
--     elseif indx == 6 then
--         T = {}
--         repeat
--             local r = math.random(1, 6)
--             if r ~= 4 then
--                 for i=1,5 do
--                     table.insert(T, r)
--                 end
--                 repeat
--                     local r2 = math.random(1, 6)
--                     if r2 ~= r then
--                         table.insert(T, r2)
--                     end
--                 until (r2 ~= r)
--             end
--         until (r ~= 4)
--     elseif indx == 7 then
--         T = {4,4,4,4}
--         repeat
--             local r = math.random(1, 6)
--             local r2 = math.random(1, 6)
--             if r ~= 4 and r2 ~= 4 then
--                 table.insert(T, r)
--                 table.insert(T, r2)
--             end
--         until (r ~= 4 and r2 ~= 4)
--     end
    
--     T = shuffle(T)
--     return T
-- end

-- function getBCIndex(indx)
--     math.randomseed(os.time())
--     T = {}
--     if indx == 1 then
--         T = getZYIndex()
--     elseif indx == 2 then
--         T = {1,2,3,4,5,6}
--     elseif indx == 3 then
--         T = {4,4,4}
--         repeat
--             local r = math.random(1, 6)
--             local r2 = math.random(1, 6)
--             local r3 = math.random(1, 6)
--             if r ~= 4 and r2 ~= 4 and r3 ~= 4 then
--                 table.insert(T, r)
--                 table.insert(T, r2)
--                 table.insert(T, r3)
--             end
--         until (r ~= 4 and r2 ~= 4 and r3 ~= 4)
--     elseif indx == 4 then
--         repeat
--             local r = math.random(1, 6)
--             if r ~= 4 then
--                 for i=1,4 do
--                     table.insert(T, r)
--                 end
--                 repeat
--                     local r1 = math.random(1, 6)
--                     local r2 = math.random(1, 6)
--                     if r ~= r1 and r2 ~= r and r2 ~= 4 then
--                         table.insert(T, r1)
--                         table.insert(T, r2)
--                     end
--                 until (r1 ~= r and r2 ~= r and r2 ~= 4)
--             end
--         until (r ~= 4)
--     elseif indx == 5 then
--         T = {4,4}
--         repeat
--             local r = math.random(1, 6)
--             local r2 = math.random(1, 6)
--             local r3 = math.random(1, 6)
--             local r4 = math.random(1, 6)
--             if r ~= 4 and r2 ~= 4 and r3 ~= 4 and r4 ~= 4 and r3 ~= r4 then
--                 table.insert(T, r)
--                 table.insert(T, r2)
--                 table.insert(T, r3)
--                 table.insert(T, r4)
--             end
--         until (r ~= 4 and r2 ~= 4 and r3 ~= 4 and r4 ~= 4 and r3 ~= r4)
--     elseif indx == 6 then
--         T = {4}
--         repeat
--             local r = math.random(1, 6)
--             local r2 = math.random(1, 6)
--             local r3 = math.random(1, 6)
--             local r4 = math.random(1, 6)
--             local r5 = math.random(1, 6)
--             if r ~= 4 and r2 ~= 4 and r3 ~= 4 and r4 ~= 4 and r5 ~= 4 and r3 ~= r4 and r4 ~= r5 then
--                 table.insert(T, r)
--                 table.insert(T, r2)
--                 table.insert(T, r3)
--                 table.insert(T, r4)
--                 table.insert(T, r5)
--             end
--         until (r ~= 4 and r2 ~= 4 and r3 ~= 4 and r4 ~= 4 and r5 ~= 4 and r3 ~= r4 and r4 ~= r5)
--     end
--     T = shuffle(T)
--     return T
-- end

-- local t = shuffle(getBCIndex(6))
-- -- local t = dice[1]
-- for i,v in ipairs(t) do
--     print(i,v)
-- end

-- function isIosNewSkin()
--     local skin = false
--     local Version = "2.4.1"
--     local IosV = {
--         "2.5.0",
--         "2.4.2",
--         "2.4.3",
--         "2.4.5",
--         "2.4.6"
--     }
--     for i,v in ipairs(IosV) do
--         if v == Version then
--             skin = true
--             break
--         end
--     end
--     return skin
-- end

-- if isIosNewSkin() then
--     print("LLLL")
-- end

-- local s = {}
-- s.a = 1

-- print(s and s.a or "aaa")

local t = {
    2
}
local pt = table.concat(t, ",")
print(pt)
