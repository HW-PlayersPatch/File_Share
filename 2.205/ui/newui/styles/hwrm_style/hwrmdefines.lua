dofilepath("data:ui/newui/DebugDefines.lua")


------------------------- HWRM Defines -------------------------

---------- GENERIC HELPER DEFINES -----------
-- Layout Helpers
LAYOUT_TOPLEFTSCREEN = { x = 0.0, y = 0.0, xr = "scr", yr = "scr" }	
LAYOUT_TOPLEFTPARENT = { x = 0.0, y = 0.0, xr = "par", yr = "par" }	
LAYOUT_TOPLEFT = { x = 0.0, y = 0.0, xr = "px", yr = "px" }	
LAYOUT_CENTERSCREEN = { x = 0.5, y = 0.5, xr = "scr", yr = "scr" }	
LAYOUT_CENTERPARENT = { x = 0.5, y = 0.5, xr = "par", yr = "par" }	

LAYOUT_FILLSCREEN = {	w = 1.0, h = 1.0, wr = "scr", hr = "scr"}		
LAYOUT_FILLPARENT = {	w = 1.0, h = 1.0, wr = "par", hr = "par"}	
LAYOUT_STRETCHWIDTHPARENT  = {	w = 1, h = 1, wr = "par", hr = "px"}	

------ Widths and Heights ---------------

TEXTINPUT_HEIGHT = 1/37					-- 480/13 
LISTBOXITEM_HEIGHT = 16/600				-- 480/13
LISTHEADER_HEIGHT = 1/28

STD_BUTTON_HEIGHT = 26/540		
STD_BUTTON_HEIGHT_UNBORDERED = 20/540	
FACILITY_BUTTON_HEIGHT = 20/540		

NAVIGATION_BUTTON_WIDTH = 128/960 
NAVIGATION_SMALL_BUTTON_WIDTH = 128/960 
NAVIGATION_SMALL_BUTTON_HEIGHT = 32/960 

INGAMEMENU_BUTTON_WIDTH = 160/960
MAINMENU_BUTTON_WIDTH = 320/960

DIALOGBOX_WIDTH = 320/960

TITLEBAR_HEIGHT = 24/600

STD_LABEL_HEIGHT = 24/540

TITLEBAR_BUTTON_WIDTH = 20/800
TITLEBAR_BUTTON_HEIGHT = 20/600

DROPDOWN_HEIGHT = LISTBOXITEM_HEIGHT + 4/600

ARROWBUTTON_HEIGHT = 16/600

EVENTBUTTON_HEIGHT = 12/600

SCROLLBAR_WIDTH = 16/600
SCROLLGRIP_MINHEIGHT = 24/600

QUEUE_ICON_WIDTH = 12/800

CONTEXTMENUITEM_HEIGHT = 16/600	

------- Spacings ------------
PANELTEXT_MARGIN_HEIGHT = 2/540
PANELTEXT_MARGIN_WIDTH = 2/960
PANEL_PAD_VERT = 4/540			-- How far the children are from the edges of a panel
PANEL_PAD_HORIZ = 4/800			-- How far the children are from the edges of a panel
PANELTITLE_HEIGHT = 18/540
PANEL_SPACING_VERT = 6/540		-- Vertical Spacing between Panels
PANEL_SPACING_HORIZ = 12/960	-- Horizontal Spacing between Panels

SCREEN_SAFE_X = 4/540		-- Safe amount away from sides of screen 
SCREEN_SAFE_Y = 8/960		-- Safe amount away from top and bottom of screen

BUTTON_TEXT_PAD_VERT = 4/540
BUTTON_TEXT_PAD_HORIZ = 12/960

BUTTON_SPACING_HORIZ = 12/960

TITLE_PAD_HORIZ = 2/800
TITLE_PAD_VERT = 2/600

LISTBOX_ITEM_PAD_HORIZ = 2/800
LISTBOX_ITEM_PAD_VERT = 2/600

BUILDPANEL_PAD_HORIZ = 8/800
BUILDPANEL_PAD_VERT = 8/600

LISTBOXITEM_ICON_PAD_HORIZ = 4/800

------------- COLORS -------------

COLOR_BLACK_SOLID = {0, 0, 0, 255}
COLOR_WHITE_SOLID = {255, 255, 255, 255}
COLOR_RED_SOLID = {255, 0, 0, 255}
COLOR_GREEN_SOLID = {0, 255, 0, 255}
COLOR_BLUE_SOLID = {0, 0, 255, 255}
COLOR_PURPLE_SOLID = {255, 0, 255, 255}
COLOR_YELLOW_SOLID = {255, 255, 0, 255}

COLOR_FULLSCREEN_DARKEN = {0, 0, 0, 180}    -- FEColorBackground2
COLOR_BACKGROUND_SCREEN = {5, 14, 16, 178}	-- FEColorBackground1
COLOR_BACKGROUND_PANEL = {5, 14, 16, 178}	-- FEColorBackground1
COLOR_BACKGROUND_SUBPANEL = {5, 14, 16, 100}	-- FEColorBackground1
COLOR_BACKGROUND_DIALOG = {0, 25, 25, 70}	-- FEColorDialog
COLOR_BACKGROUND_POPUP = {0, 0, 0, 70}     
COLOR_BACKGROUND_HEADER = {27, 69, 85, 128}

COLOR_TEXT_TITLEBAR = {195, 246, 235, 255}
COLOR_TEXT_SUBTITLE = {106, 138, 133, 255}

------ Button Colors
COLOR_BUTTON_BGRD_DISABLED = {27, 69, 85, 255}
COLOR_BUTTON_BGRD_DEFAULT =	{27, 69, 85, 255}
COLOR_BUTTON_BGRD_HOVER = {55, 106, 117, 255}
COLOR_BUTTON_BGRD_CLICKED = {92, 209, 229, 255}
COLOR_BUTTON_BGRD_PRESSEDDEFAULT = {92, 209, 229, 255}
COLOR_BUTTON_BGRD_PRESSEDHOVER = {92, 209, 229, 255}
COLOR_BUTTON_BGRD_PRESSEDCLICKED = {92, 209, 229, 255}
COLOR_BUTTON_BGRD_FLASH = {80, 182, 200, 255}

COLOR_BUTTON_ALERT_BGRD_DISABLED = {105, 93, 88, 255}
COLOR_BUTTON_ALERT_BGRD_DEFAULT =	{108, 31, 0, 255}
COLOR_BUTTON_ALERT_BGRD_HOVER = {255, 106, 35, 255}
COLOR_BUTTON_ALERT_BGRD_PRESSED = {255, 106, 35, 255}


COLOR_BUTTON_TEXT_DISABLED = {0, 0, 0, 255}
COLOR_BUTTON_TEXT_DEFAULT =	{195, 246, 235, 255}
COLOR_BUTTON_TEXT_HOVER = {255, 255, 255, 255}
COLOR_BUTTON_TEXT_PRESSED = {255, 255, 255, 255}

