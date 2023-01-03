-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

settagmethod_hook = {}
function settagmethod(tag, method, tm)
	local fn = settagmethod_hook[method] or %settagmethod
	return fn(tag, method, tm)
end

tostring_hook = {}
function tostring(o)
	local fn = tostring_hook[tag(o)] or %tostring
	return fn(o)
end

function settagmethod_hook.tostring(tag, method, fn)
	tostring_hook[tag] = fn
	settagmethod(tag, "concat", function(a,b)
	return tostring(a)..tostring(b)
	end)
end

function import(file)
	local temp = HW2_FullPath
	dofile(temp..file)
end

function p_import(file)
	local temp = PImportPath or HW2_FullPath
	dofile(temp..file)
end

function p_setpath(path)
	PImportPath = path
end

function mc_init()
	PImportPath = HW2_FullPath.."Scripts/Macros/"
	etgJoint("EngineNozzle1")
	print ("MACRO data path = "..PImportPath)
	print ("\nETG Spawn Pos = EngineNozzle1")
end

function mc(file)
	local temp = PImportPath or HW2_FullPath
	dofile(temp..file..".mc")
end

numPrints = 0
function printShipsFile(name)
	local index = 0
	local numPlayers = universe.getNumPlayers()
	local outstring = HW2_FullPath..name..numPrints..".lua"
	print("Writing ships file: "..outstring)
	writeto(outstring)
	write("\n")
	while (index < numPlayers) do
	print("Writing Player "..index.." info\n")
	write("\-\- Player "..index.." Ships\n")
	local player = universe.getPlayer(index)
	local playerShips = player.getShips()
	local numShips = playerShips.count()
	for i = 1, numShips do
	local ship = playerShips[i]
	local shiploc = ship.position
	local shipor = ship.orientation
	write("addShip(\""..ship.getName().."\""..", {"..shiploc[1]..", "..shiploc[2]..", "..shiploc[3].."}, "..index..", {"..(-shipor[1])..", "..(-shipor[2])..", "..(-shipor[3]).."})\n")
        end
	index = index + 1
	write("\n")
	end
	writeto()
	print("Success!")
	numPrints = numPrints + 1
end
