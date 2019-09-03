-- Add the build times to each build option
doscanpath("data:ui", "playerspatch_ui_util.lua")
if GetProductionTimeSetting() == 2 then
	doscanpath("data:Scripts/Productiontimes", "buildtimes.lua")

	--Check locale
	if GetProductionTimeSetting() == 2 then --English
		doscanpath("data:Scripts/Productiontimes", "LocaleEnglish.lua")
	end
	
	for i,e in build do
		if e.Description and e.ThingToBuild then
			loc = localization[e.Description]
			buildtime = buildtimes[e.ThingToBuild]
			if loc and buildtime then
				-- The color code at the end is for the build menu to reset the color of the units queued
				build[i].Description = loc .. "  \n\n<b>Base Time:</b> " .. buildtime .. "s"
			end
		end
	end
end
