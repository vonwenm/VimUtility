local function new(r, i)
    return {r = r, i = i}
end

-- defines constant 'i'
local i = new(0, 1)

local function add(c1, c2)
    return new(c1.r + c2.r, c1.i + c2.i)
end

local function sub(c1, c2)
    return new(c1.r - c2.r, c1.i - c2.i)
end

local function mul(c1, c2)
    return new(c1.r * c2.r - c1.i * c2.i, c1.r * c2.i + c1.i * c2.r)
end

local function inv(c)
    local n = c.r ^ 2 + c.i ^ 2
    return new(c.r / n, -c.i / n)
end

local function div(c1, c2)
    return mul(c1, inv(c2))
end

local function tostring(c)
    return "(" .. c.r .. "," .. c.i .. ")"
end

return {
    new      = new,
    i        = i,
    add      = add,
    sub      = sub,
    mul      = mul,
    div      = div,
    tostring = tostring,
}
