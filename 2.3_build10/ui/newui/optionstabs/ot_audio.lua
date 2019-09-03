dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")
dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
----------- Command Panel Buttons ----------
-- FE_AUDIO_SFXVOLUME
-- FE_AUDIO_SPEECHVOLUME
-- FE_AUDIO_MUSICVOLUME
-- FE_AUDIO_UIVOLUME
-- FE_AUDIO_UISPACER
-- FE_AUDIO_NUMSFXCHANNELS
-- FE_AUDIO_BATTLECHATTERFREQUENCY
-- FE_AUDIO_FLEETSPEECHPITCH
-- FE_AUDIO_ENABLEBATTHECHATTER
-- FE_AUDIO_ENABLESELECTIONSPEECH

------- Custom Commands
FE_AUDIO_SFXVOLUME		=	Option_LabeledSlider("SFXVOLUME",		"$5117",	"lblSFXVolume",			"$5249",	"m_sbarSFXVolume",			"$5250")
FE_AUDIO_SPEECHVOLUME	=	Option_LabeledSlider("SPEECHVOLUME",	"$5118",	"lblSpeechVolume",		"$5251",	"m_sbarSpeechVolume",		"$5252")
FE_AUDIO_MUSICVOLUME	=	Option_LabeledSlider("MUSICVOLUME",		"$5119",	"lblMusicVolume",		"$5253",	"m_sbarMusicVolume",		"$5254")
FE_AUDIO_UIVOLUME		=	Option_LabeledSlider("UIVOLUME",		"$5589",	"lblUIVolume",			"$5255",	"m_sbarUIVolume",			"$5256")
FE_AUDIO_NUMSFXCHANNELS =	Option_LabeledSlider("SFXCHANNELS",		"$5120",	"lblSFXChannels",		"$5257",	"m_sbarSfxChannels",		"$5258", 0)


	-- SPACER
FE_AUDIO_UISPACER = {
	type = "Frame",
	size = {600, 13},
}

--------------------------------------------------------------------------
	-- BATTLE CHATTER FREQUENCY
BATTLECHATTERFREQUENCY_OPTIONS = {
	type = "ListBox",
	width = 330,
	listBoxStyle = "FEListBoxStyle_Bordered",
	--backgroundColor = {0,255,0,255},
	;	
								
	{
		type = "TextListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
		Text = {
			text = "$5094",
			textStyle = "FEListBoxItemTextStyle",
		},
										
		resizeToListBox = 1,
										
		helpTipTextLabel = "m_lblHelpText", 
		helpTip = "$5259", -- "LOWEST",
										
		customData = 25, -- 25/100
	},
	{
		type = "TextListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
		Text = {
			text = "$5095",
			textStyle = "FEListBoxItemTextStyle",
		},
		resizeToListBox = 1,
										
		helpTipTextLabel = "m_lblHelpText", 
		helpTip = "$5260", -- "STANDARD",
										
		customData = 70, -- 70/100
	},
	{
		type = "TextListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
		Text = {
			text = "$5096",
			textStyle = "FEListBoxItemTextStyle",
		},
		resizeToListBox = 1,
										
		helpTipTextLabel = "m_lblHelpText", 
		helpTip = "$5261", -- "HIGHEST",
										
		customData = 100, --100/100
	},
}

FE_AUDIO_BATTLECHATTERFREQUENCY = Option_LabeledDropDown("BATTLECHATTERFREQUENCY", "$5121",  "m_comboBattleChatter" , "$5090", BATTLECHATTERFREQUENCY_OPTIONS )


		
		
