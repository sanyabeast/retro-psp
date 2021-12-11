-- created by @sanyabeast 11 dec 2021 / 0:19 pm
-- MATH
math.vector = {
    add = function(a, b)
        return {a[1] + b[1], a[2] + b[2], a[3] + b[3]}
    end,
    set = function(a, b)
        a[1] = b[1] or a[1]
        a[2] = b[2] or a[2]
        a[3] = b[3] or a[3]
        a[4] = b[4] or a[4]
    end,
    clone = function(a)
        return {a[1], a[2], a[3], a[4]}
    end
}
math.matrix4 = {
    set = function(a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3, d0, d1, d2, d3)
        m[1] = a0
        m[2] = a1
        m[3] = a2
        m[4] = a3

        m[5] = b0
        m[6] = b1
        m[7] = b2
        m[8] = b3

        m[9] = c0
        m[10] = c1
        m[11] = c2
        m[12] = c3

        m[13] = d0
        m[14] = d1
        m[15] = d2
        m[16] = d3
        return m
    end,
    identity = function(m)
        return math.matrix4.set(
            m, --
            1,
            0,
            0,
            0, --
            0,
            1,
            0,
            0, --
            0,
            0,
            1,
            0, --
            0,
            0,
            0,
            1 --
        )
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
