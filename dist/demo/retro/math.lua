-- created by @sanyabeast 11 dec 2021 / 0:19 pm
-- MATH
math.vector = {
    add = function(a, b)
        return {a[1] + b[1], a[2] + b[2], a[3] + b[3]}
    end,
    copy = function(a, b)
        a[1] = b[1] or a[1]
        a[2] = b[2] or a[2]
        a[3] = b[3] or a[3]
        a[4] = b[4] or a[4]
    end,
    clone = function(a)
        return {a[1], a[2], a[3], a[4]}
    end
}
-- Matrix3
math.mat3 = {
    set = function(m, a0, a1, a2, b0, b1, b2, c0, c1, c2)
        m[1] = a0 or m[1]
        m[2] = a1 or m[2]
        m[3] = a2 or m[3]

        m[4] = b0 or m[4]
        m[5] = b1 or m[5]
        m[6] = b2 or m[6]

        m[7] = c0 or m[7]
        m[8] = c1 or m[8]
        m[9] = c2 or m[9]
        return m
    end,
    create = function()
        return math.mat3.identity({})
    end,
    identity = function(m)
        return math.mat3.set(
            m, --
            1,
            0,
            0, --
            0,
            1,
            0, --
            0,
            0,
            1 --
        )
    end,
    destruct = function(m)
        return m[1], m[2], m[3], m[4], m[5], m[6], m[7], m[8], m[9]
    end,
    copy = function(ma, mb)
        return math.mat3.set(ma, math.mat3.destruct(mb))
    end
}
-- Matrix4
math.mat4 = {
    set = function(m, a0, a1, a2, a3, b0, b1, b2, b3, c0, c1, c2, c3, d0, d1, d2, d3)
        m[1] = a0 or m[1]
        m[2] = a1 or m[2]
        m[3] = a2 or m[3]
        m[4] = a3 or m[4]

        m[5] = b0 or m[5]
        m[6] = b1 or m[6]
        m[7] = b2 or m[7]
        m[8] = b3 or m[8]

        m[9] = c0 or m[9]
        m[10] = c1 or m[10]
        m[11] = c2 or m[11]
        m[12] = c3 or m[12]

        m[13] = d0 or m[13]
        m[14] = d1 or m[14]
        m[15] = d2 or m[15]
        m[16] = d3 or m[16]
        return m
    end,
    create = function()
        return math.mat4.identity({})
    end,
    identity = function(m)
        return math.mat4.set(
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
    end,
    destruct = function(m)
        return m[1], m[2], m[3], m[4], m[5], m[6], m[7], m[8], m[9], m[10], m[11], m[12], m[13], m[14], m[15], m[16]
    end,
    copy = function(ma, mb)
        return math.mat4.set(ma, math.mat4.destruct(mb))
    end,
    copy_position = function(ma, mb)
        ma[12] = mb[12]
        ma[13] = mb[13]
        ma[14] = mb[14]
        return ma
    end,
    set_from_mat3 = function(m4, m3)
        math.mat4.set(
            m4, --
            m3[1],
            m3[2],
            m3[3],
            0, --
            m3[4],
            m3[5],
            m3[6],
            0, --
            m3[7],
            m3[8],
            m3[9],
            0, --
            0,
            0,
            0,
            0
        )
        return m4
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
