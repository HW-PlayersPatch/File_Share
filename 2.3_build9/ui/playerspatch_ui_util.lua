--Expanded option functions

function GetBuildResearchLaunchPanelsSCR()
	--convert scale to SCR screen ratio (from 0.5-1.5 scale, to 0.1-0.3 SCR)
	--and enlarge slightly (Default of 1 scale, default of .22 SCR)
	BuildResearchLaunchPanelsSCR = (GetBuildResearchLaunchPanelsScale() / 5) + 0.02

	if BuildResearchLaunchPanelsSCR > 0.3 then
		BuildResearchLaunchPanelsSCR = 0.3
	end	
	
	return BuildResearchLaunchPanelsSCR
end

function GetBuildResearchLaunchPanelsScale()
	BuildResearchLaunchPanelsScale = GetOptionValueUI("PlayersPatch_BuildResearchLaunchPanelsScale")

	if BuildResearchLaunchPanelsScale < 0.5 or BuildResearchLaunchPanelsScale > 1.5 then
		BuildResearchLaunchPanelsScale = 1.0
	end

	return BuildResearchLaunchPanelsScale
end

function GetCameraPanSpeedScale()
	CameraPanSpeedScale = GetOptionValueUI("PlayersPatch_CameraPanSpeedScale")

	if CameraPanSpeedScale < 1 or CameraPanSpeedScale > 2 then
		CameraPanSpeedScale = 1.0
	end

	return CameraPanSpeedScale
end

function GetCameraMaxZoomScale()
	CameraMaxZoomScale = GetOptionValueUI("PlayersPatch_CameraMaxZoomScale")

	if CameraMaxZoomScale < 1 or CameraMaxZoomScale > 2 then
		CameraMaxZoomScale = 1.0
	end

	return CameraMaxZoomScale
end

function GetMissionDifficultyScale()
	MissionDifficultyScale = GetOptionValueUI("PlayersPatch_MissionDifficultyScale")

	if MissionDifficultyScale < 0 or MissionDifficultyScale > 5 then
		MissionDifficultyScale = 1.0
	end

	return MissionDifficultyScale
end

function GetOptionValueUI(OptionName)

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