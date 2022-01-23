-- created by @sanyabeast 11 dec 2021 / 0:19 pm
-- MATH
math.vector = {
    add = function(a, b)
        return {a[1] + b[1], a[2] + b[2]}
    end,
    copy = function(a, b)
        a[1] = b[1]
        a[2] = b[2]
    end,
    clone = function(a)
        return {a[1], a[2]}
    end
}

math.round_to = function(num, dp)
    local mult = 10 ^ (dp or 0)
    return math.floor(num * mult + 0.5) / mult
end
math.lerpf = function(a, b, t)
    return a * (1 - t) + b * t
end
-- RANDOM
random = {choice = function(t)
        return t[math.random(1, table.getn(t))]
    end}
