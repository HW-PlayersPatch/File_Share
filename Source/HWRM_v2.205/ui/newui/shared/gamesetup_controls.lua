dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")


-- Column widths for the players area.  Must add up to 1 or less.
PLAYEROPTIONS_COLUMNWIDTH = .25		-- 128
COLOR_COLUMNWIDTH =			.16		--70
RACE_COLUMNWIDTH =			.2		--86
TEAM_COLUMNWIDTH =			.1		-- 20 (orign) 56
POSITION_COLUMNWIDTH = 		.1		-- 60
PING_COLUMNWIDTH =			.1		-- 42
OKBTN_COLUMNWIDTH =			.05		-- 22

SLOTTYPE_COLUMNWIDTH =		.75		-- 111
SLOTCOLOR_COLUMNWIDTH =		.25		-- 111

-- Heights
--LISTHEADER_HEIGHT = 1/28


-- Paddings - (How far away the children are from the sides of the parent
PAD_LT_LISTS =  { l = 4, t = 1, lr = "px", tr = "px" }
PAD_RB_LISTS = { r = 4, b = 1, rr = "px", br = "px" }

-- Margins - (How much distance between others)
MARGIN_LT_LISTS =  { l = 0, t = 4, lr = "px", tr = "px" }
MARGIN_RB_LISTS = { r = 4, b = 4, rr = "px", br = "px" }


-------------------------------------------------------------------
PLAYERLISTHEADER = {

	type = "Frame",
	name = "frmRootPlayersBox",
	backgroundColor = "FEColorBackground1",
			
	Layout = {	
			size_WH = {	w = 1, h = LISTHEADER_HEIGHT, wr = "par", hr = "scr"},
			pad_LT = PAD_LT_LISTS,
			pad_RB = PAD_RB_LISTS,
	},

	arrangetype = "horiz"
	;	

	--DEFINITION FOR: (txtLbl) PLAYER_OPTIONS
	{
		type = "TextLabel",
		name = "txtLblPLAYEROPTIONS",
				
		Layout = {	
			size_WH = {	w = PLAYEROPTIONS_COLUMNWIDTH, h = 1, wr = "par", hr = "par"}
		},

		--autosize = 1,
				
		Text = {
			text = "$2899", -- PLAYERS//
			textStyle = "FEHeading4",
			--vAlign = "Top",
			--hAlign = "Left",
		}
		;
	},	
	--DEFINITION FOR: (txtLbl) COLOURS
	{
		type = "TextLabel",
		name = "txtLblCOLOURS",
		--autosize = 1,
		Layout = {	
			size_WH = {	w = COLOR_COLUMNWIDTH, h = 1, wr = "par", hr = "par"}
		},
				
		Text = {
			text = "$3340",
			textStyle = "FEHeading4",
			hAlign = "Center",
		}
		;
	},
	--DEFINITION FOR: (txtLbl) RACE
	{
		type = "TextLabel",
		name = "txtLblRACE",
				
		Layout = {	
			size_WH = {	w = 16.0, h = 1, wr = "px", hr = "par"}
		},
				
		Text = {
			text = "$3341",
			textStyle = "FEHeading4",
			hAlign = "Center",
		},
		
		ignored = 1,
		arrangeweight = 1.0,
		;
	},			
	--DEFINITION FOR: (txtLbl) TEAM
	{
		type = "TextLabel",
		name = "txtLblTEAM",

		Layout = {	
			size_WH = {	w = TEAM_COLUMNWIDTH, h = 1, wr = "par", hr = "par"}
		},
				
		Text = {
			text = "$3342",
			textStyle = "FEHeading4",
			hAlign = "Center",
		},
		
		ignored = 1,
		arrangeweight = 0.0,
		;
	},	
	--DEFINITION FOR: (txtLbl) POSITION
	{
		type = "TextLabel",
		name = "txtLblPOSITION",

		Layout = {	
			size_WH = {	w = POSITION_COLUMNWIDTH, h = 1, wr = "par", hr = "par"}
		},
			
		Text = {
			text = "$4934",  --3343 - Position
			textStyle = "FEHeading4",
			hAlign = "Center",
		},
		
		ignored = 1,
		arrangeweight = 0.0,
		;
	},			
	--DEFINITION FOR: (txtLbl) PING
	{
		type = "TextLabel",
		name = "txtLblPING",

		Layout = {	
			size_WH = {	w = PING_COLUMNWIDTH, h = 1, wr = "par", hr = "par"}
		},
				
		Text = {
			text = "$3344",
			textStyle = "FEHeading4",
			hAlign = "Center",
		},
		
		ignored = 1,
		arrangeweight = 0.0,
		;
	},	
	--DEFINITION FOR: (txtLbl) OK
	{
		type = "TextLabel",
		name = "txtLblOK",

		Layout = {	
			size_WH = {	w = OKBTN_COLUMNWIDTH, h = 1, wr = "par", hr = "par"}
		},
				
		Text = {
			text = "$3345",
			textStyle = "FEHeading4",
			hAlign = "Center",
		},
		
		ignored = 1,
		arrangeweight = 0.0,
		;
	},	
}

-----------------------------------------------------------------------

--DEFINITION FOR: (frm) PlayerInfo LOCAL
PLAYERINFOLOCALCLONER = {
	type = "Frame",
	name = "frmPlayerInfoLocal",
	ignored = 1,
	Layout = {	
		pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
		pivot_XY = { 0.0, 0.5 },
		size_WH = {	w = PLAYEROPTIONS_COLUMNWIDTH+COLOR_COLUMNWIDTH, h = 1, wr = "par", hr = "par"},
		--margin_LT = MARGIN_LT_LISTS,
		--margin_RB = MARGIN_RB_LISTS,
	},

	--autosize=1,	
	arrangetype = "horiz",

	--backgroundColor = { 255, 0, 0, 255 },
	;
					
	{
		type = "Button",
		name = "btnEmblem",
		
		Layout = {	
			pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },	
			size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
			pad_LT = PAD_LT_LISTS,
			pad_RB = PAD_RB_LISTS,	
		},

		borderWidth = 1,
		borderColor = {215,215,215,255},
		overBorderColor = {255,255,255,255},
		disabledBorderColor = {175,175,175,255},
		giveParentMouseInput = 1,
		disabledHelpTip = " ",
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3368", -- EDIT PROFILE

		arrangetype = "horiz",
		arrangedir = -1

		;
							
		--DEFINITION FOR: (txtLbl) SelectedPlayer
		{
			type = "TextLabel",
			name = "txtLblSelectedPlayerName",
			ignored = 1,
			Layout = {	
				pos_XY = { x = 0.0, y = 0.5, xr = "px", yr = "par" },	
				pivot_XY = { 0.0, 0.5 },
				size_WH = {	w = SLOTTYPE_COLUMNWIDTH, h = 1, wr = "par", hr = "par"},

			},
			--autosize=1,
		
			giveParentMouseInput = 1,
			dropShadow = 1,
			Text = {

				text = "TESTUSERNAME",
				color = {255,255,255,255},
				textStyle = "FEButtonTextStyle",
				hAlign = "Left",
				dropShadow = 1,
			},
					--	backgroundColor = { 255, 200, 0, 255 },	
		},
		
		---- Player color, emblem 						
		{
			type = "Frame",
			name = "frmEmblem",

			Layout = {	
				pos_XY = { x = 1.0, y = .5, xr = "par", yr = "par" },	
				pivot_XY = { 1.0, 0.5 },
				size_WH = {	w = SLOTCOLOR_COLUMNWIDTH, h = 1, wr = "par", hr = "par"},
				
			},

			giveParentMouseInput = 1

			--backgroundColor = { 0, 200, 200, 255 },
			;
			
			--DEFINITION FOR: (frmgr) 2m_flg.tga
			{
				type = "Frame",		
				name = "frmStripe",
				
				Layout = {	
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
				},
							
				BackgroundGraphic = {
					texture = "Data:UI\\NewUI\\Network\\m_stripes.tga",				
					uvRect = { 0, 1, 1, 0 },  -- Flipped?				
				},

				--backgroundColor = { 27, 34, 0, 255 },
				giveParentMouseInput = 1
				;
			},
				
			--DEFINITION FOR: (frmgr) 2Emblem.tga
			{	
			type = "Frame",	
				name = "frmBadge",	
				Layout = {	
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
					size_WH = {	w = .9, h = .9, wr = "par_min", hr = "par"},
				},	

				
				BackgroundGraphic = {
					texture = "DATA:Badges/Hiigaran.tga",
					uvRect = {0.0,1.0,1.0,0.0},
				},

				--backgroundColor = {25,25,25,0},							
				
				giveParentMouseInput = 1
				;
			},
			
		},
		
	},
}
					

