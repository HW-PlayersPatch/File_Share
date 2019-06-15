--===========================================================================
--  Name    : matvec.lua
--  Purpose : lua functions for the matvec module in HW2
--
--  Created 9/6/2000 by fpoiker
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

function distsqvec3(vec1, vec2)
    return ((vec1.x-vec2.x)*(vec1.x-vec2.x) + (vec1.y-vec2.y)*(vec1.y-vec2.y) + (vec1.z-vec2.z)*(vec1.z-vec2.z))
end

function distlessthan(vec1, vec2, dist)
    return (distsqvec3(vec1, vec2) < (dist*dist))
end

--tag_vec2   = tag(Vector2())
--tag_vec3   = tag(Vector3())
--tag_colour = tag(Colour())

--settagmethod(tag_vec2, "tostring",
--             function(o)
--                return format("Vector 2 {%g, %g)"), o.x, o.y
--             end)

--settagmethod(tag_vec3, "tostring",
--             function(o)
--                return format("Vector 3 {%g, %g, %g)"), o.x, o.y, o.z
--             end)

--settagmethod(tag_colour, "tostring",
--             function(o)
--                return format("Colour {%g, %g, %g, %g)"), o.r, o.g, o.b, o.a
--             end)


