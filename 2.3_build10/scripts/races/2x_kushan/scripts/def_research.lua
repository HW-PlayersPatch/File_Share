Icon_Speed = "data:ui/newui/research/icons/speed.mres"
Icon_Health = "data:ui/newui/research/icons/health.mres"
Icon_Tech = "data:ui/newui/research/icons/tech.mres"
Icon_Ability = "data:ui/newui/research/icons/ability.mres"
Icon_Build = "data:ui/newui/research/icons/build.mres"

Modifier = 0
Ability = 1
AllShips = 0
Family = 1
Ship = 2

research = {}
res_index = 1

doscanpath("data:Scripts/Races/Kushan/Scripts/Research", "*.lua")
doscanpath("data:Scripts/Productiontimes", "applyresearchtimes.lua")

for i,e in research do
	if research[i].Cost > 1 then
		research[i].Cost = research[i].Cost * 2
	end
end