-----------------------------------
----------------------------------------------------------------------------------
--DEFINITION FOR: (frm) PlayerInfo OTHER - Slot for cpu players and other human players (MP only)
PLAYERINFOOTHERCLONE = {
	type = "Frame",
	name = "frmPlayerInfoOther",

	Layout = {	
			pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = PLAYEROPTIONS_COLUMNWIDTH+COLOR_COLUMNWIDTH, h = 1, wr = "par", hr = "par"},
	},
	ignored = 1,
	--autosize=1,	
	arrangetype = "horiz",

	--backgroundColor = { 100, 0, 0, 255 }
	;
		
	--DEFINITION FOR: (ddLst) ChooseDifficulty
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		name = "ddLstDifficulty",

		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			--size_WH = {	w = RACE_COLUMNWIDTH, h = 1, wr = "par", hr = "par"},
			--margin_LT = MARGIN_LT_LISTS,
			--margin_RB = MARGIN_RB_LISTS,
			--pos_XY = { x = 0.0, y = 0, xr = "px", yr = "par" },	
			--pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = SLOTTYPE_COLUMNWIDTH, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
		},
		--autosize=1,

		giveParentMouseInput = 1,
		ignored = 1,				
		
		visible = 0,
		
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3327", --CHOOSE THE DIFFICULTY OF THE CPU OPPONENT
		disabledHelpTip = " ",
		--backgroundColor = { 100, 200, 0, 255 }	
		;
	},
					
	--DEFINITION FOR: (ddLst) ChooseSlotType
	{
		
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		name = "ddLstSlotControl",

		Layout = {	
			pos_XY = { x = 0.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = SLOTTYPE_COLUMNWIDTH, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
		},
		autosize=1,

		giveParentMouseInput = 1,			
		ignored = 1,		

		visible = 1,	
				
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3328",
		disabledHelpTip = " ",
		--backgroundColor = { 100, 200, 0, 255 }			
		;
	},

	---- Player color, emblem - BUTTON				
	{
		-- todo: this needs to be disabled to kill mouse over state
		type = "Button",
		name = "btnEmblem",		
		
		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "par", yr = "par" },	
			pivot_XY = { 1.0, 0.5 },
			size_WH = {	w = SLOTCOLOR_COLUMNWIDTH, h = 1, wr = "par", hr = "par"},

		},
		
		outerBorderWidth = 1,
		disabledBorderColor = {175,175,175,255},
		overBorderColor = {255,255,255,255},
		borderColor = {215,215,215,255},
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3448", -- EDIT CPU PROFILE
		disabledHelpTip = " ", -- *none*,
		
		--backgroundColor = { 255, 0, 0, 255 }

		;

		-- The actual emblem and stripe
		{
			type = "Frame",
			name = "frmEmblem",

			Layout = {	
				pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
				size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
			},
			
			giveParentMouseInput = 1		

			;
			
			--DEFINITION FOR: (frmgr) 2m_flg.tga
			{
				type = "Frame",	
				name = "frmStripe",

				Layout = {	
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par"},
				},
	
										
				BackgroundGraphic = {
					texture = "Data:UI\\NewUI\\Network\\m_stripes.tga",				
					uvRect = { 0, 1, 1, 0 },  -- Flipped?									
				},
				
				--backgroundColor = { 255, 200, 0, 255 },	
				giveParentMouseInput = 1
				;
			},
			
			--DEFINITION FOR: (frmgr) 2Emblem.tga
			{
				type = "Frame",
				name = "frmBadge",
				Layout = {	
					pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },	
					size_WH = {	w = .9, h = .9, wr = "par_min", hr = "par"},
				},
				
				BackgroundGraphic = {
					texture = "DATA:Badges/Hiigaran.tga",
					uvRect = {0.0,1.0,1.0,0.0},
				},

				backgroundColor = {25,25,25,0},							
				
				giveParentMouseInput = 1
				;
			},
		},
	},
						
	

}
-------------------------------------------------------------------------
-- PLAYER INFO THAT EVERYTHING COMES FROM
-------------------------------------------------------------------------
--DEFINITION FOR: (frm) plr1frm
PLAYER1FRAMETOCLONE = {
	type = "Frame",
	name = "frmplr1frm",
	visible = 0,
	
	Layout = {	
			--size_WH = LAYOUT_STRETCHWIDTHPARENT,
			size_WH = {	w = 1, h = LISTHEADER_HEIGHT, wr = "par", hr = "scr"},
			pad_LT = PAD_LT_LISTS,
			pad_RB = PAD_RB_LISTS,
	},
	
	arrangetype = "horiz",		
	
	borderWidth = 1,
	borderColor = {54,61,60,255},
							
	--borderWidth = 1,
	--borderColor = "RM_FEColorDisabled",--"FEColorOutline"
	;	
	PLAYERINFOLOCALCLONER,
	PLAYERINFOOTHERCLONE,


	--DEFINITION FOR: (ddLst) ChooseRace
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		name = "ddLstChooseRace",

		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = 16.0, h = DROPDOWN_HEIGHT, wr = "px", hr = "scr"},
			--margin_LT = MARGIN_LT_LISTS,
			--margin_RB = MARGIN_RB_LISTS,
		},
		--autosize=1,	

		enabled = 1,
		ignored = 1,
		arrangeweight = 1.0,
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3324",--CHOOSE YOUR RACE
		--backgroundColor = { 255, 128, 128, 255 }	
		
		Unselected = {
			type = "TextLabel",
			name = "itemText",
			visible = 1,
			overColor = {255,255,255,64},
			backgroundColor = {255,255,255,16},
			
			giveParentMouseInput = 1,

			Layout = {	
				size_WH = {w = 1, h = 1, wr = "par", hr = "par",},
				Flags = { hasVolume = 0, canArrange = 0, canMeasure = 0, canUniform = 0, },
			},
			
			Text = {
				textStyle = "FEHeading4",
				hAlign = "Left",
				vAlign = "Middle",
				text = "Blarg",
				color = {255,255,255,128},
				offset = {4,0},
			},
		},
	},	
	--DEFINITION FOR: (ddLst) ChooseTeam
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		name = "ddLstChooseTeam",

		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = TEAM_COLUMNWIDTH, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
			--margin_LT = MARGIN_LT_LISTS,
			--margin_RB = MARGIN_RB_LISTS,
		},
		--autosize=1,	

		ignored = 1,
		arrangeweight = 0.0,
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3322",--CHOOSE YOUR TEAM
		--backgroundColor = { 128, 255, 128, 255 }
		;
	},	
	--DEFINITION FOR: (ddLst) ChoosePos
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		name = "ddLstChoosePos",
		
		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = POSITION_COLUMNWIDTH, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
			--margin_LT = MARGIN_LT_LISTS,
			--margin_RB = MARGIN_RB_LISTS,
		},
		--autosize=1,	

		enabled = 1,
		ignored = 1,
		arrangeweight = 0.0,
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3326",--CHOOSE YOUR STARTING POSITION
		--backgroundColor = { 128, 128, 255, 255 }
		;
	},
	--DEFINITION FOR: (txtLbl) pingpl1
	{
		type = "TextLabel",
		name = "txtLblpingpl1",

		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = PING_COLUMNWIDTH, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
			--margin_LT = MARGIN_LT_LISTS,
			--margin_RB = MARGIN_RB_LISTS,
		},
		--autosize=1,	

		Text = {
			text = "$3344",
			textStyle = "FEListBoxItemTextStyle",
			offset = {1,0},
		},

		ignored = 1,
		arrangeweight = 0.0,
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3323",--PING FOR REMOTE PLAYER
		--backgroundColor = { 255, 128, 255, 255 }
		;
	},	

	--DEFINITION FOR: (btn) PCheck
	{
		type = "Button",
		buttonStyle = "FEReadyButtonStyle",
		name = "btnPCheck",

		Layout = {	
			pos_XY = { x = 1.0, y = 0.5, xr = "px", yr = "par" },	
			pivot_XY = { 0.0, 0.5 },
			size_WH = {	w = ARROWBUTTON_HEIGHT, h = ARROWBUTTON_HEIGHT, wr = "scr", hr = "scr"},
			lockAspect=1,
			--margin_LT = MARGIN_LT_LISTS,
			--margin_RB = MARGIN_RB_LISTS,
		},
		--autosize=1,	

		ignored = 1,
		arrangeweight = 0.0,
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3325",--CHECK THIS WHEN YOU ARE READY
		--backgroundColor = { 128, 255, 255, 255 }
		;
	},					





}



