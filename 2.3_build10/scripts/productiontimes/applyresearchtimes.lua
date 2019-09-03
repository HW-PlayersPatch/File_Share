-- Add the research times to each research option
doscanpath("data:ui", "playerspatch_ui_util.lua")
if GetProductionTimeSetting() == 2 then

	--Check locale
	if GetProductionTimeSetting() == 2 then --English
		doscanpath("data:Scripts/Productiontimes", "LocaleEnglish.lua")
	end

	for i,e in research do
		upVal = ""
		if e.UpgradeValue then
			pc = e.UpgradeValue * 100 - 100
			upVal = "\n<b>Value:</b> "
			if pc > 0 then
				upVal = upVal .. "+"
			end
			upVal = upVal .. pc .. "% "
		end
		
		locLong = localization[e.Description]
		if locLong then
			research[i].Description = locLong .. "  \n" .. upVal .. "\n<b>Base Time:</b> " .. e.Time .. "s"
		end
	end
end