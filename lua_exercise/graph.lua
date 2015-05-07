local function name2node(graph, name)
    local node = graph[name]
    if not node then
        -- node does not exist; create a new one
        node = {name = name, adj = {} }
        graph[name] = node
    end
    return node
end

local function readgraph()
    local graph = {}
    for line in io.lines() do
        -- split line in two names
        local name_from, name_to = string.match(line, "(%S+)%s+(%S+)")
        -- find corresponding nodes
        local from = name2node(graph, name_from)
        local to = name2node(graph, name_to)
        -- adds 'to' to the adjacent set of 'from'
        from.adj[to] = true
    end
    return graph
end

-- deep first search
local function findpath(curr, to, path, visited)
    path = path or {}
    visited = visited or {}
    if visited[curr] then  -- node already visited
        return nil         -- no path here
    end
    visited[curr] = true   -- make node as visited
    path[#path + 1] = curr -- add it to path
    if curr == to then     -- final node?
        return path
    end
    -- try all adjacent nodes
    for node in pairs(curr.adj) do
        local p = findpath(node, to, path, visited)
        if p then
            return p
        end
    end
    path[#path] = nil       -- remove node from path
end

local function printpath(path)
    if not path then
        print("path is empty")
        return
    end

    for i = 1, #path do
        print(path[i].name)
    end
end

g = readgraph()
a = name2node(g, "a")
b = name2node(g, "b")
p = findpath(a, b)
printpath(p)
