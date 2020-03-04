local dumper = require("dumper")
local M = {}

local scheme = {
    {0,0,0,0},
    {0,0,0,1},
    {0,0,1,1},
    {0,1,1,1},
    {1,1,1,1},
}

local GoldCard = 0x02

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
        if v[2] >= 3 then--不需要赖子的课子
            v[2] = v[2] - 3
            return true
        end
    end
    for k,v in ipairs(self.pai) do
        -- dumper.dump(v, k)
        print("k:", k)
        dumper.dump(v)
        if v[2] == 1 and lzNum >= 2 then--需要两个癞子的单张
            v[2] = v[2] - 1
            self.pai[#self.pai][2] = self.pai[#self.pai][2] - 2
            -- lzNum = self.pai[#self.pai][2]
            return true
        elseif v[2] == 2 and lzNum >= 1 then--需要一个癞子的对
            v[2] = v[2] - 2
            self.pai[#self.pai][2] = self.pai[#self.pai][2] - 1
            -- lzNum = self.pai[#self.pai][2]
            return true
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
            
            if lzNum > 0 then--需要一个癞子的顺子
                -- print(_n[2], _nn[2])
                if ((not _n) or _n[2] == 0) and _nn and _nn[2] > 0 then--中间
                    v[2] = v[2] - 1
                    self.pai[#self.pai][2] = self.pai[#self.pai][2] - 1
                    -- lzNum = self.pai[#self.pai][2]
                    _nn[2] = _nn[2] - 1
                    print(v[1], CARD_LZ, _nn[1])
                    return true
                elseif _n and _n[2] > 0 and ( (not _nn) or (_nn[2] == 0) ) then--两边
                    v[2] = v[2] - 1
                    _n[2] = _n[2] - 1
                    self.pai[#self.pai][2] = self.pai[#self.pai][2] - 1
                    -- lzNum = self.pai[#self.pai][2]
                    -- print("true")
                    print(v[1], _n[2], CARD_LZ)
                    return true
                end
            elseif _n and _nn and _n[2] > 0 and _nn[2] > 0 then--不需癞子的顺子
                v[2] = v[2] - 1
                _n[2] = _n[2] - 1
                _nn[2] = _nn[2] - 1
                return true
            end
        end
    end
    return false
end

function M.CheckScheme(s, p)
    dumper.dump(s, "CheckScheme.s")
    local f = {[0] = p.RemoveKe, [1] = p.RemoveOrder}

    local lzNum = 0
    if p.pai[#p.pai][1] == CARD_LZ then
        lzNum = p.pai[#p.pai][2]
    end
    print("CheckScheme.lzNum:", lzNum)
    for k,v in ipairs(p.pai) do
        --先抽将牌
        --赖子做将
        if v[2] == 1 and lzNum > 0 then
            local pp = p:Copy()
            local t = pp.index[v[1]]
            t[2] = t[2] - 1
            --赖子数减一
            pp.pai[#pp.pai][2] = pp.pai[#pp.pai][2] - 1
            -- dumper.dump(pp, "pp")
            local ok = true
            for i=1,4 do
                if not f[s[i]](pp) then
                    ok = false
                    break
                end
            end
            if ok then
                return true
            end
        elseif v[2] >= 2 then
            local pp = p:Copy()
            local t = pp.index[v[1]]
            t[2] = t[2] - 2
            local ok = true
            for i=1,4 do
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
    local p = newPai(pai)
    dumper.dump(p)
    for k,v in ipairs(scheme) do
        if M.CheckScheme(v, p) then
            return true
        end
    end
    return false
end

print(M.CheckHu({2,5,
11,12,13,
14,14,14,
15,15,15,
11,2,13}))
-- print(M.CheckHu({1,2,3,4,5,6,1,2,3,4,5,6,7,7}))
-- print(M.CheckHu({1,1,1,1,2,2,2,2,3,3,3,3,4,4}))
-- print(M.CheckHu({1,1,1,2,3,4,5,6,4,5,6,7,8,9}))
-- print(M.CheckHu({1,1,1,2,3,2,3,4,3,4,5,7,8,9}))
-- print(M.CheckHu({1,1,1,4,5,6,2,3,4,4,5,6,9,9}))