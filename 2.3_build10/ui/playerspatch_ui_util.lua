--Expanded option functions.
--If you plan to change or add settings for another mod, please use "YourModName_" rather than "PlayersPatch_" to prevent conflicts in people's "Profile\PLAYERCFG.LUA".
--Instructions are here: https://forums.gearboxsoftware.com/t/ui-in-game-screeen-slider-with-link-to-function/1528075/21

function GetTacticalOverlaySetting()
	TacticalOverlaySetting = GetOptionValueUI("PlayersPatch_TacticalOverlaySetting")

	if TacticalOverlaySetting < 1 or TacticalOverlaySetting > 4 then
		TacticalOverlaySetting = 2
	end

	return TacticalOverlaySetting
end

function GetProductionTimeSetting()
	ProductionTimeSetting = GetOptionValueUI("PlayersPatch_ProductionTimeSetting")

	if ProductionTimeSetting < 1 or ProductionTimeSetting > 2 then
		ProductionTimeSetting = 1
	end

	return ProductionTimeSetting
end

function GetBuildResearchLaunchPanelsScale()
	BuildResearchLaunchPanelsScale = GetOptionValueUI("PlayersPatch_BuildResearchLaunchPanelsScale")

	if BuildResearchLaunchPanelsScale < 0.5 or BuildResearchLaunchPanelsScale > 1.5 then
		BuildResearchLaunchPanelsScale = 1.0
	end

	return BuildResearchLaunchPanelsScale
end

function GetBuildResearchLaunchPanelsSCR()
	--convert scale to SCR screen ratio (from 0.5-1.5 scale, to 0.1-0.3 SCR)
	--and enlarge slightly (Default of 1 scale, default of .22 SCR)
	BuildResearchLaunchPanelsSCR = (GetBuildResearchLaunchPanelsScale() / 5) + 0.02

	if BuildResearchLaunchPanelsSCR > 0.3 then
		BuildResearchLaunchPanelsSCR = 0.3
	end	
	
	return BuildResearchLaunchPanelsSCR
end

function GetCameraPanSpeedScale()
	CameraPanSpeedScale = GetOptionValueUI("PlayersPatch_CameraPanSpeedScale")

	if CameraPanSpeedScale < 1 or CameraPanSpeedScale > 2 then
		CameraPanSpeedScale = 1.0
	end

	return CameraPanSpeedScale
end

function GetCameraRotationSpeedScale()
	CameraRotationSpeedScale = GetOptionValueUI("PlayersPatch_CameraRotationSpeedScale")

	if CameraRotationSpeedScale < 1 or CameraRotationSpeedScale > 2 then
		CameraRotationSpeedScale = 1.0
	end

	return CameraRotationSpeedScale
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

	--Clear any previous results
	OptionValue = nil

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
