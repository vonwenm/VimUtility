prototype = {x = 0, y = 0, width = 100, height = 100}
mt = {}

function new(o)
    setmetatable(o, mt)
    return o
end

-- mt.__index = function(_, key)
--     return prototype[key]
-- end

mt.__index = prototype

w = new({x = 10, y = 20})

print("------------- Get with metatable")
print(w.x)
print(w.y)
print(w.width)
print(w.height)
print(w.z)

print("------------- Raw get without metatable")
print(rawget(w, "x"))
print(rawget(w, "y"))
print(rawget(w, "width"))
print(rawget(w, "height"))
print(rawget(w, "z"))
