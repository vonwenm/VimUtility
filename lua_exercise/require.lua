print(package.path)
print(package.cpath)
assert(require "split")


local res = split("HelloOrWorldOrWinOrFail", "Or")
for _, v in ipairs(res) do
    print(v)
end

path = package.path
print(package.searchpath("X", path))