FE_AUDOIOTestListBox = {
			name = "TestBattleChatFreqListBox",
			type = "ListBox",
			--width = 330,
			Layout = {	
				--pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
				size_WH = { w = 200, h = 200, wr = "px", hr = "px" },	--original no stratch was 200x64							
				--pivot_XY = { 1, 0 },	
			},	
			autoHideScrollbar = 1,
			listBoxStyle = "FEListBoxStyle_Bordered",
			backgroundColor = {255,0,0,255},
			autosize=0,
			;	
								
			{
				type = "TextListBoxItem",
				--buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "$5094",
					textStyle = "FEListBoxItemTextStyle",
				},
										
				resizeToListBox = 1,
										
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$5259", -- "LOWEST",
										
				customData = 25, -- 25/100
				backgroundColor = {126,255,255,255},
												borderWidth = 2,
					borderColor = "FEColorScrollButtonDefault",
				
				Layout = {	
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 400, h = 32, wr = "px", hr = "px" },	--original no stratch was 200x64										
					--pivot_XY = { 1, 0 },	
				},	
			},
			{
				type = "TextListBoxItem",
				--buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "$5095",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 1,
										
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$5260", -- "STANDARD",
				backgroundColor = {126,255,23,255},						
				customData = 70, -- 70/100

				Layout = {	
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 50, h = 32, wr = "px", hr = "px" },	--original no stratch was 200x64							
					--pivot_XY = { 1, 0 },	
				},	
												borderWidth = 2,
					borderColor = "FEColorScrollButtonDefault",

			},
			{
				type = "TextListBoxItem",
				--buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "$5096",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 0,
										
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "$5261", -- "HIGHEST",
										
				customData = 100, --100/100

				backgroundColor = {59,0,255,255},
												borderWidth = 2,
					borderColor = "FEColorScrollButtonDefault",
				Layout = {	
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 50, h = 32, wr = "px", hr = "px" },	--original no stratch was 200x64										
					--pivot_XY = { 1, 0 },	
				},	
			},

			{
				type = "TextListBoxItem",
				--buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "Tip",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 0,
										
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "Tip", -- "HIGHEST",
										
				customData = 100, --100/100

				backgroundColor = {59,0,255,255},
												borderWidth = 2,
					borderColor = "FEColorScrollButtonDefault",
				Layout = {	
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 50, h = 32, wr = "px", hr = "px" },	--original no stratch was 200x64										
					--pivot_XY = { 1, 0 },	
				},	
			},

						{
				type = "TextListBoxItem",
				--buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "Tron",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 0,
										
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "Tron", -- "HIGHEST",
										
				customData = 100, --100/100

				backgroundColor = {59,0,255,255},
												borderWidth = 2,
					borderColor = "FEColorScrollButtonDefault",
				Layout = {	
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 50, h = 32, wr = "px", hr = "px" },	--original no stratch was 200x64										
					--pivot_XY = { 1, 0 },	
				},	
			},


						{
				type = "TextListBoxItem",
				--buttonStyle = "FEListBoxItemButtonStyle",
				Text = {
					text = "Tickl",
					textStyle = "FEListBoxItemTextStyle",
				},
				resizeToListBox = 0,
										
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = "Tickl", -- "HIGHEST",
										
				customData = 100, --100/100

				backgroundColor = {59,0,255,255},
												borderWidth = 2,
					borderColor = "FEColorScrollButtonDefault",
				Layout = {	
					pos_XY = { x = 0, y = 0, xr = "px", yr = "px" },
					size_WH = { w = 50, h = 32, wr = "px", hr = "px" },	--original no stratch was 200x64										
					--pivot_XY = { 1, 0 },	
				},	
			},

		}		
		
		
						
	-- FLEET SPEECH PITCH
