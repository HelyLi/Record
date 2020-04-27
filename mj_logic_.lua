local dumper = require("dumper")
local M = {}

local scheme1 = {
    {0},
    {1},
}

local scheme2 = {
    {0,0,},
    {0,1},
    {1,1},
}

local scheme3 = {
    {0,0,0,},
    {0,0,1},
    {0,1,1},
    {1,1,1},
}

local scheme4 = {
    {0,0,0,0},
    {0,0,0,1},
    {0,0,1,1},
    {0,1,1,1},
    {1,1,1,1},
}

local scheme5 = {
    {0,0,0,0,0},
    {0,0,0,0,1},
    {0,0,0,1,1},
    {0,0,1,1,1},
    {0,1,1,1,1},
    {1,1,1,1,1},
}

local schemes = {
    [5] = scheme1,
    [8] = scheme2,
    [11] = scheme3,
    [14] = scheme4,
    [17] = scheme5
}

local GoldCard = 0x04

-- 0x31,0x32,0x33,0x34,0x35,0x36,0x37  --东南西北中发白

local JG = {
    [0x31] = 0x31,
    [0x32] = 0x41,
    [0x33] = 0x51,
    [0x34] = 0x61,
    [0x35] = 0x61,
    [0x36] = 0x71,
    [0x37] = 0x81
}

local CARD_LZ = 0x100

local pai = {}
pai.__index = pai

