
if (NoButton==nil) then
	function NoButton(_name)
		local PhantomButton = {
			type = "TextButton",
			name = _name,
			ignored = 1,
			visible = 0,
			Layout = {
				min_WH  = {	w = 1, h = 1, wr = "scr", hr = "scr" },
			},
			autosize = 0,
		}

		return PhantomButton
	end
end

if (CampainButton==nil) then
	function CampainButton()
		return NoButton("btnCampaign")
	end
end

if (MPButton==nil) then
	function MPButton()
		return NewMenuButton("btnMultiplayer",		"$2621",	nil,	0,	LAYOUT_MENU_OUTLINED_BUTTONS,	"FEButtonStyle1_Alert_Outlined_Chipped",	"UI_ShowScreen('ConnectionType', eTransition);")
	end
end