------------------------------------------------------------------
-- Items to clone! ---

-- Used for playerlist, map dropdown, options,
LISTBOXITEMTOCLONE = {
	type = "TextListBoxItem",			
	buttonStyle = "FEListBoxItemButtonStyle",
	name = "listBoxItemToClone",
		
	resizeToListBox = 1,
		
	visible = 0,
		
	Text = {
		textStyle = "FEListBoxItemTextStyle",
	},
}


--LISTBOXLOBBYPLAYERSTEMPLATE = {
				--type = "TextListBoxItem",
--				type = "ListBoxItem",
--				buttonStyle = "FEListBoxItemButtonStyle",
 --   			name = "lstBoxLobbyPlayersTemplate",
--				width = 255,
--				visible = 0,
--				enabled = 0,
--            	backgroundColor = {0,0,0,0},
--				;

--				{
--					type = "TextLabel",
--					name = "lblName",
--					size = { 88, 13 },
--					position = { 13, 0 },
--					visible = 1,
						
--					Text = {
						--text = "TEST",
--						textStyle = "FEListBoxItemTextStyle",
						--font = "ListBoxItemFont",
					--	vAlign = "Middle",
					--	hAlign = "Left",
--						offset = {4,0},
					--	color = {0,0,0,255},
--					}
--				},
							-- test of adding new buttons
--				{
-- 					type = "Button",
-- 				    name = "btnListAll",
-- 				    visible = 1,
-- 					size = {13, 13},
					--position = {216, 419},
--					position = {0, 0},			
--					borderColor = {0, 175, 255, 255},
--					borderWidth = 0,			
--					DefaultGraphic = {
--						texture = "data:ui/newui/network/chat_icons.tga",
--						textureUV_TL = {19,41},
--						textureUV_WH = {13, 13},
--					},			
--					helpTipTextLabel = "txtLblHELPTEXT",
--					helpTip = "$3480", -- USER IS ONLINE				
					-- swap with the whisper button
 					--onMouseClicked = [[UI_SetElementVisible( "", "btnListIgnore", 0 ); UI_SetElementVisible( "", "btnListWhisper", 1 );]];
--					-- the code would need to check the child and see which one is visible!					
 --				},	
							
-- 				{
-- 					type = "Button",
-- 				    name = "btnListIgnore",
-- 				    visible = 0,
-- 					size = {13, 13},
--					--position = {216, 419},
--					position = {0, 0},			
--					borderColor = {0, 175, 255, 255},
--					borderWidth = 0,			
--					DefaultGraphic = {
--						texture = "data:ui/newui/network/chat_icons.tga",
--						textureUV_TL = {34,41},
--						textureUV_WH = {13, 13},
--					},			
--					helpTipTextLabel = "txtLblHELPTEXT",
--					helpTip = "$3481", -- USER IS IN YOUR IGNORE GROUP				
					-- swap with the whisper button
 					--onMouseClicked = [[UI_SetElementVisible( "", "btnListIgnore", 0 ); UI_SetElementVisible( "", "btnListWhisper", 1 );]];
					-- the code would need to check the child and see which one is visible!					
 --				},
 --				{
 --					type = "Button",
 --				    name = "btnListWhisper",
 --				    visible = 0,
 --					size = {13, 13},
--					--position = {216, 419},
--					position = {0, 0},			
--					borderColor = {0, 175, 255, 255},
--					borderWidth = 0,			
--					DefaultGraphic = {
--						texture = "data:ui/newui/network/chat_icons.tga",
--						textureUV_TL = {3,42},
--						textureUV_WH = {13, 13},
--					},			
--					helpTipTextLabel = "txtLblHELPTEXT",
--					helpTip = "$3482", -- USER IS IN YOUR WHISPER GROUP				
--					-- swap with the whisper button
 					--onMouseClicked = [[UI_SetElementVisible( "", "btnListIgnore", 0 ); UI_SetElementVisible( "", "btnListWhisper", 1 );]];
					-- the code would need to check the child and see which one is visible!					
 --				},						
--		}


