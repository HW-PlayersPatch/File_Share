-- =============================================================================
--     Name    : utilityFunctions.lua
--     Purpose : debug console function definitions.
--
--     Created 9/6/2000 by lmoloney
--     Copyright Relic Entertainment, Inc.  All rights reserved.
-- =============================================================================

-- first some helper functions (to add a "tostring" tag method)

-- a new settagmethod with hook for new methods
settagmethod_hook = {}
function settagmethod(tag, method, tm)
    local fn = settagmethod_hook[method] or %settagmethod
    return fn(tag, method, tm)
end

-- a new tostring with hook for new types
tostring_hook = {}
function tostring(o)
    local fn = tostring_hook[tag(o)] or %tostring
    return fn(o)
end

-- new "tostring" method
function settagmethod_hook.tostring(tag, method, fn)
    tostring_hook[tag] = fn         -- modify tostring()
    settagmethod(tag, "concat", function(a,b)   -- and '..' operator
    return tostring(a)..tostring(b)
    end)
end

-- read a file using the data path as the root of the search path
function import(file)
    local temp = HW2_FullPath
    dofile(temp..file)
end

-- read a file using a specified path
function p_import(file)
    local temp = PImportPath or HW2_FullPath
    dofile(temp..file)
end

-- set the path for p_import
function p_setpath(path)
    PImportPath = path
end


-- these are 2 short cut utility functions for macro support
function mc_init()
--  set the base path for macros
    PImportPath = HW2_FullPath.."Scripts/Macros/"
--  set the etg spawn point to be at the engine nozzle point of a ship(easier to see)
    etgJoint("EngineNozzle1")

    print ("MACRO data path = "..PImportPath)
    print ("\nETG Spawn Pos = EngineNozzle1")
end

-- run a macro lua script
function mc(file)
    local temp = PImportPath or HW2_FullPath
    dofile(temp..file..".mc")
end

----------------------------------------------------------------------------
--  Name:        printShipsFile
--  Description: Outputs a file that contains all ships in a level, their locations
--               and their orientation
--  Inputs:      name - the name of the file to output to
--  Output:      Creates a new file
--  Returns:
----------------------------------------------------------------------------
numPrints = 0
function printShipsFile(name)
    local index      = 0
    local numPlayers = universe.getNumPlayers()

    local outstring = HW2_FullPath..name..numPrints..".lua"

    -- feedback to console
    print("Writing ships file: "..outstring)

    writeto(outstring)

    write("\n")

    while index < numPlayers do
        print("Writing Player "..index.." info\n")
        write("\-\- Player "..index.." Ships\n")

        local player      = universe.getPlayer(index)
        local playerShips = player.getShips()
        local numShips    = playerShips.count()

        for i=1,numShips do
            local ship = playerShips[i]
            local shiploc = ship.position
            local shipor  = ship.orientation

            write("addShip(\""..ship.getName().."\""..
                  ", {"..shiploc[1]..
                  ", "..shiploc[2]..
                  ", "..shiploc[3]..
                  "}, "..index..
                  ", {"..(-shipor[1])..
                  ", "..(-shipor[2])..
                  ", "..(-shipor[3]).."})\n")

        end
        index = index + 1
        write("\n")
    end
    writeto()
    print("Success!")
    numPrints = numPrints + 1
end