COLOR_LABEL_TEXT_DISABLED = {60, 60, 60, 255}
COLOR_LABEL_TEXT_DEFAULT = {224, 255, 255, 255}

------------------- List Item Defines ---------------------
COLOR_LISTITEM_TITLEBAR = {11, 28, 35, 255}
COLOR_LISTITEM_TITLEBAR_COMPLETED = {14, 33, 40, 255}
COLOR_LISTITEM_TITLEBAR_TEXT = COLOR_TEXT_TITLEBAR
COLOR_LISTITEM_SELECTED = {83, 133, 142, 255}
COLOR_LISTITEM_SELECTHOVER = {105, 165, 178, 255}
COLOR_LISTITEM_HOVER = {23, 59, 72, 255}
COLOR_LISTITEM_DISABLED = {32, 40, 40, 64}
COLOR_LISTITEM = {10, 11, 13, 64}

------------------- ScrollBar Defines ---------------------

COLOR_SCROLLGRIP_BORDER_DEFAULT = {77, 86, 81, 255}
COLOR_SCROLLGRIP_BORDER_HOVER = {94, 114, 103, 255}
COLOR_SCROLLGRIP_BORDER_PRESSED = {200, 220, 221, 255}

COLOR_SCROLLGRIP_DEFAULT = {24, 34, 33, 255}
COLOR_SCROLLGRIP_HOVER = {94, 114, 103, 255}
COLOR_SCROLLGRIP_PRESSED = {140, 162, 148, 255}

COLOR_SCROLLBAR_DEFAULT = {24, 34, 33, 200}

COLOR_SCROLLARROW_BACK_DEFAULT = {94, 114, 103, 255}
COLOR_SCROLLARROW_BACK_HOVER = {140, 162, 148, 255}
COLOR_SCROLLARROW_BACK_PRESSED = {180, 211, 200, 255}


------------------- SCREEN SPECIFIC COLORS ----------------
COLOR_SHIP_ITEMDEFAULTCOLOR = {184, 255, 242, 128}
COLOR_SHIP_ITEMOVERCOLOR = {0, 175, 255, 50}
COLOR_SHIP_ITEMPRESSEDCOLOR = {78, 199, 255, 100}

------------------- Label Defines ---------------------
COLOR_LABEL_TITLETEXT = {240, 240, 255, 255}
COLOR_LABEL_VALUETEXT = {255, 255, 255, 255}

------------------- Tab Color Defines ------------------
COLOR_TAB_BACKGROUND_DEFAULT	= {27, 69, 85, 64}
COLOR_TAB_BACKGROUND_HOVER		= COLOR_BUTTON_BGRD_DEFAULT
COLOR_TAB_BACKGROUND_PRESSED	= COLOR_SHIP_ITEMPRESSEDCOLOR
COLOR_TAB_BORDER_DEFAULT		= COLOR_BUTTON_BGRD_HOVER
COLOR_TAB_BORDER_HOVER			= COLOR_BUTTON_BGRD_HOVER
COLOR_TAB_BORDER_PRESSED 		= {0,0,0,0}

------------------- Context Menu Defines ------------------
COLOR_CONTEXTMENU_BORDER	= {77, 86, 81, 255}
COLOR_CONTEXTMENU_BGRD = {5, 14, 16, 200}
COLOR_CONTEXTMENU_BGRD_TRANSLUCENT = {5, 14, 16, 150}
COLOR_CONTEXTMENUITEM_HOVER = COLOR_LISTITEM_HOVER
COLOR_CONTEXTMENUITEM_PRESSED = {195, 246, 235, 255}
COLOR_CONTEXTMENU_TEXT_DEFAULT = COLOR_BUTTON_TEXT_DEFAULT

------------------- Menu Strip Defines ------------------
COLOR_MENUSTRIP_BGRD = {20, 20, 20, 176}

------------- GRAPHICS -------------
BORDERIMAGE = "Data:UI\\NewUI\\Styles\\HWRM_Style\\Panel_BordersAndExtras.tga"
IMG_BORDERS_W = 256
IMG_BORDERS_H = 512
RES_SCALE = 500

BORDER_GRAPHIC_FRAME = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 4/512, 252/256, 24/512 },
	patch_X = { 4/4, -240/4, 4/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,						
}


BORDER_GRAPHIC_BOTTOM = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 12/512, 252/256, 24/512 },
	patch_X = { 4/4, -240/4, 4/4, 0 },
	patch_Y = { -4/4,8/8, 0 },
	patch_ResScale = RES_SCALE,							
}

BORDER_GRAPHIC_BUTTON_OUTLINE = {
	--type = "Graphic",
	--texture = "Data:UI\\NewUI\\Styles\\HWRM_Style\\LineDecorations.tga",
	--uvRect = { 4/32, 4/128, 28/32, 48/128 },
	--patch_X = {  8/4, -8/4, 8/4, 0 },
	--patch_Y = { 8/4, -4/4, 8/4,-4/4, 8/4, -4/4, 8/4,  0 },
	--patch_ResScale = RES_SCALE,	
	--patch_Scale = 1,				
	size = {0, 0},
    texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
    uvRect = { 17/32, 1/32, 32/32, 16/32 },
    patch_X = { 2, -11, 2, 0 },
    patch_Y = { 7, -1, 7, 0 },
    patch_ResScale = RES_SCALE,
		
}

BORDER_GRAPHIC_FRAME2 = {
	type = "Graphic",
	texture = "Data:UI\\NewUI\\Styles\\LineDecorations.tga",
	uvRect = { 0/32, 0/128, 32/32, 32/128 },
	patch_X = {  9, -14, 9, 0 },
	patch_Y = { 15, -2, 15,  0 },
	patch_Scale = 1,						
}
		
BORDER_GRAPHIC_TOPFRAME = {
	type = "Graphic",
	texture = "Data:UI\\NewUI\\Styles\\LineDecorations.tga",
	--size = {40,16},
	uvRect = { 0/32, 88/128, 32/32, 104/128 },
	patch_X = {  9, -14, 9, 0 },
	patch_Y = { 15, -1,  0 },
	patch_Scale = 1,						
}

BORDER_GRAPHIC_BUILDFRAME = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 190/512, 40/256, 210/512 },
	patch_X = { 16/4, -4/4, 16/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,							
}

BORDER_GRAPHIC_BUILDFRAME_PAD = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 190/512, 40/256, 210/512 },
	patch_X = { 16/4, -4/4, 16/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_PadX = { 3, -3 },
	patch_PadY = { 1, -1 },
	patch_ResScale = RES_SCALE,							
}

BORDER_GRAPHIC_BUILDFRAME_THIN = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 218/512, 40/256, 238/512 },
	patch_X = { 16/4, -4/4, 16/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,
}

BORDER_GRAPHIC_BUILDFRAME_HORIZ = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 246/512, 40/256, 266/512 },
	patch_X = { 16/4, -4/4, 16/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,
}

