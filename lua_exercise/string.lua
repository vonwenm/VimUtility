-- s = "[in brackets]"
-- s = s:sub(2, -2)
-- print(s)

-- print(string.char(97))
-- print(string.char(98))
-- i = 99
-- print(string.char(i, i + 1, i + 2))
-- print(string.byte("abc"))
-- print(string.byte("abc", 2))
-- print(string.byte("abc", -1))
-- print(string.byte("我"))
-- print(string.byte("们"))
-- t = {string.byte(s, 1, -1)}
-- print(table.unpack(t))

-- local s = "hello world"
-- local i, j = string.find(s, "hello")
-- print(i, j)
-- print(string.sub(s, i, j))
-- print(string.find(s, "world"))
-- i, j = string.find(s, "l")
-- print(i, j)
-- print(string.find(s, "lll"))

-- local s = "yes\nok\nhello\nworld"
-- local t = {}
-- local i = 0
-- while true do
--     i = string.find(s, "\n", i + 1)
--     if i == nil then
--         break
--     end
--     t[#t + 1] = i
-- end
-- for i = 1, #t do
--     print(t[i])
-- end

-- print(string.match("hello world hello", "hello"))

-- local date = "Today is 17/7/1990"
-- local i, j = string.find(date, "%d+/%d+/%d+")
-- print(string.sub(date, i, j))

-- local date = "Today is 17/7/1990"
-- local d = string.match(date, "%d+/%d+/%d+")
-- print(d)

-- local s, n = string.gsub("Lua is cute", "cute", "great")
-- print(s, n)
-- s, n = string.gsub("all lii", "l", "x")
-- print(s, n)
-- s, n = string.gsub("Lua is great", "Sol", "Sun")
-- print(s, n)
-- s, n = string.gsub("all lii", "l", "x", 1)
-- print(s, n)
-- s, n = string.gsub("all lii", "l", "x", 2)
-- print(s, n)

-- print(select(2, string.gsub("hello world man", " ", " ")))
-- print(string.gsub("hello world man", " ", " "))

-- local s = "hello world my name is fengqiujun"
-- words = {}
-- for w in string.gmatch(s, "%a+") do
--     words[#words + 1] = w
-- end
-- for i = 1, #words do
--     print(words[i])
-- end

-- function search(modname, path)
--     local modname = string.gsub(modname, "%.", "/")
--     for c in string.gmatch(path, "[^;]+") do
--         local fname = string.gsub(c, "?", modname)
--         local f = io.open(fname)
--         if f then
--             f:close()
--             return fname
--         end
--     end
--     return nil
-- end

-- s = "Deadline in 30/05/1999, firm"
-- date = "%d%d/%d%d/%d%d%d%d"
-- print(string.sub(s, string.find(s, date)))

-- print(string.gsub("Hello, up-down!", "%A", "."))

-- local text = "Iloveyou"
-- nvow = select(2, string.gsub(text, "[AEIOUaeiou]", ""))
-- print(nvow)

-- test = "int x; /* x */ int y; /* y */"
-- print(string.match(test, "/%*.*%*/"))
-- print(string.gsub(test, "/%*.-%*/", ""))

-- function is_number_str(s)
--     if string.find(s, "^[+-]?%d+$") then
--         return true
--     else
--         return false
--     end
-- end

-- assert(is_number_str("+123"))
-- assert(is_number_str("-123"))
-- assert(is_number_str("123"))
-- assert(not is_number_str("a123"))
-- assert(not is_number_str("_123"))
-- assert(not is_number_str("123a"))

-- s = "a (enclosed (in) parentheses) line"
-- print(s)
-- print(string.gsub(s, "%b((", ""))
-- print(string.gsub(s, "%b()", ""))

-- pair = "name = Anna"
-- key, value = string.match(pair, "(%a+)%s*=%s*(%a+)")
-- print(key, value)

-- date = "Today is 17/7/1990"
-- d, m, y = string.match(date, "(%d+)/(%d+)/(%d+)")
-- print(d, m, y)

-- quote_str = [[then he said: "it's all right"!]]
-- pattern = "([\"'])(.-)(%1)"
-- q1, quoted_part, q2 = string.match(quote_str, pattern)
-- print(quoted_part)
-- print(q1)
-- print(q2)

-- pattern = "%[(=*)%[(.-)%]%1%]"
-- s = "a = [===[[[ something ]] ]==] ]===]; print(a)"
-- print(string.match(s, pattern))

-- print(string.gsub("hello lua!", "%a", "%0-%0-"))
-- print(string.gsub("hello Lua", "(.)(.)(.)(.)", "%4%3%2%1"))

-- s = [[the \quote{task} is to \em{change} that.]]
-- s = string.gsub(s, "\\(%a+){(.-)}", "<%1>%2</%1>")
-- print(s)

-- function trim(s)
--     return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
-- end
-- print("{" .. trim("   hello world      ") .. "}")

-- function expand(s)
--     return (string.gsub(s, "$(%w+)", _G))
-- end

-- function expand2(s)
--     return (string.gsub(s, "$(%w+)", function(n)
--         return tostring(_G[n])
--     end))
-- end

-- name = "Lua"
-- status = "great"

-- print(expand("$name is $status"))
-- print(expand("$othername is $status"))
-- print(expand2("$name is $status"))
-- print(expand2("$othername is $status"))
-- print(expand2("print = $print; a = $a"))

-- function toxml(s)
--     s = string.gsub(s, "\\(%a+)(%b{})", function(tag, body)
--         body = string.sub(body, 2, -2)
--         body = toxml(body)
--         return string.format("<%s>%s</%s>", tag, body, tag)
--     end)
--     return s
-- end

-- print(toxml("\\title{The \\bold{big} example}"))

function unescape(s)
    s = string.gsub(s, "+", " ")
    s = string.gsub(s, "%%(%x%x)", function(h)
        return string.char((tonumber(h, 16)))
    end)
    return s
end

cgi = {}
function decode(s)
    for name, value in string.gmatch(s, "([^&=]+)=([^&=]+)") do
        name = unescape(name)
        value = unescape(value)
        cgi[name] = value
    end
end

function escape(s)
    s = string.gsub(s, "[&=+%%%c]", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
    s = string.gsub(s, " ", "+")
    return s
end

function encode(t)
    local b = {}
    for k, v in pairs(t) do
        b[#b + 1] = (escape(k) .. "=" .. escape(v))
    end
    return table.concat(b, "&")
end


ori_str = "a + b = c"
encode_str = escape(ori_str)
decode_str = unescape(encode_str)
print(ori_str)
print(encode_str)
print(decode_str)

t = {
    name = "a1",
    query = "a+b = c",
    q = "yes or no",
}
print(encode(t))
