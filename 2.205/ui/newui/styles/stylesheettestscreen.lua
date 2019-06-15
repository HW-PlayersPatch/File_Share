StyleSheetTestScreen = {
	size = {0,0,800,600},
	
	stylesheet = "HW2StyleSheet",
	
	RootElementSettings = {
		backgroundColor = {0,0,0,255},
	},
	;
	
	{
		type = "Frame",
		position = {10,50},
		size = { 780, 500 },
		outerBorderWidth = 2,
		borderColor = "FEColorOutline",
		backgroundColor = "IGColorBackground1",
		autoarrange = 1,
		autoarrangeSpace = 5,
		;
		
		-- Heading text styles
		{
			type = "TextLabel",
			size = {700, 30},
			outerBorderWidth = 1,
			borderColor = "IGColorOutline",
			Text = {
				text = "FEHeading1",
				textStyle = "FEHeading1",
			},
		},
		{
			type = "TextLabel",
			size = {700, 30},
			outerBorderWidth = 1,
			borderColor = "IGColorOutline",
			Text = {
				text = "FEHeading2",
				textStyle = "FEHeading2",
			},
		},
		{
			type = "TextLabel",
			size = {700, 30},
			outerBorderWidth = 1,
			borderColor = "IGColorOutline",
			Text = {
				text = "FEHeading3",
				textStyle = "FEHeading3",
			},
		},
		{
			type = "TextLabel",
			size = {700, 30},
			outerBorderWidth = 1,
			borderColor = "IGColorOutline",
			Text = {
				text = "FEHeading4//",
				textStyle = "FEHeading4",
			},
		},	
		
		-- Button Styles
		{
			type = "TextButton",
			buttonStyle = "FEButtonStyle1",
			Text = {
				text = "FEButtonStyle1",
				textStyle = "FEButtonTextStyle",
			},
			onMouseClicked = "UI_ShowScreen(\"NewMainMenu\", eTransition);",
		},
		{
			type = "TextButton",
			buttonStyle = "FEButtonStyle2",
			Text = {
				text = "FEButtonStyle2",
				textStyle = "FEButtonTextStyle",
			},
		},
		{
			type = "TextButton",
			buttonStyle = "FEButtonStyle1",
			enabled = 0,
			Text = {
				text = "Disabled",
				textStyle = "FEButtonTextStyle",
			},
		},
		{
			type = "TextButton",
			buttonStyle = "FECheckBoxButtonStyle",
		},
		{
			type = "TextButton",
			buttonStyle = "FECheckBoxButtonStyle",
			pressed = 1,
			enabled = 0,
		},
		{
			type = "TextButton",
			buttonStyle = "FECheckBoxButtonStyle",
			pressed = 0,
			enabled = 0,
		},
		
		-- Other styles
		
		
		{
			type = "DropDownListBox",			
			dropDownListBoxStyle = "FEDropDownListBoxStyle",
			width = 100,
			ListBox = {
				width = 100,
				backgroundColor = {0,0,0,255},
				listBoxStyle = "FEListBoxStyle",
				selected = 0,
				;
				{
					type = "TextListBoxItem",
					buttonStyle = "FEListBoxItemButtonStyle",
					resizeToListBox = 1,
					Text = {
						text = "ListBoxItem1",
						textStyle = "FEListBoxItemTextStyle",
					},
				},
				{
					type = "TextListBoxItem",
					buttonStyle = "FEListBoxItemButtonStyle",
					resizeToListBox = 1,
					Text = {
						text = "ListBoxItem2",
						textStyle = "FEListBoxItemTextStyle",
					},
				},
				{
					type = "TextListBoxItem",
					buttonStyle = "FEListBoxItemButtonStyle",
					resizeToListBox = 1,
					Text = {
						text = "ListBoxItem3",
						textStyle = "FEListBoxItemTextStyle",
					},
				},
				{
					type = "TextListBoxItem",
					buttonStyle = "FEListBoxItemButtonStyle",
					resizeToListBox = 1,
					Text = {
						text = "ListBoxItem4",
						textStyle = "FEListBoxItemTextStyle",
					},
				},
				{
					type = "TextListBoxItem",
					buttonStyle = "FEListBoxItemButtonStyle",
					resizeToListBox = 1,
					Text = {
						text = "ListBoxItem5",
						textStyle = "FEListBoxItemTextStyle",
					},
				},
			},
		},
		{
			type = "DropDownListBox",			
			dropDownListBoxStyle = "FEDropDownListBoxStyle",
			width = 100,
			enabled = 0,
			ListBox = {
				width = 100,
				backgroundColor = {0,0,0,255},
				listBoxStyle = "FEListBoxStyle",
				selected = 0,
				;
				{
					type = "TextListBoxItem",
					buttonStyle = "FEListBoxItemButtonStyle",
					resizeToListBox = 1,
					Text = {
						text = "Disabled",
						textStyle = "FEListBoxItemTextStyle",
					},
				},
			},
		},
		
		
		{
			type = "ListBox",
			size = {500, 60},
			listBoxStyle = "FEListBoxStyle_Bordered",
			selected = 0,			
			;
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					text = "ListBoxItem1",
					textStyle = "FEListBoxItemTextStyle",
				},
			},
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					text = "ListBoxItem2",
					textStyle = "FEListBoxItemTextStyle",
				},
			},
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					text = "ListBoxItem3",
					textStyle = "FEListBoxItemTextStyle",
				},
			},
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					text = "ListBoxItem4",
					textStyle = "FEListBoxItemTextStyle",
				},
			},
			{
				type = "TextListBoxItem",
				buttonStyle = "FEListBoxItemButtonStyle",
				resizeToListBox = 1,
				Text = {
					text = "ListBoxItem5",
					textStyle = "FEListBoxItemTextStyle",
				},
			},
		},
		
		
		--{
		--	type = "ScrollBar",
		--	scrollBarStyle = "FESliderStyle",
		--	sliderTextLabel = "booyatextlabel",
		--},
		--{
		--	type = "TextLabel",
		--	style = "FESliderLabelStyle",
		--	name = "booyatextlabel",
		--},
		
		
		
	},
		
}
