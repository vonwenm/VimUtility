function quote(s)
    -- find maximum length of sequence of equal signs
    local n = -1
    for w in string.gmatch(s, "]=*]") do
        n = math.max(n, #w - 2) -- -2 to remove the ']'s
    end

    -- produce a string with 'n' plus one equal signs
    local eq = string.rep("=", n + 1)

    -- build quoted string
    return string.format("[%s[%s]%s]", eq, s, eq)
end

function serialize(o)
    if type(o) == "number" then
        io.write(o)
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    elseif type(o) == "table" then
        io.write("{\n")
        for k, v in pairs(o) do
            io.write("[")
            serialize(k)
            io.write("] = ")
            serialize(v)
            io.write(",\n")
        end
        io.write("}\n")
    else
        error("cannot serialize a " .. type(o))
    end
end

-- print(quote("[===[hello world [[Nest]] ]===]"))

-- serialize({a = 12, b = 'lua', key = 'another "one"'})
-- serialize({[1] = 12, [2] = 'lua', [3] = 'another "one"'})
-- serialize({["1a"] = 12, ["1b"] = 'lua', ["1c"] = 'another "one"'})
-- serialize({["1a"] = {"Nest String", {"Nest String 2"}}, ["1b"] = 'lua', ["1c"] = 'another "one"'})

function basic_serialize(o)
    if type(o) == "number" then
        return tostring(o)
    elseif type(o) == "string" then
        return string.format("%q", o)
    else
        error("basic serialize failed")
    end
end

function save(name, value, saved)
    saved = saved or {}                                        -- initial value
    io.write(name, " = ")
    if type(value) == "number" or type(value) == "string" then
        io.write(basic_serialize(value), "\n")
    elseif type(value) == "table" then
        if saved[value] then                                   -- value already saved?
            io.write(saved[value], "\n")                       -- use its previous name
        else
            saved[value] = name                                -- save name for next time
            io.write("{}\n")                                   -- create a new table
            for k, v in pairs(value) do                        -- save its fields
                k = basic_serialize(k)
                local fname = string.format("%s[%s]", name, k)
                save(fname, v, saved)
            end
        end
    else
        error("cannot save a " .. type(value))
    end
end

local t = {}
a = {{"one", "two"}, 3}
b = {k = a[1]}
save("a", a, t)
save("b", b, t)