SUPPRESSBUTTON = {
					
	type = "Frame",
				
	Layout = {			
		pos_XY = { x = 1.0, y = 0.5, xr = "par", yr = "par" },	
		Flags = { hasVolume = 0, canArrange = 0	},
		pivot_XY = { 1.0, 0.5 },		
	},					
	--backgroundColor = { 128, 0, 0, 100 },
	arrangetype = "horiz",
	autosize=1
	;
	
	-- Button's label
	{
	type = "TextLabel",
	--position = { 128, 19},
	--size = {138 ,9},
	name = "txtLblTYPESUPPRESSOPTION",
	Text = {
		text = "$3483", -- SUPPRESS
		textStyle = "FEHeading4",
		hAlign = "Right",
		vAlign = "Middle",
	},
	autosize=1
	;	
	},			
	-- button to toggle the lobby join/leave msg	
	{
		type = "Button",
		buttonStyle = "FEReadyButtonStyle",
		name = "btnSuppress",			
		--position = { 267 , 16 },
		visible = 1,
		pressed = 1,	
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3484", -- SUPPRESS JOIN / LEAVE LOBBY MESSAGES
	},	
}




-- Listbox Object to clone for Chat
CHATLISTBOXITEMCLONE = {
				
	type = "ListBoxItem",
	name = "lstBoxChatTemplate",
	
	Layout = {	
		--pos_XY = { x = 0.0, y = 0.0, xr = "px", yr = "px" },	
		size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
		pad_LT = { l = 4, t = 2, lr = "px", tr = "px" },
		pad_RB = { r = 4, b = 2, rr = "px", br = "px" },		
	},

	visible = 0,
	enabled = 0,
	autosize = 1,
	ignored=1,
	backgroundColor = { 0, 0, 0, 64 },

	;			
	{
		type = "TextLabel",
		name = "m_lblText",
		
		Layout = {							
			size_WH = {	w = 1, h = 1 , wr = "par", hr = "px" },						
				},	


		Text = {
			textStyle = "FEListBoxItemTextStyle",
			color = {255,255,255,255},
			font = "ChatFont",
			offset ={0,0},
		},
		wrapping = 1,
		autosize = 1,
	},	
}

	
CHOOSEMAPTEMPLATE = {
	type = "TextListBoxItem",
	buttonStyle = "FEListBoxItemButtonStyle",
	visible = 0,
	ignored=1,
	enabled = 0,
	resizeToListBox = 1,
	Text = {
		textStyle = "FEListBoxItemTextStyle",
	},
	position = {4,4},
	width = 169,
	name = "ddLstChooseMapTemplate"
	;
}



