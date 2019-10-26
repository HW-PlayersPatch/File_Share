-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

function saveVar(varname, value)
	if (value == nil) then
	return
	end
	if (type(value) == "userdata") then
	return
	end
	if (type(value) == "function") then
	return
	end
	if (type(value) == "table" and rawget(value, "_generated_") == 1) then
	return
	end
	if (type(value) == "table" and rawget(value, "_ptr_") ~= nil) then
	local ptrval = rawget(value, "_ptr_")
	local tagNum = tag(ptrval)
	if (ClassTable[tagNum] ~= nil) then
	write(varname.." = restore"..rawget(ClassTable[tagNum], "_name_").."("..savePointerToID(ptrval)..")\n")
	end
	return
	end
	write(varname, " = ")
	if (type(value) == "string") then
	write(format("%q", value))
	elseif (type(value) == "table") then
	if (rawget(value, "__visited__") ~= nil) then
	write(rawget(value, "__visited__"))
	else
	write("{}\n")
	rawset(value, "__visited__", varname)
	for r, f in value do
	if (r ~= "__visited__") then
	if (type(r) == "string") then
	saveVar(varname.."."..r, f)
	else
	saveVar(varname.."["..r.."]", f)
	end
	end
	end
	end
	else
	write(tostring(value))
	end
	write("\n")
	flush()
end

function clearVisited(varname, value)
	if (type(value) == "table") then
	if (rawget(value, "__visited__") ~= nil then) then
	rawset(value, "__visited__", NIL)
	end
	foreach(value, clearVisited)
	end
end

function saveGlobals()
	write("\n-- global environment\n")
	foreach(globals(), saveVar)
	foreach(globals(), clearVisited)
end

writeto(saveOutputFile)
saveOutputFile = NIL

saveGlobals()

saveGlobals = NIL
saveVar = NIL