BORDER_GRAPHIC_FRAME_THICKSIDELINES = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 44/256, 190/512, 64/256, 210/512 },
	patch_X = { 8/4, -4/4, 8/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,							
}

BORDER_GRAPHIC_FRAME_THICKTB_THINLR = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 44/256, 218/512, 80/256, 238/512 },
	patch_X = { 16/4, -4/4, 16/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,							
}


BORDER_GRAPHIC_FRAME_LEFTLINE = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 44/256, 190/512, 56/256, 210/512 },
	patch_X = { 8/4, -4/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,							
}


BORDER_GRAPHIC_FRAME_RIGHTLINE = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 52/256, 190/512, 64/256, 210/512 },
	patch_X = { -4/4, 8/4, 0 },
	patch_Y = { 8/4, -4/4, 8/4, 0 },
	patch_ResScale = RES_SCALE,							
}

------------- PANEL Filigree -------------
TOP_GRAPHIC_FILIGREE_CLOSEICON = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 28/512, 252/256, 84/512 },
	patch_X = { 44/4, -96/4, 108/4, 0 },
	patch_Y = { -4/4,-48/4,-4/4 },
	patch_ResScale = RES_SCALE,				
}

TOP_GRAPHIC_FILIGREE_1 = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 28/512, 188/256, 84/512 },
	patch_X = { 44/4, -96/4, 44/4, 0 },
	patch_Y = { -4/4,-48/4,-4/4 },
	patch_ResScale = RES_SCALE,				
}


TOP_GRAPHIC_FILIGREE_FRAME_BOTTOM_1 = {
	type = "Graphic",
	texture = BORDERIMAGE,
	uvRect = { 4/256, 28/512, 252/256, 84/512 },
	patch_X = { 44/4, -96/4, 44/4, -64/4, 0 },
	patch_Y = { -1, -6, 2, -6, -1 },
	patch_ResScale = RES_SCALE,				
}


-------------------------------------- TEMPLATE DEFINES ------------------------------------------

---------- Surfaces ----------
STD_BUTTON_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_BGRD_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_BGRD_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_BGRD_CLICKED },
			{ prop = "tint_d", float4 = COLOR_BUTTON_BGRD_FLASH },
			}

STD_BUTTON_ALERT_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_ALERT_BGRD_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_ALERT_BGRD_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_ALERT_BGRD_PRESSED },
			{ prop = "tint_d", float4 = { 255.0, 0.0, 0.0, 255.0 } },
			}

STD_BUTTON_BORDER_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_TEXT_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_TEXT_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_TEXT_PRESSED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
			}

STD_ARROW_BUTTON_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_TEXT_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_TEXT_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_TEXT_PRESSED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
			}

STD_ARROW_BUTTON_DARK_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BLACK_SOLID },
			{ prop = "tint_1", float4 = COLOR_BLACK_SOLID },
			{ prop = "tint_2", float4 = COLOR_BLACK_SOLID },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
			}

STD_ARROW_BUTTON_BACK_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_SCROLLARROW_BACK_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_SCROLLARROW_BACK_HOVER },
			{ prop = "tint_2", float4 = COLOR_SCROLLARROW_BACK_PRESSED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
			}

STD_EVENT_BUTTON_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_TEXT_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_TEXT_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_TEXT_PRESSED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
			}

FACILITY_BUTTON_SURFACE = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_TEXT_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_TEXT_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_TEXT_PRESSED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 }  },
			}

