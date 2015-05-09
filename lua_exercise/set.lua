Set = {}
mt  = {}

function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    if getmetatable(a) ~= mt or
        getmetatable(b) ~= mt then
        error("attempt to 'add' a set with a non-set value", 2)
    end
    local res = Set.new({})
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.intersection(a, b)
    local res = Set.new({})
    for k in pairs(a) do
        if b[k] then
            res[k] = true
        end
    end
    return res
end

function Set.contain(a, b)
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

function Set.realcontain(a, b)
    return a <= b and not (b <= a)
end

function Set.equal(a, b)
    return a <= b and b <= a
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

function Set.print(s)
    print(Set.tostring(s))
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__le = Set.contain
mt.__lt = Set.realcontain
mt.__eq = Set.equal

local s1 = Set.new({1, 2, 3})
local s2 = Set.new({1, 2, 3, 4})
local u1 = s1 + s2
local i1 = s1 * s2
Set.print(s1)
Set.print(s2)
Set.print(u1)
Set.print(i1)

print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
print(s1 == s2 * s1)
