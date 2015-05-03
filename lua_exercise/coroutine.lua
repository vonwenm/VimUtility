print("-------------- Test 1 --------------")
local co = coroutine.create(function() print("Hello world") end)

print(type(co))
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))

local co = coroutine.create(function()
    for i = 1, 10 do
        print("co", i)
        coroutine.yield(co)
    end
end)

coroutine.resume(co)
print(coroutine.status(co))
coroutine.resume(co)
print(coroutine.status(co))
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print(coroutine.resume(co))

print("-------------- Test 2 --------------")
local co = coroutine.create(function(a, b, c) 
    print("co", a, b, c + 2)
end)
local ok, msg = coroutine.resume(co, 1, 2, 3)
print(ok, msg)

print("-------------- Test 3 --------------")
local co = coroutine.create(function(a, b)
    coroutine.yield(a + b, a - b)
end)
print(coroutine.resume(co, 20, 10))

print("-------------- Test 4 --------------")
local co = coroutine.create(function(x)
    print("co1", x)
    print("co2", coroutine.yield())
end)
coroutine.resume(co, "hi")
coroutine.resume(co, 4, 5)

print("-------------- Test 5 --------------")
co = coroutine.create(function()
    return 6, 7
end)
print(coroutine.resume(co))

print("-------------- Test 6 --------------")
-- function receive()
--     local status, value = coroutine.resume(producer)
--     return value
-- end

-- function send(x)
--     coroutine.yield(x)
-- end

-- producer = coroutine.create(function()
--     while true do
--         local x = io.read()
--         send(x)
--     end
-- end)

-- print(receive())
-- print(receive())
-- print(receive())

print("-------------- Test 7 --------------")
-- function receive()
--     return coroutine.yield()
-- end

-- function send(x)
--     local status, value = coroutine.resume(consumer, x)
--     return value
-- end

-- consumer = coroutine.create(function()
--     while true do
--         print(receive())
--     end
-- end)

-- send(nil)
-- send("Hello world")
-- send("Superman")

print("-------------- Test 8 --------------")
-- function receive(prod)
--     local status, value = coroutine.resume(prod)
--     return value
-- end

-- function send(x)
--     coroutine.yield(x)
-- end

-- function producer()
--     return coroutine.create(function()
--         while true do
--             local x = io.read() -- produce new value
--             send(x)
--         end
--     end)
-- end

-- function filter(prod)
--     return coroutine.create(function()
--         for line = 1, math.huge do
--             local x = receive(prod) -- get new value
--             x = string.format("%5d %s", line, x)
--             send(x)
--         end
--     end)
-- end

-- function consumer(prod)
--     while true do
--         local x = receive(prod) -- get new value
--         io.write(x, "\n") -- consume new value
--     end
-- end

-- p = producer()
-- f = filter(p)
-- consumer(f)

print("-------------- Test 8 --------------")
