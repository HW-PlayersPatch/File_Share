-- Rules utility functions

-- Used to resolve the race speech bug
function SpeechRaceHelper()
	-- Write race list
	if (writeto("racelist.lua")) then
		local RaceCount = Race_GetCount()
		write("Race_ID = \n{\n")
		for i = 1,RaceCount-1 do
			write("\t\""..Race_GetName(i).."\",\n")
		end
		write("}")
		writeto()	
	end
end
