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

s = "a (enclosed (in) parentheses) line"
print(s)
print(string.gsub(s, "%b((", ""))
print(string.gsub(s, "%b()", ""))
