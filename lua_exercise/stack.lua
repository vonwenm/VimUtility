Stack = {}

function Stack:new()
    local s = {
        data = {},
        top_index = 0,
    }
    setmetatable(s, self)
    self.__index = self
    return s
end

function Stack:push(v)
    self.top_index = self.top_index + 1
    self.data[self.top_index] = v
end

function Stack:pop()
    if self:isempty() then
        error("Err! Stack is Empty")
    end

    self.data[self.top_index] = nil
    self.top_index = self.top_index - 1
end

function Stack:top()
    return self.data[self.top_index]
end

function Stack:isempty()
    if self.top_index == 0 then
        return true
    else
        return false
    end
end

local s = Stack:new()
s:push("Hello")
s:push("World")
s:pop()
s:pop()
s:pop()
