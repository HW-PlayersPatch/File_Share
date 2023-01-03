dofilepath("data:ui/newui/Styles/HWRM_Style/ControlConstructors.lua")
UI_LoadUILibrary("data:/ui/newui/Developer/GameBalanceScreen_Code.lua")


function CreateListboxItem(_text, _customstring, _mouseclick)

	local listitem = {
		type = "TextListBoxItem",
		buttonStyle = "FEListBoxItemButtonStyle",
		resizeToListBox = 1,
		Text = {
			textStyle = "FEListBoxItemTextStyle",
			text = _text,
		},
		onMouseClicked = _mouseclick,
		customDataString = _customstring,			

	}

	return listitem

end




BALANCE_SPAWNMENU={
		type = "TabPage",
		text = "UnitSpawner",
		--autosize=1,


		Layout = {
			size_WH = { w = 1.0, h = 1.0, wr = "par", hr = "par" },
			pad_LT = { l = 0, t = 16, lr = "px", tr = "px" },
		},
		
		;


		{
			type = "Frame",		
			Layout = {	
					pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
					size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },	
					--max_WH = {	w = .4, wr = "scr" },
					--min_WH = {	w = .4, wr = "scr" },
			},	
			name = "frame_LeftTabs",
			arrangetype = "horiz",
			--autosize  = 1,
			arrangeSep = {	x=8, y=8, xr="px", yr="px",},
			--backgroundColor = {255,0,0,255},
			;
			--------------- Player 1 stats column ------------
			{
				type = "Frame",		
				Layout = {					
					size_WH = {	w = 100, h = 1, wr = "px", hr = "par" },	
					--min_WH = {	w = .1, wr = "par" },	
					pad_RB  = { r = 8, b = 0, rr = "px", br = "scr" },
					pad_LT  = { l = 8, t = 0, lr = "px", tr = "scr" },
				--	Flags = { hasVolume=0 },		
				},
				name = "frame_leftplayer1stats",
				arrangetype = "vert",
				--autosize  = 1,
				arrangeSep = {	x=0, y=4, xr="px", yr="px",},
				
				;
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "p1",			
					Text = {
						text = "Player1",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				-- Spawn button P1
				{
					type = "TextButton",
					name = "spawnP1Button",

					helpTip =  "Spawn a single/batch of the selected P1 ship type",
					helpTipShift =  "Spawn 5 singles/batches of the selected P1 ship type",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P1 ship type",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",		

					Text = {
						text = "S1",
						rel = 1080,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,1)",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,5)",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,15)",	
				},
				-- Spawn button P1 Line Formation
				{
					type = "TextButton",
					name = "spawnP1ButtonBroad",

					helpTip =  "Spawn a single/batch of the selected P1 ship type in Broad",
					helpTipShift =  "Spawn 5 singles/batches of the selected P1 ship type in Broad",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P1 ship type in Broad",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .15, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Line",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,1,'broad')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,5,'broad')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,15,'broad')",	
				},
				-- Spawn button P1 X Formation
				{
					type = "TextButton",
					name = "spawnP1ButtonX",

					helpTip =  "Spawn a single/batch of the selected P1 ship type in X",
					helpTipShift =  "Spawn 5 singles/batches of the selected P1 ship type in X",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P1 ship type in X",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "X",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,1,'x')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,5,'x')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,15,'x')",	
				},
				-- Spawn button P1 Claw Formation
				{
					type = "TextButton",
					name = "spawnP1ButtonClaw",

					helpTip =  "Spawn a single/batch of the selected P1 ship type in Claw",
					helpTipShift =  "Spawn 5 singles/batches of the selected P1 ship type in Claw",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P1 ship type in Claw",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Claw",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,1,'movers')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,5,'movers')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,15,'movers')",	
				},
				-- Spawn button P1 Wall Formation
				{
					type = "TextButton",
					name = "spawnP1ButtonWall",

					helpTip =  "Spawn a single/batch of the selected P1 ship type in Wall",
					helpTipShift =  "Spawn 5 singles/batches of the selected P1 ship type in Wall",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P1 ship type in Wall",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Wall",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,1,'wall')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,5,'wall')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('player',0,15,'wall')",	
				},

				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "PlayerCount",			
					Text = {
						text = "0",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "Player1BuildCost",			
					Text = {
						text = "0",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "Player1BuildTime",			
					Text = {
						text = "0",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "Player1RunningHealth",			
					Text = {
						text = "0",
						--textStyle = "IGHeading1",						
						font = "Heading3Font",
						vAlign = "Middle",
						hAlign = "Left",
						offset = {0, 0},			
						color = { 238, 255, 255, 255},	
					},			
				},	
				-- Destroy Enemy Button
				{
					type = "TextButton",
					name = "DestroyP1",
					autosize=1,
					Layout = {	
						size_WH = {	w = 1, h = 2, wr = "par", hr = "px" },								
					},	
			
					buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",			
					
					Text = {
						text = "Nuke",
						rel = 1080,
						minShrink = 0.25,
					},
					onMouseClicked = "DestroyPlayer()",	
					
				},
			},
			---------------------------------------------------------
			{
				type = "Frame",		
				Layout = {	
					size_WH = {	w = 400, h = 1, wr = "px", hr = "par" },
					pad_LT = { l = 8.0, t = 0.0, lr = "px", tr = "px" },
					pad_RB = { r = 8.0, b = 0.0, rr = "px", br = "px" },	
					--Flags = { hasVolume=0 },	
				},	
				name = "centerframe",
				arrangetype = "vert",
				--autosize  = 1,
				arrangeSep = {	x=8, y=8, xr="px", yr="px",},
				--arrangeweight = 1,
				BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
				;
				{
					type = "Frame",		
					Layout = {	
						size_WH = {	w = 1, h = 1, wr = "par", hr = "px" },
					},	
					name = "centerframe",
					arrangetype = "horiz",
					autosize  = 1,
					arrangeSep = {	x=8, y=8, xr="px", yr="px",},
					;
					{
						type = "DropDownListBox",	
						name = "raceselect",
						dropDownListBoxStyle = "IGDropDownListBoxStyle",
						selected = 0,
						Layout = {	
							size_WH = {	w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr" },		
						},	
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "racelistbox",
							width = 242,
							;
							CreateListboxItem("$1100","hgn_listbox",		"ShowRaceListbox('hgn_listbox')"), -- Hiigaran
							CreateListboxItem("$1101","vgr_listbox",		"ShowRaceListbox('vgr_listbox')"), -- Vaygr
							CreateListboxItem("$1104","kus_listbox",		"ShowRaceListbox('kus_listbox')"), -- Kushan
							CreateListboxItem("$1105","tai_listbox",		"ShowRaceListbox('tai_listbox')"), -- Taiidan
							CreateListboxItem("HW1 Misc","hw1_misc_listbox","ShowRaceListbox('hw1_misc_listbox')"), -- Taiidan
							CreateListboxItem("HW2 Misc","hw2_misc_listbox","ShowRaceListbox('hw2_misc_listbox')"), -- Taiidan
							CreateListboxItem("MP Misc","mp_misc_listbox",	"ShowRaceListbox('mp_misc_listbox')"), -- Taiidan

						},
					},	
					{
						type = "DropDownListBox",	
						Layout = {	
							size_WH = {	w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr" },		
						},	
						name = "hgn_listbox",
						selected = 0,
						visible = 1,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "hgn_units",
							width = 242,
							;
							CreateListboxItem("hgn_scout",				"hgn_scout",				""), 
							CreateListboxItem("hgn_interceptor",		"hgn_interceptor",			""), 
							CreateListboxItem("hgn_attackbomber",		"hgn_attackbomber",			""), 
							CreateListboxItem("hgn_assaultcorvette",	"hgn_assaultcorvette",		""), 
							CreateListboxItem("hgn_pulsarcorvette",		"hgn_pulsarcorvette",		""), 
							CreateListboxItem("hgn_minelayercorvette",	"hgn_minelayercorvette",	""),
							CreateListboxItem("hgn_assaultfrigate",		"hgn_assaultfrigate",		""),
							CreateListboxItem("hgn_torpedofrigate",		"hgn_torpedofrigate",		""),
							CreateListboxItem("hgn_ioncannonfrigate",	"hgn_ioncannonfrigate",		""),
							CreateListboxItem("hgn_marinefrigate",		"hgn_marinefrigate",		""),
							CreateListboxItem("hgn_defensefieldfrigate","hgn_defensefieldfrigate",	""),
							CreateListboxItem("hgn_mothership",			"hgn_mothership",			""),
							CreateListboxItem("hgn_carrier",			"hgn_carrier",				""),
							CreateListboxItem("hgn_shipyard",			"hgn_shipyard",				""),
							CreateListboxItem("hgn_destroyer",			"hgn_destroyer",			""),
							CreateListboxItem("hgn_battlecruiser",		"hgn_battlecruiser",		""),
							CreateListboxItem("hgn_gunturret",			"hgn_gunturret",			""),
							CreateListboxItem("hgn_ionturret",			"hgn_ionturret",			""),
							CreateListboxItem("hgn_resourcecollector",	"hgn_resourcecollector",	""),
							CreateListboxItem("hgn_resourcecontroller",	"hgn_resourcecontroller",	""),
							CreateListboxItem("hgn_probe",				"hgn_probe",				""),
							CreateListboxItem("hgn_proximitysensor",	"hgn_proximitysensor",		""),
							CreateListboxItem("hgn_ecmprobe",			"hgn_ecmprobe",				""),
							CreateListboxItem("Hgn_Dreadnaught",		"Hgn_Dreadnaught",			""),
							CreateListboxItem("Kpr_Mover",				"Kpr_Mover",				""),
						},
					},	
					{
						type = "DropDownListBox",	
						name = "vgr_listbox",
						Layout = {	
							size_WH = {	w = .45, h = 24.0, wr = "par", hr = "px" },
						},	
						selected = 0,
						visible = 0,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "vgr_units",
							width = 242,
							;
							CreateListboxItem("vgr_scout",					"vgr_scout",				""), 
							CreateListboxItem("vgr_interceptor",			"vgr_interceptor",			""), 
							CreateListboxItem("vgr_bomber",					"vgr_bomber",				""), 
							CreateListboxItem("vgr_lancefighter",			"vgr_lancefighter",			""), 
							CreateListboxItem("vgr_missilecorvette",		"vgr_missilecorvette",		""), 
							CreateListboxItem("vgr_lasercorvette",			"vgr_lasercorvette",		""), 
							CreateListboxItem("vgr_commandcorvette",		"vgr_commandcorvette",		""), 
							CreateListboxItem("vgr_minelayercorvette",		"vgr_minelayercorvette",	""), 
							CreateListboxItem("vgr_assaultfrigate",			"vgr_assaultfrigate",		""), 
							CreateListboxItem("vgr_heavymissilefrigate",	"vgr_heavymissilefrigate",	""), 
							CreateListboxItem("vgr_infiltratorfrigate",		"vgr_infiltratorfrigate",	""), 
							CreateListboxItem("vgr_mothership",				"vgr_mothership",			""), 
							CreateListboxItem("vgr_carrier",				"vgr_carrier",				""), 
							CreateListboxItem("vgr_shipyard",				"vgr_shipyard",				""), 
							CreateListboxItem("vgr_destroyer",				"vgr_destroyer",			""), 
							CreateListboxItem("vgr_battlecruiser",			"vgr_battlecruiser",		""), 
							CreateListboxItem("vgr_weaponplatform_gun",		"vgr_weaponplatform_gun",	""), 
							CreateListboxItem("vgr_weaponplatform_missile",	"vgr_weaponplatform_missile",""), 
							CreateListboxItem("vgr_hyperspace_platform",	"vgr_hyperspace_platform",	""), 
							CreateListboxItem("vgr_resourcecollector",		"vgr_resourcecollector",	""), 
							CreateListboxItem("vgr_resourcecontroller",		"vgr_resourcecontroller",	""), 
							CreateListboxItem("vgr_probe",					"vgr_probe",				""), 
							CreateListboxItem("vgr_probe_prox",				"vgr_probe_prox",			""), 
							CreateListboxItem("vgr_probe_ecm",				"vgr_probe_ecm",			""), 

						},
					},	
					{
						type = "DropDownListBox",	
						name = "kus_listbox",
						Layout = {	
							size_WH = {	w = .45, h = 24.0, wr = "par", hr = "px" },
						},	
						selected = 0,
						visible = 0,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "kus_units",
							width = 242,
							;
							CreateListboxItem("kus_scout",				"kus_scout",				""), 
							CreateListboxItem("kus_interceptor",		"kus_interceptor",			""), 
							CreateListboxItem("kus_attackbomber",		"kus_attackbomber",			""), 
							CreateListboxItem("kus_defender",			"kus_defender",				""), 
							CreateListboxItem("kus_cloakedfighter",		"kus_cloakedfighter",		""), 
							CreateListboxItem("kus_lightcorvette",		"kus_lightcorvette",		""), 
							CreateListboxItem("kus_heavycorvette",		"kus_heavycorvette",		""), 
							CreateListboxItem("kus_salvagecorvette",	"kus_salvagecorvette",		""), 
							CreateListboxItem("kus_repaircorvette",		"kus_repaircorvette",		""), 
							CreateListboxItem("kus_multiguncorvette",	"kus_multiguncorvette",		""), 
							CreateListboxItem("kus_minelayercorvette",	"kus_minelayercorvette",	""), 
							CreateListboxItem("kus_assaultfrigate",		"kus_assaultfrigate",		""), 
							CreateListboxItem("kus_ioncannonfrigate",	"kus_ioncannonfrigate",		""), 
							CreateListboxItem("kus_supportfrigate",		"kus_supportfrigate",		""), 
							CreateListboxItem("kus_dronefrigate",		"kus_dronefrigate",			""), 
							CreateListboxItem("kus_mothership",			"kus_mothership",			""), 
							CreateListboxItem("kus_carrier",			"kus_carrier",				""), 
							CreateListboxItem("kus_destroyer",			"kus_destroyer",			""), 
							CreateListboxItem("kus_missiledestroyer",	"kus_missiledestroyer",		""), 
							CreateListboxItem("kus_heavycruiser",		"kus_heavycruiser",			""), 
							CreateListboxItem("kus_researchship",		"kus_researchship",			""), 
							CreateListboxItem("kus_resourcecollector",	"kus_resourcecollector",	""), 
							CreateListboxItem("kus_resourcecontroller",	"kus_resourcecontroller",	""), 
							CreateListboxItem("kus_cloakgenerator",		"kus_cloakgenerator",		""), 
							CreateListboxItem("kus_gravwellgenerator",	"kus_gravwellgenerator",	""), 
							CreateListboxItem("kus_probe",				"kus_probe",				""), 
							CreateListboxItem("kus_proximitysensor",	"kus_proximitysensor",		""), 
							CreateListboxItem("kus_sensorarray",		"kus_sensorarray",			""), 
							CreateListboxItem("kus_targetdrone",		"kus_targetdrone",			""), 
							CreateListboxItem("kus_cryotray",			"kus_cryotray",				""), 
							CreateListboxItem("kus_cryotray_M03",		"kus_cryotray_M03",			""), 
							CreateListboxItem("Kus_HeadshotAsteroid",	"Kus_HeadshotAsteroid",			""), 
						},
					},	
					{
						type = "DropDownListBox",						
						name = "tai_listbox",
						Layout = {	
							size_WH = {	w = .45, h = 24.0, wr = "par", hr = "px" },
						},	
						selected = 0,
						visible = 0,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "tai_units",
							width = 242,
							;
							CreateListboxItem("tai_scout",				"tai_scout",				""), 
							CreateListboxItem("tai_interceptor",		"tai_interceptor",			""), 
							CreateListboxItem("tai_attackbomber",		"tai_attackbomber",			""), 
							CreateListboxItem("tai_defender",			"tai_defender",				""), 
							CreateListboxItem("tai_defensefighter",		"tai_defensefighter",		""), 
							CreateListboxItem("tai_lightcorvette",		"tai_lightcorvette",		""), 
							CreateListboxItem("tai_heavycorvette",		"tai_heavycorvette",		""), 
							CreateListboxItem("tai_salvagecorvette",	"tai_salvagecorvette",		""), 
							CreateListboxItem("tai_repaircorvette",		"tai_repaircorvette",		""), 
							CreateListboxItem("tai_multiguncorvette",	"tai_multiguncorvette",		""), 
							CreateListboxItem("tai_minelayercorvette",	"tai_minelayercorvette",	""), 
							CreateListboxItem("tai_assaultfrigate",		"tai_assaultfrigate",		""), 
							CreateListboxItem("tai_ioncannonfrigate",	"tai_ioncannonfrigate",		""), 
							CreateListboxItem("tai_supportfrigate",		"tai_supportfrigate",		""), 
							CreateListboxItem("tai_fieldfrigate",		"tai_fieldfrigate",			""), 
							CreateListboxItem("tai_mothership",			"tai_mothership",			""), 
							CreateListboxItem("tai_carrier",			"tai_carrier",				""), 
							CreateListboxItem("tai_destroyer",			"tai_destroyer",			""), 
							CreateListboxItem("tai_missiledestroyer",	"tai_missiledestroyer",		""), 
							CreateListboxItem("tai_heavycruiser",		"tai_heavycruiser",			""), 
							CreateListboxItem("tai_researchship",		"tai_researchship",			""), 
							CreateListboxItem("tai_resourcecollector",	"tai_resourcecollector",	""), 
							CreateListboxItem("tai_resourcecontroller",	"tai_resourcecontroller",	""), 
							CreateListboxItem("tai_cloakgenerator",		"tai_cloakgenerator",		""), 
							CreateListboxItem("tai_gravwellgenerator",	"tai_gravwellgenerator",	""), 
							CreateListboxItem("tai_probe",				"tai_probe",				""), 
							CreateListboxItem("tai_proximitysensor",	"tai_proximitysensor",		""), 
							CreateListboxItem("tai_sensorarray",		"tai_sensorarray",			""), 
				
							CreateListboxItem("tai_targetdrone",		"tai_targetdrone",			""), 
							CreateListboxItem("tai_fieldgenerator",		"tai_fieldgenerator",		""), 
							CreateListboxItem("tai_fieldgeneratordummy","tai_fieldgeneratordummy",	""), 
							CreateListboxItem("tai_researchstation",	"tai_researchstation",		""), 
							CreateListboxItem("tai_HeadshotAsteroid",	"tai_HeadshotAsteroid",		""), 

						},
					},	

					{
						type = "DropDownListBox",	
						name = "hw1_misc_listbox",
						Layout = {	
							size_WH = {	w = .45, h = 24.0, wr = "par", hr = "px" },
						},	
						selected = 0,
						visible = 0,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "hw1_misc_units",
							width = 242,
							;
							CreateListboxItem("kad_swarmer",			"kad_swarmer",				""), 
							CreateListboxItem("kad_advancedswarmer",	"kad_advancedswarmer",		""), 
							CreateListboxItem("kad_fuelpod",			"kad_fuelpod",				""), 
							CreateListboxItem("kad_multibeamfrigate",	"kad_multibeamfrigate",		""), 
							CreateListboxItem("kad_p2mothership",		"kad_p2mothership",			""), 
				
							CreateListboxItem("tur_fighter",			"tur_fighter",				""), 
							CreateListboxItem("tur_missilecorvette",	"tur_missilecorvette",		""), 
							CreateListboxItem("tur_standardcorvette",	"tur_standardcorvette",		""), 
							CreateListboxItem("tur_ionarrayfrigate",	"tur_ionarrayfrigate",		""), 
							CreateListboxItem("tur_p1mothership",		"tur_p1mothership",			""), 
				
							CreateListboxItem("Der_RepairCorvette",		"Der_RepairCorvette",		""), 
							CreateListboxItem("Der_MinelayerCorvette",	"Der_MinelayerCorvette",	""), 
							CreateListboxItem("Der_HeavyCorvette",		"Der_HeavyCorvette",		""), 
							CreateListboxItem("Der_MultiGunCorvette",	"Der_MultiGunCorvette",		""), 
							CreateListboxItem("Der_Shipwreck",			"Der_Shipwreck",			""), 
							CreateListboxItem("Der_GhostShip",			"Der_GhostShip",			""), 
							CreateListboxItem("Der_carrier",			"Der_carrier",				""), 
							CreateListboxItem("Der_carriernew",			"Der_carriernew",			""), 

							CreateListboxItem("junk_junkyarddog",		"junk_junkyarddog",			""), 
							CreateListboxItem("junk_autoguns",			"junk_autoguns",			""), 
							CreateListboxItem("junk_autogunl",			"junk_autogunl",			""), 
							CreateListboxItem("junk_junkyardoffice",	"junk_junkyardoffice",		""), 

							CreateListboxItem("Misc_T-MatMegaship",		"Misc_T-MatMegaship",		""), 				
							CreateListboxItem("Ben_BentusiExchange",	"Ben_BentusiExchange",		""), 
							CreateListboxItem("Ben_CargoBarge",	"Ben_CargoBarge",		""), 
						},
					},	
					{
						type = "DropDownListBox",	
						name = "hw2_misc_listbox",
						Layout = {	
							size_WH = {	w = .45, h = 24.0, wr = "par", hr = "px" },
						},	
						selected = 0,
						visible = 0,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "hw2_misc_units",
							width = 242,
							;
							CreateListboxItem("vgr_commstation",		"vgr_commstation",		""), 
							CreateListboxItem("kpr_sajuuk",				"kpr_sajuuk",			""),
							CreateListboxItem("kpr_destroyer",			"kpr_destroyer",			""), 
							CreateListboxItem("kpr_attackdroid",		"kpr_attackdroid",			""),
							CreateListboxItem("Kpr_DestroyerM10",		"Kpr_DestroyerM10",			""), 
							CreateListboxItem("Meg_Gehenna_1",			"Meg_Gehenna_1",			""), 
							CreateListboxItem("Meg_Chimera",			"Meg_Chimera",			""), 
							CreateListboxItem("Meg_Asteroid",			"Meg_Asteroid",			""), 
							CreateListboxItem("Meg_AsteroidMP",			"Meg_AsteroidMP",			""), 
							CreateListboxItem("Meg_Bentus",				"Meg_Bentus",			""), 
							CreateListboxItem("Vgr_PlanetKiller",		"Vgr_PlanetKiller",			""), 
							CreateListboxItem("Vgr_Mothership_Makaan",		"Vgr_Mothership_Makaan",			""), 
						},
					},	

					{
						type = "DropDownListBox",	
						name = "mp_misc_listbox",
						Layout = {	
							size_WH = {	w = .45, h = 24.0, wr = "par", hr = "px" },
						},	
						selected = 0,
						visible = 0,
						ignored = 1,
						ListBox = {
							backgroundColor = {0,0,0,255},
							name = "mp_misc_units",
							width = 242,
							;
							CreateListboxItem("meg_relic_rugenerator",			"meg_relic_rugenerator",	""), 
						},
					},	
				},
				---------------------- Action Button Frame

				-------------------------------------------------
				{
					type = "Frame",		
					Layout = {	
						pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
						size_WH = {	w = 1, h=1 ,wr = "par", hr="px"},	
						--pos_XY = { x = 1, y = 0, xr = "par", yr = "px" },
						--pivot_XY = {1, 0.0},
						--Flags = { hasVolume=0 },	
					},	

					arrangeSep = {	x=8, y=8, xr="px", yr="px",},
					name = "frame_LeftTabs",
					arrangetype = "horiz",
					autosize  = 1,
					;
					-- FightButton
					{
						type = "TextButton",
						name = "FightButton",

						autosize=1,
						Layout = {	
							size_WH = {	w = .48, h = 2, wr = "par", hr = "px" },								
						},
			
						buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",			
					
						Text = {
							text = "Fight",
							rel = 1080,
							minShrink = 0.25,
						},
						onMouseClicked = "Fight()",	
					
					},
					-- DestroyButton
					{
						type = "TextButton",
						name = "DestroyButton",

						autosize=1,
						Layout = {	
							size_WH = {	w = .48, h = 2, wr = "par", hr = "px" },								
						},
			
						buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",			
					
						Text = {
							text = "Destroy All",
							rel = 1080,
							minShrink = 0.25,
						},
						onMouseClicked = "DestroyAll()",	
					
					},

				},
				{
					type = "Frame",		
					Layout = {	
						pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
						size_WH = {	w = 1, h=1 ,wr = "par", hr="px"},	
						--pos_XY = { x = 1, y = 0, xr = "par", yr = "px" },
						--pivot_XY = {1, 0.0},
						--Flags = { hasVolume=0 },	
					},	

					arrangeSep = {	x=8, y=8, xr="px", yr="px",},
					name = "frame_LeftTabs",
					arrangetype = "horiz",
					autosize  = 1,
					;
					-- InstaFightButton
					{
						type = "TextButton",
						name = "InstaFightButton",

						autosize=1,
						Layout = {	
							size_WH = {	w = .48, h = 2, wr = "par", hr = "px" },								
						},
			
						buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",			
					
						Text = {
							text = "Insta-Fight",
							rel = 1080,
							minShrink = 0.25,
						},
						onMouseClicked = "InstaFight()",	
					
					},
					--Swap teams option
					{
						type = "TextButton",
						name = "SwapTeamsButton",

						autosize=1,
						Layout = {	
							size_WH = {	w = .48, h = 2, wr = "par", hr = "px" },								
						},
			
						buttonStyle = "FEButtonStyle1_Outlined",			
					
						Text = {
							text = "SwapSides",
							rel = 1080,
							minShrink = 0.25,
						},
						onMouseClicked = "SwapSides()",	
					
					},

				},
				{
					type = "Frame",		
					Layout = {	
						pad_RB  = { r = 0, b = 8, rr = "px", br = "px" },
						size_WH = {	w = 1, h=1 ,wr = "par", hr="px"},	
						--pos_XY = { x = 1, y = 0, xr = "par", yr = "px" },
						--pivot_XY = {1, 0.0},
						--Flags = { hasVolume=0 },	
					},	

					arrangeSep = {	x=8, y=8, xr="px", yr="px",},
					name = "frame_LeftTabs2",
					arrangetype = "horiz",
					autosize  = 1,
					;

					{

						type = "TimerControl",
						name = "BalanceFightTimer",

						timerStartOnLoad = 0,


						--marginWidth = 16,
						autosize=1,
						stateIconOfs = { 0.0, 0.0 },
						stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
						Layout = {			
							size_WH = {	w = .48, h = 1, wr = "par", hr = "px" },			
							pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
							pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
							--min_WH = {	w = NAVIGATION_BUTTON_WIDTH, wr = "scr"},	
						},

						BackgroundGraphic = MENU_BUTTON_GRAPHIC,
						--IconBase = MENU_BUTTON_GRAPHIC_SMALL,
		
						textColor					= COLOR_BUTTON_TEXT_DEFAULT,
						overTextColor				= COLOR_BUTTON_TEXT_HOVER,
						pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
						disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

						-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
						soundOnEnter 		= "SFX_ButtonEnter",
						soundOnClicked 		= "SFX_ButtonClick",
					
						backgroundColor = { 255, 0, 0, 255 },
						Text = 
						{
							text = "Fight Timer",
								font = "Blender",
								color = "RM_FETextBlueBright",
								vAlign = "Middle",
								hAlign = "Center",
								offset = {0, 0},
				
								pixels = (24),
								rel = 1080,
							hAlign = "Center",
							vAlign = "Center",	
							--pixels  = 18,
							--rel=0,
							minShrink = 1,
							--dropShadow = 1,
						},

					},

					{

						type = "TimerControl",
						name = "HandyTimer",
						timerStartOnLoad = 0,

						onMouseClicked = "CycleHandyTimer()",	

						--marginWidth = 16,
						autosize=1,
						stateIconOfs = { 0.0, 0.0 },
						stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
		
						
						Layout = {		
							size_WH = {	w = .48, h = 1, wr = "par", hr = "px" },	
							pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
							pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
							--min_WH = {	w = NAVIGATION_BUTTON_WIDTH, wr = "scr"},	
						},

						BackgroundGraphic = MENU_BUTTON_GRAPHIC,
						--IconBase = MENU_BUTTON_GRAPHIC_SMALL,
		
						textColor					= COLOR_BUTTON_TEXT_DEFAULT,
						overTextColor				= COLOR_BUTTON_TEXT_HOVER,
						pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
						disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,

						-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
						soundOnEnter 		= "SFX_ButtonEnter",
						soundOnClicked 		= "SFX_ButtonClick",
					
						backgroundColor = { 255, 0, 0, 255 },
						Text = 
						{
							text = "Click Me Timer",
								font = "Blender",
								color = "RM_FETextBlueBright",
								vAlign = "Middle",
								hAlign = "Center",
								offset = {0, 0},
				
								pixels = (24),
								rel = 1080,
							hAlign = "Center",
							vAlign = "Center",	
							--pixels  = 18,
							--rel=0,
							minShrink = 1,
							--dropShadow = 1,
						},

					},

				},
			},


			--------------- Player 2 stats column ------------
			{
				type = "Frame",		
				Layout = {			
					--min_WH = {	w = .1, h = 1.0, wr = "par", hr = "px" },			
					size_WH = {	w = 100, h = 1, wr = "px", hr = "par" },		
					pad_RB  = { r = 8, b = 0, rr = "px", br = "scr" },
					pad_LT  = { l = 8, t = 0, lr = "px", tr = "scr" },
					--Flags = { hasVolume=0 },	
				},
				name = "frame_leftplayer1stats",
				arrangetype = "vert",
				--autosize  = 1,
				arrangeSep = {	x=0, y=4, xr="px", yr="px",},
				--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKSIDELINES,
				;
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "p1",			
					Text = {
						text = "Player2",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	

				-- Spawn button P2
				{
					type = "TextButton",
					name = "spawnP2Button",

					helpTip =  "Spawn a single/batch of the selected P2 ship type",
					helpTipShift =  "Spawn 5 singles/batches of the selected P2 ship type",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P2 ship type",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },													
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "S2",
						rel = 1080,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,1)",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,5)",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,15)",	
				},
				-- Spawn button P2 Line Formation
				{
					type = "TextButton",
					name = "spawnP2ButtonBroad",

					helpTip =  "Spawn a single/batch of the selected P2 ship type in Broad",
					helpTipShift =  "Spawn 5 singles/batches of the selected P2 ship type in Broad",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P2 ship type in Broad",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .15, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Line",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,1,'broad')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,5,'broad')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,15,'broad')",	
				},
				-- Spawn button P2 X Formation
				{
					type = "TextButton",
					name = "spawnP2ButtonX",

					helpTip =  "Spawn a single/batch of the selected P2 ship type in X",
					helpTipShift =  "Spawn 5 singles/batches of the selected P2 ship type in X",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P2 ship type in X",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "X",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,1,'x')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,5,'x')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,15,'x')",	
				},
				-- Spawn button P2 Claw Formation
				{
					type = "TextButton",
					name = "spawnP2ButtonClaw",

					helpTip =  "Spawn a single/batch of the selected P2 ship type in Claw",
					helpTipShift =  "Spawn 5 singles/batches of the selected P2 ship type in Claw",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P2 ship type in Claw",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Claw",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,1,'movers')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,5,'movers')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,15,'movers')",	
				},
				-- Spawn button P2 Wall Formation
				{
					type = "TextButton",
					name = "spawnP2ButtonWall",
					
					helpTip =  "Spawn a single/batch of the selected P2 ship type in Wall",
					helpTipShift =  "Spawn 5 singles/batches of the selected P2 ship type in Wall",
					helpTipCtrl =  "Spawn 15 singles/batches of the selected P2 ship type in Wall",

					Layout = {	
						--size_WH = {	w = 20/800, h = STD_BUTTON_HEIGHT * .75, wr = "scr", hr = "scr" },								
					},	
					autosize=1,
					buttonStyle = "FEButtonStyle1_Outlined",			
					
					Text = {
						text = "Wall",
						rel = 1564,
						minShrink = 0.25,
					},
					onMouseClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,1,'wall')",	
					onMouseShiftClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,5,'wall')",	
					onMouseCtrlClicked = "SpawnUnitFromDropdownListBoxSelection('enemy',1,15,'wall')",	
				},

				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "EnemyCount",			
					Text = {
						text = "0",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "Player2BuildCost",			
					Text = {
						text = "0",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "Player2BuildTime",			
					Text = {
						text = "0",
						textStyle = "IGHeading1",
						hAlign = "Left",				
						color = "FEColorHeading3",
					},			
				},	
				{		        
					type = "TextLabel",
					--position = {2, -3},
					autosize=1,
					name = "Player2RunningHealth",			
					Text = {
						text = "0",
						font = "Heading3Font",
						vAlign = "Middle",
						hAlign = "Left",
						offset = {0, 0},			
						color = { 238, 255, 255, 255},
					},			
				},	
				-- Destroy Enemy Button
				{
					type = "TextButton",
					name = "DestroyP2",
					
					autosize=1,
					Layout = {	
						size_WH = {	w = 1, h = 2, wr = "par", hr = "px" },								
					},
			
					buttonStyle = "FEButtonStyle1_Alert_Outlined_Chipped",			
					
					Text = {
						text = "Nuke",
						rel = 1080,
						minShrink = 0.25,
					},
					onMouseClicked = "DestroyEnemy()",	
					
				},

			},


		},



	}