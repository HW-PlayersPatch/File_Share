

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

--Expanded option functions
function GetMissionDifficultyScale()
	MissionDifficultyScale = GetOptionValue("PlayersPatch_MissionDifficultyScale")

	if MissionDifficultyScale < 0 or MissionDifficultyScale > 5 then
		MissionDifficultyScale = 1.0
	end

	return MissionDifficultyScale
end

function GetOptionValue(OptionName)

	--Load expanded options
	dofilepath("PLAYER:PLAYERCFG.lua")

	for i = 1,999 do --loop through up to 999 options
		if Options.UIOptions[i] ~= nil then --option exists
			if Options.UIOptions[i].anchor == OptionName then
				OptionValue = Options.UIOptions[i].scale
				break --obtained only needed option, exit loop
			end
		else
			break --end of options, exit loop
		end
	end

	if OptionValue == nil then
		OptionValue = 999
	end
	
	return OptionValue
end