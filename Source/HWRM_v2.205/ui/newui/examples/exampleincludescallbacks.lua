function ShowExample(screen, element, _example)

    print("ShowExample: "..screen.."."..element.."(".._example..")")
	-- Hide them all then show the one we want.
	UI_SetElementVisible('NewMainMenu', 'EXAMPLE_ScreenLayout', 0)
	UI_SetElementVisible('NewMainMenu', 'EXAMPLE_ScreenBorders', 0)
	UI_SetElementVisible('NewMainMenu', 'EXAMPLE_deaton', 0)
	UI_SetElementVisible('NewMainMenu', _example, 1)

end