----------- TEXT TEMPLATES -----------
T_Text_TitleBar = {
		type = "Text",
		font = "Blender",
		color = COLOR_TEXT_TITLEBAR,
		vAlign = "Center",
		hAlign = "Left",
		dropShadow = 1,
		offset = {0, 0},
		pixels = (26*2),
		rel = 2160,
	}


	------- Button Graphics -------
	MENU_BUTTON_GRAPHIC_SMALL = {
             
		size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
        uvRect = { 1/32, 1/32, 16/32, 16/32 },
        patch_X = { 7, -1, 7, 0 },
        patch_Y = { 7, -1, 7, 0 },
        patch_ResScale = RES_SCALE,
			
		Surface = STD_BUTTON_SURFACE,
	}


	MENU_BUTTON_GRAPHIC_SMALL_CHIPPED = {
             
		size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
        uvRect = { 1/32, 17/32, 16/32, 32/32 },
        patch_X = { 7, -1, 7, 0 },
        patch_Y = { 7, -1, 7, 0 },
        patch_ResScale = RES_SCALE,
			
		Surface = STD_BUTTON_SURFACE,
	}

	MENU_BUTTON_ALERT_GRAPHIC_SMALL_CHIPPED = {
             
		size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
        uvRect = { 1/32, 17/32, 16/32, 32/32 },
        patch_X = { 7, -1, 7, 0 },
        patch_Y = { 7, -1, 7, 0 },
        patch_ResScale = RES_SCALE,
			
		Surface = STD_BUTTON_ALERT_SURFACE,
	}

	MENU_BUTTON_GRAPHIC = {
	
        size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
        uvRect = { 5/32, 5/32, 12/32, 12/32 },
        patch_X = { 3, -1, 3, 0 },
        patch_Y = { 3, -1, 3, 0 },
        patch_ResScale = RES_SCALE,
		
		Surface = STD_BUTTON_SURFACE,
	}

	MENU_BUTTON_GRAPHIC_CHIPPED = {
	
        size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
        uvRect = { 5/32, 21/32, 12/32, 28/32 },
        patch_X = { 3, -1, 3, 0 },
        patch_Y = { 3, -1, 3, 0 },
        patch_ResScale = RES_SCALE,
		
		Surface = STD_BUTTON_SURFACE,
	}

	MENU_BUTTON_ALERT_GRAPHIC_CHIPPED = {
	
        size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttons.dds",
        uvRect = { 5/32, 21/32, 12/32, 28/32 },
        patch_X = { 3, -1, 3, 0 },
        patch_Y = { 3, -1, 3, 0 },
        patch_ResScale = RES_SCALE,
		
		Surface = STD_BUTTON_ALERT_SURFACE,
	}

	MENU_BUTTON_BORDER_GRAPHIC = {
	
        size = {0, 0},
        texture = "DATA:UI\\NewUI\\Examples\\Textures\\ui_4kbuttonsBorders.tga",
        uvRect = { 5/32, 5/32, 12/32, 12/32 },
        patch_X = { 3, -1, 3, 0 },
        patch_Y = { 3, -1, 3, 0 },
        patch_ResScale = RES_SCALE,
		
		Surface = STD_BUTTON_BORDER_SURFACE,
	}

	---------------------------------------

    MENU_RADIOBUTTON_GRAPHIC = {
	
		texture = "DATA:UI\\NewUI\\Elements\\ui_newcheck.tga",
		uvRect = { 1/32, 0/128, 31/32, 16/128 },
		patch_X = { 15, -14, 1, 0 },
		patch_Y = { -1, 14, -1, 0 },
		patch_PadX = { 15, -1 },
		patch_PadY = { 1, -1 },
		patch_ResScale = RES_SCALE,
		
		Surface = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_TEXT_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_TEXT_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_TEXT_PRESSED },
			{ prop = "tint_d", float4 = { 255.0, 0.0, 0.0, 255.0 } },
		}
	}        

	MENU_COMMANDBUTTON_GRAPHIC = {	
			
		texture = "data:ui\\NewUI\\Styles\\HWRM_Style\\command_button.tga",
		uvRect = { 4/64, 4/512, 60/64, 60/512 },
		patch_X = { 8/4, -40/4, 8/4,0 },
		patch_Y = { 8/4, -40/4, 8/4,0 },
		patch_Scale = 1,

		Surface = {
			surface = "ui_multistate";
			{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},

	}     
	   
	MENU_TABBUTTON_GRAPHIC = {	
			
		texture = "data:ui\\NewUI\\Styles\\HWRM_Style\\tab_button.tga",
		uvRect = { 4/64, 4/512, 60/64, 60/512 },
		patch_X = { 8/4, -40/4, 8/4,0 },
		patch_Y = { 8/4, -40/4, 8/4,0 },
		patch_Scale = 1,

		Surface = {
			surface = "ui_multistate";
			{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},

	}      

	MENU_TABBUTTON_LEFT_VERT_GRAPHIC = {	
			
		texture = "data:ui\\NewUI\\Styles\\HWRM_Style\\tab_left_vert_button.tga",
		uvRect = { 4/64, 4/512, 60/64, 60/512 },
		patch_X = { 8/4, -40/4, 8/4,0 },
		patch_Y = { 8/4, -40/4, 8/4,0 },
		patch_Scale = 1,

		Surface = {
			surface = "ui_multistate";
			{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			},

	}      

	MENU_SCROLLGRIP_BORDER_GRAPHIC = {	
			
			size = {15, 11},
			texture = "DATA:UI\\NewUI\\Styles\\ScrollGripHorz.tga",
			uvRect = { 4/64, 4/64, 60/64, 60/64 },
			patch_X = { 8/4,-40/4,8/4,0 },
			patch_Y = { 8/4,-40/4,8/4,0 },
			patch_ResScale = RES_SCALE,

			Surface =  {
				surface = "ui_multistate_tint";
				{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				{ prop = "tint_0", float4 = COLOR_SCROLLGRIP_BORDER_DEFAULT },
				{ prop = "tint_1", float4 = COLOR_SCROLLGRIP_BORDER_HOVER },
				{ prop = "tint_2", float4 = COLOR_SCROLLGRIP_BORDER_PRESSED },
				{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
			},
	}       
	MENU_SCROLLGRIP_GRAPHIC = {	
			
		size = {15, 11},
		texture = "DATA:UI\\NewUI\\Styles\\white.tga",
		uvRect = { 4/64, 4/64, 60/64, 60/64 },
		patch_X = { 8/4,-40/4,8/4,0 },
		patch_Y = { 8/4,-40/4,8/4,0 },
		patch_ResScale = RES_SCALE,

		Surface =  {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_SCROLLGRIP_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_SCROLLGRIP_HOVER },
			{ prop = "tint_2", float4 = COLOR_SCROLLGRIP_PRESSED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
		},
	}       

	---------------------------------------------------------------------------------------------




	----------------------------------RM Control Templates-------------------------------------------
	
	PROPERTYGRID_DEFAULTSTYLE = {
		type = "PropertyGrid",
		NameLabel = "NameLabelText",
		TypeLabel = "TypeLabelText",
		arrangetype="vert",
		borderWidth = 1,
		--borderColor = {255,0,255,255},	
		;
		{
			type = "TextLabel",
			name = "NameLabelText",

			Layout = {	
				pos_XY = { x=.5, y = 0,  xr="par", yr = "px" },			
				pivot_XY = { .5,  0 },	
			},
			autosize=1,							
			Text = {					
				UseTemplate = T_Text_TitleBar,
				text = "",
			},
		},
		{
			type = "TextLabel",
			name = "TypeLabelText",

			Layout = {	
				pos_XY = { x=.5, y = 0,  xr="par", yr = "px" },			
				pivot_XY = { .5,  0 },	
			},
			autosize=1,							
			Text = {					
				UseTemplate = T_Text_TitleBar,
				text = "",
			},
		},
		-- Listbox
		{
			type = "ListBox",
			name = "PropertyListbox",
			listBoxStyle = "FEListBoxStyle_Bordered",

			Layout = {						
				size_WH = { w = 1, h = 200, wr = "par", hr = "px" },
			},
			
			scrollBarPageSize = 76,
			scrollBarStepSize = 13,
			
			maxItems = 64,
		},


		-- Editable item to clone
		{
			type = "PropertyGridListBoxItem",
			name = "LabelItem",
			Layout = {							
			--	margin_LT = { l = 0, t = PANEL_PAD_VERT/2, lr = "scr", tr = "scr" },	
			},
			--size = {_width - SBARSPACE, 19},
			NameLabel = "m_label",
			ValueEditor = "m_textedit",

			autosize = 1,
			visible = 0,
			ignored = 1,
			resizeToListBox = 1,
			--pressedColor = {255,255,255,50},
			arrangetype = "horiz",
			;
			{
				type = "TextLabel",
				name = "m_label",
				Layout = {	
					size_WH = { w = .5, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },

				},

				Text = {
					textStyle = "FEListBoxItemTextStyle",
					text = "Playon",
				},
				--backgroundColor = {255,0,0,255},
			},
		
			{
				type = "TextInput",
				name = "m_textedit",
				textInputStyle = "FETextInputStyle",
				--buttonStyle = "FEButtonStyle1NoEnterSound",
				--width = KEYBTNWIDTH,
				Layout = {	
					size_WH = { w = .5, h = STD_LABEL_HEIGHT, wr = "par", hr = "scr" },
					--pivot_XY = { 0.0, 0.5 },
					--pos_XY = {	y=0.5, yr="par",},		
				},
				--position = {_width - KEYBTNWIDTH - 2 - SBARSPACE, 0},
				Text = {
					font = "ButtonFont",
					color = {255,255,255,255},
					vAlign = "Middle",
					hAlign = "Center",
				},
				helpTipTextLabel = "m_lblHelpText",
				helpTip = "$5184", -- "CLICK TO REASSIGN KEY",
			}
		},

	}



	----------Window Templates-----------
	PANEL_WINDOWSTYLE = {
		type = "RmWindow",
		name = "RM_Panel_WindowStyle",		
		
		--visible = 0,
		
		Layout = {
			--pos_XY = {	x = 0, y = 0, xr = "par",	yr = "par"	},	
			--size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
			min_WH = { w = 64, 	h = 64,	wr = "abs_px",	hr = "abs_px" },					
		},

		backgroundColor = COLOR_BACKGROUND_SCREEN,
		BackgroundGraphic = BORDER_GRAPHIC_FRAME,	

		ContentAreaName = "Content",
		TitleTextName = "TitleText",
		DragItemName = "DragTitle",
		CloseButtonName = "CloseButton",
		MinimizeButtonName = "MinimizeButton",
		MenuStripContainerName = "RMMenuStripContainer",
		
		MinimizedElement = "btnBalanceScreen",


		arrangetype = "vert",
		;			
		----------Title Area-----------
		{
			type = "Frame",
			name = "TitleFrame",
			visible = 1,
			arrangetype = "horiz",
			arrangedir = 1,

			Layout = {				
				size_WH = {	w = 1, h = PANELTITLE_HEIGHT, wr = "par", hr = "scr" },	
				pad_LT = { l = PANELTEXT_MARGIN_WIDTH, t = 0, lr = "scr", tr = "px" },
				--pad_RB = { r = 12, b = 0, rr = "px", br = "px" },							
			},
			BackgroundGraphic = BORDER_GRAPHIC_BOTTOM,
			;
			{
				type = "TextLabel",
				name = "TitleText",

				Layout = {	
					pos_XY = { x=0, y = .5,  xr="px", yr = "par" },			
					pivot_XY = { 0,  .5 },	
				},
				autosize=1,							
				Text = {					
					UseTemplate = T_Text_TitleBar,
					text = "",
				},
			},
			{
				type = "Frame",
				name = "TitleFiligree",						
				BackgroundGraphic = TOP_GRAPHIC_FILIGREE_1,
				--backgroundColor = COLOR_BLUE_SOLID,				
				Layout = {
					size_WH = { w = 1, h = 1, wr = "px", hr = "par" },
				},

				arrangeweight = 1,
				;
			},

			{
				type = "DragHandle",
				name = "DragTitle",						
				dragType = "pos",
				--screenBound = 1,
				parentBound=1,
							
				Layout = {
					size_WH = { w = 1, h = 1, wr = "par", hr = "par" },
					Flags = {
						hasVolume = 0,
						canArrange = 0,
					},
				},
				;
			},
			-------------------
			{
				type = "Frame",
				name = "TitleBarButtonsFrame",						

				arrangetype="horiz",
				Layout = {
					size_WH = { w = 1, h = 1, wr = "px", hr = "par" },
					pivot_XY = { 1.0, 0.0 },
					pos_XY = {	x=1, xr="par",},	
					
				},
				autosize=1,
				arrangeSep = {	x=4, y=0, xr="px", yr="scr",},	
				;
				-- Minimize
				{
					type = "Button",
					name = "MinimizeButton",
					visible = 0,
					ignored = 1,

					Layout = {		
						size_WH = {	w = 10000.0, h = .8, wr = "px", hr = "par" },	
						pos_XY = {	y = .5, yr = "par" },
						pivot_XY = { 0.0, 0.5 },						
						lockAspect=1,		
					},	

					BackgroundGraphic = {
						size = { 8, 8},
						texture = "DATA:\\UI\\NewUI\\Elements\\titlebar_minimize.tga",
						uvRect = { 0, 1, 1, 0 },	
					},
					overColor = COLOR_CONTEXTMENUITEM_HOVER,
					pressedColor = COLOR_CONTEXTMENUITEM_PRESSED,
				},

				-- Close
				{
					type = "Button",
					name = "CloseButton",
					visible = 0,
					ignored = 1,

					Layout = {		
						size_WH = {	w = 10000.0, h = .8, wr = "px", hr = "par" },	
						pos_XY = {	y = .5, yr = "par" },
						pivot_XY = { 0.0, 0.5 },						
						lockAspect=1,		
					},	
					--backgroundColor = {0,255,0,128},	

					BackgroundGraphic = {
						size = { 8, 8},
						texture = "DATA:\\UI\\NewUI\\Elements\\titlebar_close.tga",
						uvRect = { 0, 1, 1, 0 },	
					},
					overColor = COLOR_CONTEXTMENUITEM_HOVER,
					pressedColor = COLOR_CONTEXTMENUITEM_PRESSED,
				},



			},




		},

		----------MenuStrip Container-----------
		{	
			type = "Frame",
			name = "RMMenuStripContainer",
			Layout = {	
				size_WH = {w = 1.0,	h = 24.0,wr = "par",	hr = "px"	},		
			},	
			visible=0,
			ignored=1,
			--backgroundColor = {0,0,255,255},
		;
		},

		----------Content Area-----------
		{	
			type = "Frame",
			name = "Content",

			Layout = {	
				--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {w = 1.0,	h = 1.0,wr = "par",	hr = "px"	},		
				pad_LT = { l =12, t = 12, lr = "px", tr = "px" },
				pad_RB = { r = 12, b = 12, rr = "px", br = "px" },		
			},	
			arrangeweight = 1,
			UINavSelectable = 1, 
			--backgroundColor = {128,0,0,255},
		;
		}

}
-----------------------------------------------------------------------------------------------
	----------Navigation Frame Templates-----------
PANEL_NAVIGATIONFRAME = {
	type = "RmWindow",
	name = "RM_Panel_NavigationStyle",		
		
	Layout = {
		margin_LT = { l = 0, t = PANEL_SPACING_VERT, lr = "scr", tr = "scr" },
		pad_LT = { l = PANEL_PAD_HORIZ, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
		pad_RB = { r = PANEL_PAD_HORIZ, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },						
		size_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },	
	},

	backgroundColor = COLOR_BACKGROUND_SCREEN,
	BackgroundGraphic = BORDER_GRAPHIC_FRAME,	
	autosize=1,
	ContentAreaName = "Content",
	TitleTextName = "",   --This frame doesn't have a title		
	;			
		
	----------Content Area-----------
	{	
		type = "Frame",
		name = "Content",
		Layout = {	
			min_WH = {	w = 1.0, h = 1.0, wr = "par", hr = "px" },		
		},	
		arrangetype = "horiz",
		autosize=1,
	;
	}
}




	SCREENHEADER_WINDOWSTYLE = {
		type = "RmWindow",
		name = "RM_Screen_WindowStyle",		
		
		--visible = 0,
		
		Layout = {
			--pos_XY = {	x = 0, y = 0, xr = "par",	yr = "par"	},	
			--size_WH = {	w = 1, h = 1, wr = "par", hr = "par" },		
			min_WH = { w = 64, 	h = 64,	wr = "abs_px",	hr = "abs_px" },					
		},

		--backgroundColor = COLOR_BACKGROUND_SCREEN,
		--BackgroundGraphic = BORDER_GRAPHIC_FRAME,	

		ContentAreaName = "Content",
		TitleTextName = "txtLblTITLE",
		SubTitleTextName = "txtLblSUBTITLE",
		ExtraText1Name = "txtLblExtra1",

		arrangetype = "vert",
		;			
		----------Title Area-----------
		{
			type = "Frame",
			name = "ModeTitlePanel",
			visible = 1,

			Layout = {					
				size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},	
				pos_XY = LAYOUT_TOPLEFTSCREEN,
				pad_LT = { l = PANEL_PAD_HORIZ*4, t = PANEL_PAD_VERT, lr = "scr", tr = "scr" },
				pad_RB = { r =PANEL_PAD_HORIZ/2, b = PANEL_PAD_VERT, rr = "scr", br = "scr" },			
			},
			autosize=1,		
			
			arrangetype = "horiz",
			arrangedir = 1,
			--backgroundColor = { 255, 128, 0, 255 },	
			--BackgroundGraphic = BORDER_GRAPHIC_BOTTOM,
			;
			{
				type = "Frame",
				name = "TitleFrame",
				BackgroundGraphic = BORDER_GRAPHIC_FRAME_RIGHTLINE,
				Layout = {	
					pad_RB = { r =PANEL_PAD_HORIZ*4, b = 0, rr = "scr", br = "scr" },			
				},
				autosize=1,
				--backgroundColor = { 255, 128, 128, 255 },	
				;
				--DEFINITION FOR: (txtLbl) TITLE
				{
					type = "TextLabel",
					name = "txtLblTITLE",
					autosize=1,
					Text = {
						--UseTemplate = T_WindowSuperHeader,
						textStyle = "FEHeading1",
						text = "",		
						pixels = (90),
						color = "RM_FETextBlueBright",
						vAlign = "Bottom",
						--typeFace = 2,
						rel = 2160,	
						},		
						
				},
			},

			{
				type = "Frame",
				name = "SubtitleFrame",
						
				Layout = {	
					pad_LT = { l = PANEL_PAD_HORIZ*4, t = 0, lr = "scr", tr = "scr" },	
					pad_RB = { r =0, b = PANEL_PAD_VERT/2, rr = "scr", br = "scr" },			
					pivot_XY = { 0, 1 },
					pos_XY = { x = 0, y = 1, xr = "px", yr = "par" },		
				},
				autosize=1,
				--backgroundColor = { 255, 0, 0, 255 },	
				;
				--DEFINITION FOR: (txtLbl) SUBTITLE
				{
					type = "TextLabel",
					name = "txtLblSUBTITLE",
					autosize=1,			
					Text = {
						text = "", -- HOST GAME / JOIN GAME
						textStyle = "FEHeading2",
						color = COLOR_TEXT_SUBTITLE,
						--color = "RM_FETextBlueBright",
						pixels = (40),
						--typeFace = 2,
						rel = 2160,	
					},
			
				},
			},
			{
				type = "Frame",
				name = "Extra1Frame",
				--BackgroundGraphic = BORDER_GRAPHIC_FRAME_RIGHTLINE,
				Layout = {	
					pad_RB = { r =PANEL_PAD_HORIZ*4, b = 0, rr = "scr", br = "scr" },	
					pivot_XY = { 1, 0.5 },					
					pos_XY = {	x=1, y=0.5, xr="par", yr="par",},				
				},
				autosize=1,
				--backgroundColor = { 255, 128, 128, 255 },	
				;
				--DEFINITION FOR: (txtLbl) TITLE
				{
					type = "TextLabel",
					name = "txtLblExtra1",
					autosize=1,
					Text = {
						--UseTemplate = T_WindowSuperHeader,
						textStyle = "FEHeading1",
						text = "",		
						pixels = (90),
						color = COLOR_BUTTON_ALERT_BGRD_HOVER,
						vAlign = "Bottom",
						--typeFace = 2,
						rel = 2160,	
						},		
						
				},
			},
		},
		----------Content Area-----------
		{	
			type = "Frame",
			name = "Content",
			Layout = {	
				--pos_XY = { x = 0.0, y = 0.0, xr = "par", yr = "par" },		
				size_WH = {w = 1.0,	h = 1.0,wr = "par",	hr = "px"	},		
				pad_LT = { l =12, t = 12, lr = "px", tr = "px" },
				pad_RB = { r = 12, b = 12, rr = "px", br = "px" },		
			},	
			arrangeweight = 1,
			--backgroundColor = {128,0,0,255},
		;
		}

}

DECO_GRID = {
		texture = "DATA:UI\\NewUI\\Styles\\white.tga",
		uvRect = { 0/32, 0/32, 32/32, 32/32 },
		--patch_Scale = 1,
		patch_AutoScale = 1,
		patch_Scale = 2,

		fill = "DATA:UI\\NewUI\\Styles\\HWRM_Style\\smallgrid.tga",
		scaleFill = {.75, .75},	

		Surface = {
			surface = "ui_multistate_tint";
			{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
			{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
			{ prop = "tint_0", float4 = COLOR_BUTTON_BGRD_DEFAULT },
			{ prop = "tint_1", float4 = COLOR_BUTTON_BGRD_HOVER },
			{ prop = "tint_2", float4 = COLOR_BUTTON_BGRD_CLICKED },
			{ prop = "tint_d", float4 = { 0.0, 0.0, 0.0, 0.0 } },
		},
	}

DECO_CAUTIONSTRIPE_ORANGE = {
			type = "Frame",	
			outerBorderWidth = DEBUG_DRAWBORDER,
			borderColor = {0,255,255,255},				
			
			Layout = {
					pivot_XY = { 0.0, 0.0 },
					
					pos_XY = {
						x = 0.0,
						y = 0.0,
						xr = "px",
						yr = "px",
					},
					
					size_WH = {
						w = 1,
						h = 16,
						wr = "par",
						hr = "px",
					},
			},

			backgroundColor = { 0, 0, 0, 100 },

			BackgroundGraphic = {
				texture = "DATA:UI\\NewUI\\Styles\\white.tga",
				uvRect = { 0/32, 0/32, 32/32, 32/32 },
				patch_X = { 3, -10, 3, 0 },
				patch_Y = { 5, -3, 8, 0 },
				--patch_PadX = {3, -3},
				--patch_PadY = {2, -2},
				patch_Scale = 1,
				patch_AutoScale = 1,
				patch_Scale = 1,
				fill = "DATA:UI\\NewUI\\Styles\\RM_CautionStripes.tga",

								
				Surface = {
					surface = "ui_multistate";
					{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
					{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
					{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
				},

			},
}


PREFAB_DRAGICON = {

				type = "DragHandle",
				dragType = "size",
				
				stateBaseOfs = { 0.0, 16/64 },
				stateBaseCells = { 1, 1, 1, 0, 3 },
				stateIconOfs = { 0.0, 16/64 },
				stateIconCells = { 0, 0, 0, 1, 1 },
				
				Layout = {
					pivot_XY = { 1.0, 1.0 },
					
					pos_XY = {
						x = 1.0,
						y = 1.0,
						xr = "par",
						yr = "par",
					},
					
					size_WH = {
						w = 32,
						h = 32,
						wr = "px",
						hr = "px",
					},
				},
				
				BackgroundGraphic = {
					size = {0, 0},
					texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
					uvRect = { 33/64, 1/64, 63/64, 15/64 },
					patch_X = { 6, -18, 6, 0 },
					patch_Y = { 5, -4, 5, 0 },
					patch_Scale = 1,
					patch_AutoScale = 1,
					
					fill = "DATA:UI\\NewUI\\Styles\\Fill_JaggedWhite.tga",
					
					Surface = {
						surface = "ui_multistate";
						{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
						{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
					},
				},
				
				IconBase = {
					size = {0, 0},
					texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
					uvRect = { 1/64, 1/64, 31/64, 15/64 },
					patch_X = { 6, -18, 6, 0 },
					patch_Y = { 5, -4, 5, 0 },
					patch_Scale = 1,
					patch_AutoScale = 1,
				},
			

	}

	PREFAB_SIZEDRAGICON = {

				type = "DragHandle",
				dragType = "size",
				
				stateBaseOfs = { 0.0, 16/64 },
				stateBaseCells = { 1, 1, 1, 0, 3 },
				stateIconOfs = { 0.0, 16/64 },
				stateIconCells = { 0, 0, 0, 1, 1 },
				
				Layout = {
					pivot_XY = { 1.0, 1.0 },
					
					pos_XY = {
						x = 1.0,
						y = 1.0,
						xr = "par",
						yr = "par",
					},
					
					size_WH = {
						w = 32,
						h = 32,
						wr = "px",
						hr = "px",
					},
				},
				
				BackgroundGraphic = {
					size = {0, 0},
					texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
					uvRect = { 33/64, 1/64, 63/64, 15/64 },
					patch_X = { 6, -18, 6, 0 },
					patch_Y = { 5, -4, 5, 0 },
					patch_Scale = 1,
					patch_AutoScale = 1,
					
					fill = "DATA:UI\\NewUI\\Styles\\Fill_JaggedWhite.tga",
					
					Surface = {
						surface = "ui_multistate";
						{ prop = "state0", float3 = { 0.0, 0.0, 1.0 } },
						{ prop = "state1", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "state2", float3 = { 0.0, 0.0, 0.0 } },
						{ prop = "decal", float3 = { 0.0, 0.0, 0.0 } },
					},
				},
				
				IconBase = {
					size = {0, 0},
					texture = "DATA:UI\\NewUI\\Styles\\Progress_Patched.dds",
					uvRect = { 1/64, 1/64, 31/64, 15/64 },
					patch_X = { 6, -18, 6, 0 },
					patch_Y = { 5, -4, 5, 0 },
					patch_Scale = 1,
					patch_AutoScale = 1,
				},
			

	}



	
	TEMPLATE_TABCONTROL = 
	{
		type = "TabControl",
		TabButtonStyle = 	"RM_ButtonTabStyle",
		arrangetype = "vert",
		autosize=0,
		;


		{
			type = "Frame",
			name = "TabButtonsFrame",
			autosize=1,
			arrangetype = "horiz",

			Layout = {	
				size_WH = {	w = 1.0, h = 32, wr = "par", hr = "px" },		
			},		

			;
		},
		
		{
			type = "Frame",
			name = "TabContentsFrame",
			backgroundColor = COLOR_BACKGROUND_PANEL,
			BackgroundGraphic = BORDER_GRAPHIC_BUILDFRAME_HORIZ,
			--TintGraphics = 1,
			arrangeweight = 1.0,
			--borderColor = "FEColorOutline",
			--outerBorderWidth = 2,

			Layout = {		
				size_WH = {	w = 1.0, h = 32, wr = "par", hr = "px" },		
			},	
			;
		},


	}


	TEMPLATE_MENUSTRIP = 
	{
		type = "MenuStrip",		
		arrangetype = "horiz",

		Layout = {			
			size_WH = {	w = 1.0, h = 1, wr = "par", hr = "par" },	
		},

		backgroundColor = COLOR_MENUSTRIP_BGRD,
		--BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKTB_THINLR,

		;
	}
	
	
	TEMPLATE_CONTEXTMENU = 
	{
		type = "ContextMenu",		

		Layout = { size_WH = {	w = 1.0, h = 1.0, wr = "scr", hr = "scr" },	},	
		eventOpaque = 0,
		forceSubItemFill = 1,
		;
		{
			type = "Frame",
			name = "contextItemFrame",
			
			arrangetype = "vert",
			autosize=1,
			Layout = {		
				pos_XY = { x = 0.0, y = 0.0, xr = "abs_px", yr = "abs_px" },
				pad_LT = {	l = 4.0, t = 4.0, lr = "px", tr = "px" },		
				pad_RB = {	r = 4.0, b = 4.0, rr = "px", br = "px" },	
			},	

			backgroundColor = COLOR_CONTEXTMENU_BGRD,
			BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKTB_THINLR,


		},


	}

	TEMPLATE_CONTEXTMENU_TRANSLUCENT = 
	{
		type = "ContextMenu",		
		Layout = { size_WH = {	w = 1.0, h = 1.0, wr = "scr", hr = "scr" },	},	
		eventOpaque = 0,
		forceSubItemFill = 1,
		backgroundColor = {0,0,0,0},
		;
		{
			type = "Frame",
			name = "contextItemFrame",
			
			arrangetype = "vert",
			autosize=1,
			Layout = {		
				pad_LT = {	l = 4.0, t = 4.0, lr = "px", tr = "px" },		
				pad_RB = {	r = 4.0, b = 4.0, rr = "px", br = "px" },	
			},	

			backgroundColor = COLOR_CONTEXTMENU_BGRD,
			BackgroundGraphic = BORDER_GRAPHIC_FRAME_THICKTB_THINLR,


		},
	}



	TEMPLATE_CONTEXTMENUITEM = 
	{
		type = "ContextMenuItem",		
		
		autosize=1,

		CheckedIconGraphic = {
			size = { 8, 8},
			texture = "DATA:\\UI\\NewUI\\Elements\\checkbox_pressed.tga",
			uvRect = { 0, 1, 1, 0 },	
		},
		
		--backgroundColor = {255,0,0,255},
		;
		-- underlying button
		{
			type = "Button",
			name = "contextMenuBaseButton2",
			Layout = {		
				size_WH = {	w = 1.0, h = CONTEXTMENUITEM_HEIGHT, wr = "par", hr = "scr" },		
				Flags = {
					hasVolume = 0,
					
				},
			
			},	
			--backgroundColor = {255,0,0,255},
			arrangeSep = {	x=8, y=0, xr="px", yr="px",},	

			overColor = COLOR_CONTEXTMENUITEM_HOVER,
			pressedColor = COLOR_CONTEXTMENUITEM_PRESSED,
			--autosize = 1,
			arrangetype = "horiz",
			clickThrough = 1,
			giveParentMouseInput = 1,
			--eventOpaque = 0,
			;
		},
		{
			type = "Frame",
			name = "contextMenuBaseButton",
			Layout = {		
				size_WH = {	w = 1.0, h = CONTEXTMENUITEM_HEIGHT, wr = "px", hr = "scr" },		
			},	

			arrangeSep = {	x=8, y=0, xr="px", yr="px",},	

			--overColor = COLOR_CONTEXTMENUITEM_HOVER,
			--pressedColor = COLOR_CONTEXTMENUITEM_PRESSED,
			autosize = 1,
			arrangetype = "horiz",
			clickThrough = 1,
			giveParentMouseInput = 1,
			eventOpaque = 0,
			;
			-- Icon
			{
				type = "Button",
				name = "contextMenuItemIcon",
				Layout = {		
					size_WH = {	w = 10000.0, h = .8, wr = "px", hr = "par" },	
					pos_XY = {	y = .5, yr = "par" },
					pivot_XY = { 0.0, 0.5 },						
					lockAspect=1,		
				},	

				
				eventOpaque = 0,
				--visible=false,
				clickThrough = 1,
			},
			-- Text
			{
				type = "TextLabel",
				name = "contextMenuItemText",

				autosize=1,
							
				Text = {
					textStyle = "IGHeading1",
					hAlign = "Left",				
					color = COLOR_CONTEXTMENU_TEXT_DEFAULT,
					text = "Wakka",
				},	
				eventOpaque = 0,
				clickThrough = 1,
				disabledTextColor			= {255,0,0,255},

			},
		},
		-- KeyBinding Text
		-- SubMenu Icon
		{
			type = "Button",
			name = "contextMenuSubMenuIcon",
			Layout = {		
				size_WH = {	w = 10000.0, h = .8, wr = "px", hr = "par" },	
				pos_XY = {	x=1, y = .5, xr="par", yr = "par" },
				pivot_XY = { 1.0, 0.5 },						
				lockAspect=1,		
			},	

			BackgroundGraphic = {
				size = { 8, 8},
				texture = "DATA:\\UI\\NewUI\\Elements\\checkbox_pressed.tga",
				uvRect = { 0, 1, 1, 0 },	
			},
				
			eventOpaque = 0,
			visible=0,
			clickThrough = 1,
		},


	
	}


------------------------------------------

	TEMPLATE_COMMAND_COOLDOWNFRAME = 
	{
		type = "CooldownFrame",				
		cooldownLabel = "cooldownText",
		swipeColor = {0,0,0,128},
		eventOpaque = 0,
		clickThrough = 1,
		hideWhenNotRunning = 1,
		;
		-- underlying button
			-- Text
			{
				type = "TextLabel",
				name = "cooldownText",
				autosize=1,
							
				Layout = {							
					pos_XY = {	x=1, y = 1, xr="par", yr = "par" },
					size_WH = { w = 1, h = .35, wr = "px", hr = "par" },
					pivot_XY = { 1.0, 1.0 },		
				},	

				Text = {
					color = { 255, 255, 255, 255},
					minShrink = .1,
					type = "Text",
					font = "ButtonFont",
					color = "IGColorButtonText",
					dropShadow = 1,
					style  = 1,
					hAlign = "Center",
				},	
				eventOpaque = 0,
				clickThrough = 1,
			},
	
	}




---------------------------------------------------------


if(GetTacticGroupButton == nil) then
	function GetTacticGroupButton(_name, _text, _mouseclick)

		local GroupButton = {
			type = "TextButton",				
			Layout = {
				size_WH = { w = 40, h = 40, wr = "px", hr = "px" },
				margin_RB = { r = -1, b = 1, rr = "px", br = "px" },
			},
			toggleButton = 1,
			buttonStyle = "RM_FEButtonStyleFlat",

		textColor					= {255, 255, 255, 32},
		--textColor					= COLOR_BUTTON_TEXT_DEFAULT,
		overTextColor				= COLOR_BUTTON_TEXT_HOVER,
		pressedTextColor			= COLOR_BUTTON_TEXT_DEFAULT,
		disabledTextColor			= {255, 255, 255, 32},
		stateIconCells = { 1, 1, 2, 3, 4, 5, 6, 7 },


			Text = {
				font = "Blender",
				color = "RM_FETextBlueBright",
				offset = {0, 0},				
				pixels = (24),
				rel = 0,					
				hAlign = "Center",
				vAlign = "Center",					
				text = _text,
			},				
			name = _name,
			onMouseClicked = _mouseclick,
			onMouseDoubleClicked = "MainUI_UserEvent( eFocus)",
			helpTip = "$2761",
			helpTipTextLabel = "commandsHelpTip",
			backgroundColor = { 255, 0, 0, 255},
		}

		return GroupButton

	end
end

if(GetFacilityButton == nil) then
	function GetFacilityButton(_name, _helptip, _hotkeyID, _uvRect, _orientation)
		
		local _taborientation
		local _tablayout

		if(_orientation == nil) then
			_taborientation = "RM_TaskbarHD_ButtonTabStyle"
			_tablayout = {
				size_WH = {	w = .085, h = 1, wr = "par", hr = "par" }, --Since there can be up to 10, each can be .1 of parent
				lockAspect=1,}		
		else
			_taborientation = "RM_TaskbarHD_ButtonTabLeftVertStyle"
			_tablayout = {
				--size_WH = {	w = 1, h = .085, wr = "par", hr = "par" },   --autosize version of vertical scrollbar.  Jittery
				size_WH = {	w = 1000, h = FACILITY_BUTTON_HEIGHT, wr = "px", hr = "scr" },
				lockAspect=1,				
				}		
		end

		local CommandToggleButton = {
			type = "RadioButton",
			name = _name,

			buttonStyle = _taborientation,
			soundOnEnter 		= "SFX_FacilityTabEnter",
			ignored = 1,

			helpTip = _helptip,
			helpTipTextLabel = "lblCurrentFacility",
			hotKeyID = _hotkeyID,
		
			Layout = _tablayout,

			toggleButton = 1,
			flashColor = {0,0,0,0},
			flashBorderColor = {0,0,0,0},
			borderWidth = 0,


			PressedGraphic = {
				texture = "data:ui\\NewUI\\Styles\\HWRM_Style\\FacilityIcons.tga",
				textureUV = {24,50,48,75},
			},

	

			stateBaseOfs = { 0.0, 0.0 },
			stateBaseCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
				
			pressedBorderColor = COLOR_BUTTON_TEXT_DEFAULT,

			BackgroundGraphic = {
				texture = "data:ui\\NewUI\\Styles\\HWRM_Style\\FacilityIcons.tga",
				uvRect = _uvRect,	
				patch_X = { -64,0 },
				patch_Y = { -64,0 },
				patch_Scale = .5,
					
				Surface = FACILITY_BUTTON_SURFACE,
			},
		}


		return CommandToggleButton

	end

end