FE_AUDIO_FLEETSPEECHPITCH = {
		type = "Frame",
		size = {608, 17},
		visible = 0, -- TODO
		;
							
		{
			type = "TextLabel",
			size = {206,13},
			Text = {
				textStyle = "FEHeading4",
				text = "$5123",
			},
		},
								
		{
			type = "Frame",
			position = {270, 0},
			size = {330, 13},
			;
								
			-- Radio Buttons
			{
				type = "RadioButton",
				name = "m_radioVoice1",
				buttonStyle = "FERadioButtonStyle",
				position = {0,0},
				enabled = 1,
									
				helpTip = "$5262", -- "SELECT VOICE FOR YOU FLEET VOICE OVER EFFECTS",
				helpTipTextLabl = "m_lblHelpText",
			},
			{
				type = "RadioButton",
				name = "m_radioVoice2",
				buttonStyle = "FERadioButtonStyle",
				position = {110,0},
				enabled = 1,
									
				helpTip = "$5262", -- "SELECT VOICE FOR YOU FLEET VOICE OVER EFFECTS",
				helpTipTextLabl = "m_lblHelpText",
			},
			{
				type = "RadioButton",
				name = "m_radioVoice3",
				buttonStyle = "FERadioButtonStyle",
				position = {220,0},
				enabled = 1,
									
				helpTip = "$5262", -- "SELECT VOICE FOR YOU FLEET VOICE OVER EFFECTS",
				helpTipTextLabl = "m_lblHelpText",
			},	
								
			-- Text labels
			{
				type = "TextLabel",
				position = {20,0},
				size = {90, 13},
				Text = {
					text = "$5124",
					textStyle = "FEHeading4",
				}
			},
			{
				type = "TextLabel",
				position = {130,0},
				size = {90, 13},
				Text = {
					text = "$5125",
					textStyle = "FEHeading4",
				}
			},
			{
				type = "TextLabel",
				position = {240,0},
				size = {90, 13},
				Text = {
					text = "$5126",
					textStyle = "FEHeading4",
				}
			},
		},
	}

						
	-- ENABLE BATTLE CHATTER
FE_AUDIO_ENABLEBATTHECHATTER = {
		type = "Frame",
		size = {608, 17},
		visible = 0, -- TODO
		;
								
		{
			type = "Frame",
			position = {270, 0},
			size = {330, 13},
			;
			{
				type = "Button",
				buttonStyle = "FECheckBoxButtonStyle",
				name = "m_chkBattleChatter",
				enabled = 0,
									
				helpTip = "$5263", -- "TOGGLE BATTLE SPEECH EVENTS",
				helpTipTextLabel = "m_lblHelpText",
			},
			{
				type = "TextLabel",
				size = {200, 13},
				position = {20, 0},
				Text = {
					text = "$5127",
					textStyle = "FEHeading4",
				},
			},
		},
	}
						
	-- ENABLE SELECTION SPEECH
FE_AUDIO_ENABLESELECTIONSPEECH = {
	type = "Frame",
	size = {608, 17},
	visible = 0, -- TODO
	;
								
	{
		type = "Frame",
		position = {270, 0},
		size = {330, 13},
		;
		{
			type = "Button",
			enabled = 0,
			buttonStyle = "FECheckBoxButtonStyle",
			name = "m_chkSelectionSpeech",
									
			helpTip = "$5264", -- "TOGGLE SELECTION SPEECH EVENTS",
			helpTipTextLabel = "m_lblHelpText",
		},
		{
			type = "TextLabel",
			size = {200, 13},
			position = {20, 0},
			Text = {
				text = "$5128",
				textStyle = "FEHeading4",
			},
		},
	},
}


-------------------------------------------------

FE_AUDIOOPTION_TAB = {
	type = "TabPage",
	name = "m_tabAudio",
	text = "$5110",
	helpTip = "$5242", -- "CHANGE AUDIO SETTINGS",

	Layout = {
		pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
		size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
		pad_LT = { l = 16, t = 16, lr = "px", tr = "px" },
		pad_RB = { r = 16, b = 16, rr = "px", br = "px" },
	},

	visible = 0,
	;
					
	{
		type = "Frame",
		--position = {4,17},
		--size = {608, 200},
		Layout = {
			pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },
			size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
								
		},

		--arrangeSep = {	x=0, y=4/600, xr="px", yr="scr",},	
		autoarrange = 1,
		autoarrangeSpace = 2,
		autoarrangeWidth = 612,
		;
						
		-- OPTION FRAMES
		FE_AUDIO_SFXVOLUME,
		FE_AUDIO_SPEECHVOLUME,
		FE_AUDIO_MUSICVOLUME,
		FE_AUDIO_UIVOLUME,
		FE_AUDIO_UISPACER,
		FE_AUDIO_BATTLECHATTERFREQUENCY,
		FE_AUDIO_NUMSFXCHANNELS,
		FE_AUDIO_FLEETSPEECHPITCH,
		FE_AUDIO_ENABLEBATTHECHATTER,
		FE_AUDIO_ENABLESELECTIONSPEECH,						
	},
}






