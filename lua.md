链表：
---
根节点：
```lua
list = nil
```
在链表开头插入一个值为v的节点：
```lua
list = {next = list, value = v}
```
要遍历这个链表只需要：
```lua
local l = list
while l do
    print(l.value)
    l = l.next
end
```

集合
---
Lua中表示集合有一个简单有效的方法，将所有集合中的元素作为下标存放在一个table里，下面不需要查找table，只需要测试看对于给定的元素，表的对应下标的元素值是否为nil。
```lua
reserved = {
    ["while"] = true,    ["end"] = true,
    ["function"] = true, ["local"] = true,
}

for w in allwords() do
    if reserved[w] then
    --'w' is a reserved word.
    end
end
```
还可以使用辅助函数更加清晰的构造集合:
```lua
function Set (list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end
 
reserved = Set{"while", "end", "function", "local"}
```

字符串缓存与垃圾回收
---
```lua
local buff = ""
for line in io.lines() do
    buff = buff .. line .. "\n"
end
```

新算法：使用栈
```lua
function newStack()
    return {""}
end

function addString(stack, s)
    table.insert(stack, s)
    for i = #stack - 1, 1, -1 do
        if string.len(stack[i]) > string.len(stack[i+1]) then
            break
        end
        stack[i] = stack[i] .. table.remove(stack)
    end
end

local s = newStack()
for line in io.read() do
    addString(s, line .. "\n")
end

local txt = table.concat(s)

```
算法的核心是：用一个栈，在栈的底部用来保存已经生成的大的字符串，而小的串从栈定入栈。栈的状态变化和经典的汉诺塔问题类似：位于栈下面的串肯定比上面的长，只要一个较长的串入栈后比它下面的串长，就将两个串合并成一个新的更大的串，新生成的串继续与相邻的串比较如果长于底部的将继续进行合并，循环进行到没有串可以合并或者到达栈底。

```lua
local t = {}
for line in io.lines() do
    table.insert(t, line)
end
--frist
local txt = table.concat(t, "\n") .. "\n"
--最后一个连接操作复制了整个字符串，这个时候整个字符串可能是很大的
--second
table.insert(t, "")
s = table.concat(t, "\n") 
```