--DEFINITION FOR: (frm) GameTypeToClone
GAMETYPETOCLONE =	{
	type = "Frame",
	name = "frmGameTypeToClone",
	--size = {276, 18},
	visible = 0,
	helpTipTextLabel = "txtLblHELPTEXT",
	helpTip = "$3245", -- CHOOSE THE GAME TYPE
	arrangetype = "horiz",

		Layout = {							
			size_WH = {	w = 1, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr" },		

			},

	--backgroundColor = { 255, 0, 0, 255 }
	;
	-- Game info button
	{
		type = "Button",
		name = "btnGameInfo",
		visible=0,
		ignored=1,
		--position = {136, 2},
		buttonStyle = "FEInfoButtonStyle",
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3246", -- SHOW GAME TYPE INFORMATION
	},
	{
		type = "TextLabel",
		Layout = {							
			size_WH = {	w = .3, h = 1, wr = "par", hr = "par" },		
		},
		Text = {				
			textStyle = "RM_GenericLabelLarge_TextStyle",
			text = "$3244", -- GAME TYPE
		},
		giveParentMouseInput = 1
		;
	},			
	--DEFINITION FOR: (ddLst) OptionChoices
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		Layout = {							
			size_WH = {	w = .7, h = 1, wr = "par", hr = "par" },		
		},
		name = "ddLstOptionChoices",
		helpTipTextLabel = "txtLblHELPTEXT",
		helpTip = "$3245" -- CHOOSE THE GAME TYPE
		;
	},		

}



--DEFINITION FOR: (frm) OptionToClone
OPTIONTOCLONE = {
	type = "ListBoxItem",		
	position = {1,1},
	--size = {276,15},
	visible = 0,
	name = "frmOptionToClone",
	helpTipTextLabel = "txtLblHELPTEXT",
	arrangetype="horiz",
	Layout = {							
			size_WH = {	w = 1, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr" },		

			},
			--autosize=1,
	;
	--DEFINITION FOR: (txtLbl) OptionName
	{
		type = "TextLabel",

		name = "txtLblOptionName",
		Text = {				
			textStyle = "RM_GenericLabelLarge_TextStyle",
		},
		Layout = {							
			size_WH = {	w = .5, h = 1, wr = "par", hr = "par" },		
			},
			--autosize=1,
		;
	},
	--DEFINITION FOR: (ddLst) OptionChoices
	{
		type = "DropDownListBox",
		dropDownListBoxStyle = "FEDropDownListBoxStyle",
		name = "ddLstOptionChoices",
		Layout = {							
			size_WH = {	w = .5, h = 1, wr = "par", hr = "par" },		
			},
			--autosize=1,
		;
	},

}