local function newPai(t)
    local p = {}
    p = setmetatable(p, pai)
    p.pai = {}
    p.index = {}
    local tt, c
    table.sort(t, function(l, r)
        return l < r
    end)
    for k,v in ipairs(t) do
        if v == GoldCard then
            v = CARD_LZ
        elseif JG[v] then
            v = JG[v]
        end
        if tt ~= v then
            if tt then
                table.insert(p.pai, {tt, c})
                p.index[tt] = p.pai[#p.pai]
            end
            tt = v
            c = 1
        else
            c = c + 1
        end
    end
    table.insert(p.pai, {tt, c})
    table.sort(p.pai, function(v1, v2)
        return v1[1] < v2[1]
    end)
    return p
end

function pai:Copy()
    local p = {}
    p = setmetatable(p, pai)
    p.pai = {}
    p.index = {}
    for k,v in pairs(self.pai) do
        if v[2] > 0 then
            table.insert(p.pai, {v[1], v[2]})
            p.index[v[1]] = p.pai[#p.pai]
        end
    end
    return p
end

--移除一组刻子
function pai:RemoveKe()
    dumper.dump(self.pai, "pai:RemoveKe")
    local lzNum = 0
    if self.pai[#self.pai][1] == CARD_LZ then
        lzNum = self.pai[#self.pai][2]
    end
    print("RemoveKe.lzNum:", lzNum)
    
    for k,v in ipairs(self.pai) do
        -- dumper.dump(v, k)
        print("k:", k)
        dumper.dump(v)
        if v[1] ~= CARD_LZ and v[2] >= 3 then--不需要赖子的课子
            v[2] = v[2] - 3
            return true
        end
    end
    if lzNum > 0 then
        for k,v in ipairs(self.pai) do
            -- dumper.dump(v, k)
            print("k:", k)
            dumper.dump(v)
            if v[2] == 1 and lzNum >= 2 then--需要两个癞子的单张
                v[2] = v[2] - 1
                self.pai[#self.pai][2] = self.pai[#self.pai][2] - 2
                -- lzNum = self.pai[#self.pai][2]
                return true
            end
            if v[2] == 2 and lzNum >= 1 then--需要一个癞子的对
                v[2] = v[2] - 2
                self.pai[#self.pai][2] = self.pai[#self.pai][2] - 1
                -- lzNum = self.pai[#self.pai][2]
                return true
            end
        end
    end
    
    return false
end

--移除一组顺子
function pai:RemoveOrder()
    dumper.dump(self.pai, "pai:RemoveOrder")

    local lzNum = 0
    if self.pai[#self.pai][1] == CARD_LZ then
        lzNum = self.pai[#self.pai][2]
    end
    print("RemoveOrder.lzNum:", lzNum)

    for k,v in ipairs(self.pai) do
        if v[2] > 0 then
            local n = v[1] + 1
            local nn = n + 1
            local _n = self.index[n]
            local _nn = self.index[nn]
            print(v[1], n, nn, v[2], _n and _n[2], _nn and _nn[2])

            if _n and _nn and _n[2] > 0 and _nn[2] > 0 then--不需癞子的顺子
                v[2] = v[2] - 1
                _n[2] = _n[2] - 1
                _nn[2] = _nn[2] - 1
                return true
            elseif lzNum > 0 then--需要一个癞子的顺子
                -- print(_n[2], _nn[2])
                if _nn and _nn[2] > 0 then--中间
                    v[2] = v[2] - 1
                    self.pai[#self.pai][2] = self.pai[#self.pai][2] - 1
                    -- lzNum = self.pai[#self.pai][2]
                    _nn[2] = _nn[2] - 1
                    print(v[1], CARD_LZ, _nn[1])
                    return true
                elseif _n and _n[2] > 0 then--两边
                    v[2] = v[2] - 1
                    _n[2] = _n[2] - 1
                    self.pai[#self.pai][2] = self.pai[#self.pai][2] - 1
                    -- lzNum = self.pai[#self.pai][2]
                    -- print("true")
                    print(v[1], _n[2], CARD_LZ)
                    return true
                end
            end
        end
    end
    return false
end

function M.CheckScheme(s, p)
    dumper.dump(s, "CheckScheme.s")
    local f = {[0] = p.RemoveOrder, [1] = p.RemoveKe}
    -- local f = {[0] = p.RemoveKe, [1] = p.RemoveOrder}
    local lzNum = 0
    if p.pai[#p.pai][1] == CARD_LZ then
        lzNum = p.pai[#p.pai][2]
    end
    print("CheckScheme.lzNum:", lzNum)
    for k,v in ipairs(p.pai) do
        --先抽将牌
        --赖子做将
        if v[2] >= 2 then
            local pp = p:Copy()
            local t = pp.index[v[1]]
            t[2] = t[2] - 2
            local ok = true
            for i=1,#s do
                print(i, s[i])
                if not f[s[i]](pp) then
                    ok = false
                    break
                end
            end
            if ok then
                return true
            end
        elseif v[2] == 1 and lzNum > 0 then
            local pp = p:Copy()
            local t = pp.index[v[1]]
            t[2] = t[2] - 1
            --赖子数减一
            pp.pai[#pp.pai][2] = pp.pai[#pp.pai][2] - 1
            -- dumper.dump(pp, "pp")
            local ok = true
            for i=1,#s do
                if not f[s[i]](pp) then
                    ok = false
                    break
                end
            end
            if ok then
                return true
            end
        end
    end
    return false
end

function M.CheckHu(pai)
    local scheme = schemes[#pai]
    local p = newPai(pai)
    dumper.dump(p)

    for k,v in ipairs(scheme) do
        if M.CheckScheme(v, p) then
            return true
        end
    end
    return false
end

-- 11,11
-- 12,13,14
-- 13,14,15,
-- 15,2,17
-- 2,2,2

-- print(M.CheckHu({2,2,
-- 11,12,13,
-- 14,2,14,
-- 15,17,15,
-- 11,2,13}))
-- - "TTHandCardData" = {
--     [LUA-print] -     1 = 4
--     [LUA-print] -     2 = 4
--     [LUA-print] -     3 = 4
--     [LUA-print] -     4 = 25
--     [LUA-print] -     5 = 25
--     [LUA-print] -     6 = 35
--     [LUA-print] -     7 = 36
--     [LUA-print] -     8 = 34
--     [LUA-print] - }

print(M.CheckHu({0x04,0x04,0x04,0x04,0x02,0x02,0x13,0x16,0x17,0x35,0x35}))
-- print(M.CheckHu({1,2,3,4,5,6,1,2,3,4,5,6,7,7}))
-- print(M.CheckHu({1,1,1,1,2,2,2,2,3,3,3,3,4,4}))
-- print(M.CheckHu({1,1,1,2,3,4,5,6,4,5,6,7,8,9}))
-- print(M.CheckHu({1,1,1,2,3,2,3,4,3,4,5,7,8,9}))
-- print(M.CheckHu({1,1,1,4,5,6,2,3,4,4,5,6,9,9}))