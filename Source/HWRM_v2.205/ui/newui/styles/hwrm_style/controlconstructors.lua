dofilepath("data:ui/newui/Styles/HWRM_Style/HWRMDefines.lua")

-- ControlConstructors


	-------------- Helpful Common Layouts for Buttons ---------------
	BTN_FOOTER_STD_SMALL_LAYOUT = {
			pivot_XY = { 0.0, 0.5 },					
			pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
			min_WH = {	w = NAVIGATION_SMALL_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
		}	
	
	BTN_FOOTER_STD_LAYOUT = {
			pivot_XY = { 0.0, 0.5 },					
			pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},		
			min_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },	
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },						
		}

	BTN_FOOTER_YES_LAYOUT = {
			pivot_XY = { 1.0, 0.0 },					
			pos_XY = {	x=1.0, xr="par"},	
			min_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
		}	

	BTN_FOOTER_CENTER_LAYOUT = {
			pivot_XY = { 0.5, 0.5 },					
			pos_XY = {	x=0.5, y=0.5, xr="par", yr="par",},		
			min_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			Flags = {	hasVolume = 0,	canArrange = 0,	}, -- So it doesn't affect the autoarrange of other elements		
		}
	BTN_FOOTER_FORCELEFT_LAYOUT = {
			pivot_XY = { 0.0, 0.5 },					
			pos_XY = {	x=0.0, y=0.5, xr="par", yr="par",},		
			min_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },						
			Flags = {	hasVolume = 0,	canArrange = 0,	}, -- So it doesn't affect the autoarrange of other elements	
		}

	BTN_FOOTER_SMALL_LAYOUT = {
			pivot_XY = { 0.0, 0.5 },					
			pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},	
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },	
		}

	BTN_FOOTER_SMALL_YES_LAYOUT = {
			pivot_XY = { 1.0, 0.0 },					
			pos_XY = {	x=1.0, xr="par"},	
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT/2, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },	
		}
	
	BTN_FOOTER_TINY_LAYOUT = {
			pivot_XY = { 0.0, 0.5 },					
			pos_XY = {	x=0.0, y=0.5, xr="px", yr="par",},	
			max_WH  = {	w = .5, h = STD_BUTTON_HEIGHT/2, wr = "par", hr = "scr" },								
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ/2, t = BUTTON_TEXT_PAD_VERT/4, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ/2, b = BUTTON_TEXT_PAD_VERT/4, rr = "scr", br = "scr" },	
		}

	BTN_FOOTER_TINY_YES_LAYOUT = {
			pivot_XY = { 1.0, 0.0 },					
			pos_XY = {	x=1.0, xr="par"},	
			max_WH  = {	w = .5, h = STD_BUTTON_HEIGHT/2, wr = "par", hr = "scr" },		
			pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ/2, t = BUTTON_TEXT_PAD_VERT/42, lr = "scr", tr = "scr" },
			pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ/2, b = BUTTON_TEXT_PAD_VERT/4, rr = "scr", br = "scr" },	
		}


	BTN_MENU_SMALL_LAYOUT = 
	{
		--min_WH = {	w = 1, wr = "par"},	
		pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
		pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
	}

	BTN_MENU_SMALL_FILL_LAYOUT = 
	{
		min_WH = {	w = 1, wr = "par"},	
		pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
		pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },	
	}

	LISTBOX_MENU_VERT_BOTTOM_LAYOUT = 
	{
		pivot_XY = { 0.0, 1.0 },
		pos_XY = {	y=1.0, yr="par"},	
		size_WH = {	w = 1, h = 1, wr = "par", hr = "px"},
		--min_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },
		pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ/2, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
		pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ/2, b = BUTTON_TEXT_PAD_VERT/2, rr = "scr", br = "scr" },	
		--Flags = { canArrange = 0,hasVolume=0 },		
	}

	LISTBOX_MENU_CENTER_CHILD_LAYOUT = 
	{
		pivot_XY = { 0.5, 0.0 },
		pos_XY = {	x=.5, xr="par"},	
		size_WH = {	w = 1.0, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
	}

	-----------------------------------------------------------------

if(NewMenuButton==nil) then

	function NewMenuButton(_name, _text, _helptip, _hotkeyID, _layout, _style, _mouseclicked, _visible, _UINavNextElement,_UINavUpElement,_UINavRightElement,_UINavDownElement, _UINavLeftElement )

		local _buttonLayout 
		local _buttonStyle
		local _buttonvisible
		local _nextElement
		local _upElement
		local _rightElement
		local _downElement
		local _leftElement
		--------------------- Setup Defaults ---------------------
		if(_layout == nil) then
			_buttonLayout = {	
				min_WH  = {	w = INGAMEMENU_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },								
			}
		else
			_buttonLayout = _layout
		end
	
		if(_style == nil) then
			_buttonStyle = "FEButtonStyle1"
		else
			_buttonStyle = _style
		end

		if(_visible == nil) then
			_buttonvisible = 1
		else
			_buttonvisible = _visible
		end
		
		--------------------- The actual button constructor ---------------------

		local MenuButton = {
			type = "TextButton",
			name = _name,

			buttonStyle = _buttonStyle,

			ignored = 1,

			helpTip = _helptip,
			hotKeyID = _hotkeyID,
			visible = _buttonvisible,
			Layout = _buttonLayout,
			autosize=1,
			
			Text = {		
				text = _text, 
				--pixels = (16),
				--rel = 500,
				--pixels  = 18,
				--rel=0,
				minShrink = .25,
			},
			backgroundColor = { 255, 0, 0, 255 },
			onMouseClicked =_mouseclicked,

			UINavNextElementName = _UINavNextElement,
			UINavUpElementName = _UINavUpElement,
			UINavRightElementName = _UINavRightElement,
			UINavDownElementName = _UINavDownElement,
			UINavLeftElementName = _UINavLeftElement,
		}


		return MenuButton

	end
end
-------------------------------------------------------------------------------------------
if(NewMenuDropDown == nil) then
	function NewMenuDropDown(_name, _ddName, _text, _helptip, _listbox, _layout, _arrangement, _autosize )
		
		local _arrangedir 
		local _frameLayout 
		local _auto
		local _childlayout


		if(_arrangement == nil) then
			_arrangedir = "horiz"
			_childlayout = {		
				size_WH = {	w = 1.0, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},
				}
		else
			_arrangedir = _arrangement
			_childlayout = LISTBOX_MENU_CENTER_CHILD_LAYOUT
		end

		if(_autosize == nil) then
			_auto = 0
		else
			_auto = _autosize
		end

		if(_layout == nil) then
			_frameLayout = {	
					size_WH = {	w = 0.35, h = STD_BUTTON_HEIGHT, wr = "par", hr = "scr"},
					min_WH = {	w = NAVIGATION_BUTTON_WIDTH, h = STD_BUTTON_HEIGHT, wr = "scr", hr = "scr" },
					pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = BUTTON_TEXT_PAD_VERT, lr = "scr", tr = "scr" },
					pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ/2, b = BUTTON_TEXT_PAD_VERT, rr = "scr", br = "scr" },								
			}
		else
			_frameLayout = _layout
		end


		local LabeledDropDown = {
				type = "Button",
				name = _name,
				
				Layout = _frameLayout,
				
				stateIconOfs = { 0.0, 0.0 },
				stateIconCells = { 0, 1, 2, 3, 4, 5, 6, 7 },
				
				BackgroundGraphic = BORDER_GRAPHIC_BUTTON_OUTLINE,
				--IconBase = MENU_BUTTON_GRAPHIC_SMALL_CHIPPED,
				backgroundColor = "FEColorBackground1",


				textColor					= COLOR_BUTTON_TEXT_DEFAULT,
				overTextColor				= COLOR_BUTTON_TEXT_HOVER,
				pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
				disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,
				
				arrangetype = _arrangedir,
				autosize=_auto,
				visible = 1, 
				
				arrangeSep = {	x=PANEL_PAD_HORIZ, y=PANEL_PAD_VERT, xr="scr", yr="scr",},	

				;
							
				{
					type = "TextLabel",

					Layout = _childlayout,

					Text = {
						textStyle = "RM_GenericLabelLarge_TextStyle",
						text = _text, 
					},
					autosize=1,
				},
								
				{
					type = "DropDownListBox",
					name = _ddName,
					enabled = 1,				

					Layout = _childlayout,
					
					arrangeweight = 1.0,

					dropDownListBoxStyle = "FEDropDownListBoxStyle",
					selected = 1,
					helpTipTextLabel = "m_lblHelpText", 
					helpTip = _helptip,
								
					ListBox = _listbox,
				},
			}
		return LabeledDropDown
	end
end
-------------------------------------------------------------------------------------------
if(Option_LabeledSlider == nil) then
	function Option_LabeledSlider(_name, _labelText,  _valueTextName, _valueText_helptip, _sliderName, _slider_helptip, _visible, _labelAsFloat, _min, _max, _onScroll, _customDataString )
		
		local _buttonvisible		
			if(_visible == nil) then
				_buttonvisible = 1
			else
				_buttonvisible = _visible
			end
		
		local _displayLabelAsFloat
			if(_labelAsFloat == nil) then
				_displayLabelAsFloat = 0
			else
				_displayLabelAsFloat = _labelAsFloat
			end

		local _onScrollbarScroll
			if(_onScroll == nil) then
				_onScrollbarScroll = ""
			else
				_onScrollbarScroll = _onScroll
			end

		local _minScrollValue
			if(_min == nil) then
				_minScrollValue = 0
			else
				_minScrollValue = _min
			end

		local _maxScrollValue
			if(_max == nil) then
				_maxScrollValue = 100
			else
				_maxScrollValue = _max
			end

		local _customDataStringValue
			if(_customDataString == nil) then
				_customDataStringValue = ""
			else
				_customDataStringValue = _customDataString
			end

		local LabeledSlider = {
			type = "Frame",
			name = _name,

			Layout = {									
				size_WH = {w = 1, h = LISTBOXITEM_HEIGHT, wr = "par", hr = "scr_min",},
				pad_LT = { l = 4, t = 4, lr = "px", tr = "px" },
			},
			autosize=1,
			arrangetype = "horiz",

			visible = _buttonvisible,
			;
			{
				type = "TextLabel",

				Layout = {	
					size_WH = {w = .45, h = 1, wr = "par", hr = "par",},
				},

				Text = {
					textStyle = "RM_GenericLabelLarge_TextStyle",
					text = _labelText,
				},
			},
			-- SLIDER
			{	
				type = "Frame",
				--borderWidth = 1,
				--borderColor = {255,0,255,255},

				Layout = {		
					size_WH = {w = .5, h = 1, wr = "par", hr = "par",},
				},
				--autosize=1,
				arrangetype = "horiz",
				--arrangeSep = {	x = TITLE_PAD_HORIZ, y = 0, xr="scr", yr="scr"},	
				;					

				{
					type = "TextLabel",
					name = _valueTextName,					
					style = "FESliderLabelStyle",

					Layout = {						
						size_WH = {	w = 40.0/800, h = 1.0, wr = "scr", hr = "par" },	
					},	

					Text = {
						text ="0",
						font = "ButtonFont",
						vAlign = "Middle",
						hAlign = "Center",
						color = {255,255,255,255},
					},	

					helpTipTextLabel = "m_lblHelpText", 
					helpTip = _valueText_helptip, -- "SOUND EFFECTS VOLUME",
				},
							
				{
					type = "ScrollBar",
					name = _sliderName,
					sliderTextLabel = _valueTextName,
					arrangeweight = 1,
					customDataString = _customDataStringValue,
					Layout = {						
						size_WH = {	w = 1.0, h = 1.0, wr = "px", hr = "par" },	
					},	

					displayLabelAsFloat = _displayLabelAsFloat,
					--position = {270+42, 2},
					--width = 330-42,
					scrollBarStyle = "FESliderStyle",
					range =  { _minScrollValue, _maxScrollValue },			

					helpTipTextLabel = "m_lblHelpText", 
					helpTip = _slider_helptip, -- "ADJUST THE VOLUME OF THE SOUND EFFECTS",
					onScroll = _onScrollbarScroll,
					--helpTipAnchored = 1,
					--helpTipPos = { 1.0, 1.25 },
					--helpTipPivot = { 1.0, -0.25 },
									--			stepSize = 0.1,
							--displayLabelAsFloat = 1,
						--	pageSize = 0.2,

					labelSignificantDigits = 4,  -- Includes decimal.  IE 1.34 is sigdigs 4
			
				},
			},
		}


		return LabeledSlider

	end
end
---------------------------------------------------------------------------------------------
if(Option_LabeledDropDown == nil) then
	function Option_LabeledDropDown(_name, _labelText,  _dropdownName, _dropdown_helptip, _listbox )
		local LabeledDropDown = {
				type = "Frame",
				name = "LabeledDropDownTempName",
				Layout = {									
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
					pad_LT = { l = 4, t = 4, lr = "px", tr = "px" },
					pad_RB = { r = 4, b = 4, rr = "px", br = "px" },
				},
				autosize=1,
				arrangetype = "horiz",
				visible = 1, 
				;
							
				{
					type = "TextLabel",
					name = _name,

					Layout = {	
						pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
						size_WH = {	w = .45, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr"},	
						pivot_XY = { 0, 0.5 },	
					},

					Text = {
						textStyle = "RM_GenericLabelLarge_TextStyle",
						text = _labelText, 
					},
					autosize=1,
				},
								
				{
					type = "DropDownListBox",
					name = _dropdownName,
					position = {270, 0},
					enabled = 1,				

					Layout = {		
						size_WH = {w = .5, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr",},
						pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
						pivot_XY = { 0, 0.5 },	
					
						--size_WH = {	w = 330/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr" },	
					},

					dropDownListBoxStyle = "FEDropDownListBoxStyle",
					selected = 1,
					helpTipTextLabel = "m_lblHelpText", 
					helpTip = _dropdown_helptip, -- 
								
					ListBox = _listbox,
				},
			}


		return LabeledDropDown

	end
end

---------------------------------------------------------------------------------------------
if(Option_LabeledTextInput == nil) then
	function Option_LabeledTextInput(_name, _labelText,  _textinputName, _textinput_helptip, _maxtextlength, _password )
	
		--------------------- Setup Defaults ---------------------
		if(_password == nil) then
			_password = 0
		end 

		if(_maxtextlength == nil) then
			_maxtextlength = 24
		end
		-------------------------------------------------------------
		local LabeledTextInput = {
				type = "Frame",
				name = "LabeledTextInfoTempName",
				Layout = {									
					size_WH = {w = 1, h = 1, wr = "par", hr = "px",},
					pad_LT = { l = 4, t = 4, lr = "px", tr = "px" },
					pad_RB = { r = 4, b = 4, rr = "px", br = "px" },	
				},
				autosize=1,
				arrangetype = "horiz",
				visible = 1, 
				;
							
				{
					type = "TextLabel",
					name = _name,
					Layout = {	
							pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
							size_WH = {	w = .45, h = TEXTINPUT_HEIGHT, wr = "par", hr = "scr"},	
							pivot_XY = { 0, 0.5 },	
						--size_WH = {w = .5, h = 1, wr = "par", hr = "px",},
					},

					disabledTextColor			= COLOR_LABEL_TEXT_DISABLED,

					Text = {
						textStyle = "RM_GenericLabelLarge_TextStyle",
						text = _labelText, 
					},
					autosize=1,
				},
								
				{
					type = "TextInput",
					name = _textinputName,
					enabled = 1,				
					--arrangeweight = 1,
					Layout = {		
							pos_XY = { x = 1.0, y = .5, xr = "px", yr = "par" },		
							size_WH = {	w = .5, h = TEXTINPUT_HEIGHT, wr = "par", hr = "scr"},	
							pivot_XY = { 0, 0.5 },	
						--size_WH = {	w = 330/800, h = DROPDOWN_HEIGHT, wr = "scr", hr = "scr" },	
					},

					textInputStyle = "FETextInputStyle",
					maxTextLength = _maxtextlength,
					password = _password,	
					helpTip = _textinput_helptip, 
				},
			}


		return LabeledTextInput

	end
end
-----------------------------------------------------------------------


if(NewCheckBoxButton==nil) then

	function NewCheckBoxButton(_name, _text, _helptip, _layout,  _mouseclicked, _visible )

		local _buttonLayout 

		local _buttonvisible
		--------------------- Setup Defaults ---------------------
		if(_layout == nil) then
			_buttonLayout = {	
				size_WH = {	w = 1, h = DROPDOWN_HEIGHT, wr = "par", hr = "scr" },									
			}
		else
			_buttonLayout = _layout
		end

		if(_visible == nil) then
			_buttonvisible = 1
		else
			_buttonvisible = _visible
		end

		--------------------- The actual button constructor ---------------------

		local CheckBoxButton = {
			type = "Frame",
			--size = {608, 18},
			ignored = 1,
			Layout = _buttonLayout,
			--autosize=1,
			;
							
			{
				type = "TextLabel",
				
				--position = {20,0},
				Text = {
					textStyle = "RM_GenericLabelLarge_TextStyle",
					text = _text, -- ENABLE RIGHT CLICK MENU
					color = COLOR_LABEL_TEXT_DEFAULT,
				},

				Layout = {		
					pos_XY = {	x=16/800, y=0.5, xr="scr", yr="par",},	
					pivot_XY = { 0.0, 0.5 },	
				},
				helpTip = _helptip, 
				autosize=1,
			},
							
			{
				type = "Button",
				name = _name,
				Layout = {		
						pos_XY = {	x=0, y=0.5, xr="px", yr="par",},	
						pivot_XY = { 0.0, 0.5 },	
						size_WH = {	w = 1000, h = .75, wr = "px", hr = "par" },		
						lockAspect = 1,	
				},

				enabled = 1,
				buttonStyle = "FECheckBoxButtonStyle",
				helpTipTextLabel = "m_lblHelpText", 
				helpTip = _helptip, 
			},
		}


		return CheckBoxButton

	end
end


-----------------------------------------------------------------------


if(NewMenuStripDropdownButton==nil) then

	function NewMenuStripDropdownButton(_name, _text, _helptip, _layout, _contextmenu, _screen, _enabled, _visible )

		local _buttonLayout 

		local _buttonvisible
		--------------------- Setup Defaults ---------------------
		if(_layout == nil) then
			_buttonLayout = {	
				size_WH = {	w = 1, h = 1, wr = "px", hr = "par" },	
				pad_LT  = { l = BUTTON_TEXT_PAD_HORIZ, t = 0, lr = "scr", tr = "scr" },
				pad_RB  = { r = BUTTON_TEXT_PAD_HORIZ, b = 0, rr = "scr", br = "scr" },	
												
			}
		else
			_buttonLayout = _layout
		end

		if(_visible == nil) then
			_buttonvisible = 1
		else
			_buttonvisible = _visible
		end

		--------------------- The actual button constructor ---------------------

		local MenuStripDropdownButton = {
			type = "MenuStripItem",
			name = _name,
			ignored = 1,
			Layout = _buttonLayout,
			autosize=1,
			helpTip = _helptip,
			--hotKeyID = _hotkeyID,
			visible = _buttonvisible,
			--Layout = _buttonLayout,
			
			textColor					= COLOR_BUTTON_TEXT_DEFAULT,
			overTextColor				= COLOR_BUTTON_TEXT_HOVER,
			pressedTextColor			= COLOR_BUTTON_TEXT_PRESSED,
			disabledTextColor			= COLOR_BUTTON_TEXT_DISABLED,
			backgroundColor				= COLOR_LISTITEM,
			overColor					= COLOR_LISTITEM_HOVER,


			-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
			soundOnEnter 		= "SFX_ButtonEnter",
			soundOnClicked 		= "SFX_ButtonClick",


			Text = {		
				text = _text, 
				--pixels = (16),
				--rel = 500,
				--pixels  = 18,
				--rel=0,
				minShrink = .25,
			},
			contextMenu = _contextmenu,
			onMouseClicked = "UI_ShowElementContextMenu('".. _name .."','".._screen.."')",	
			;

							

		}


		return MenuStripDropdownButton

	end
end



if(NewContextMenuCheckButton==nil) then

	function NewContextMenuCheckButton(_name, _text, _helptip, _oncheckLUA, _getCheckStateLUA, _ischecked, _enabled, _visible )

		local _buttonLayout 

		local _buttonvisible
		--------------------- Setup Defaults ---------------------

		if(_visible == nil) then
			_buttonvisible = 1
		else
			_buttonvisible = _visible
		end

		--------------------- The actual button constructor ---------------------

		local ContextMenuCheckButton = {
			type = "ContextMenuItem",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,

			name = _name,
			ignored = 1,
			--Layout = _buttonLayout,
			autosize=1,
			helpTip = _helptip,

			visible = _buttonvisible,

			onCheckChanged = _oncheckLUA,
			getCheckState = _getCheckStateLUA,
			isCheckable = 1,
			isChecked = _ischecked,

			-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
			soundOnEnter 		= "SFX_ButtonEnter",
			soundOnClicked 		= "SFX_ButtonClick",
			text = _text, 		
			;

							

		}


		return ContextMenuCheckButton

	end
end


if(NewContextMenuButton==nil) then

	function NewContextMenuButton(_name, _text, _helptip, _onclickLUA, _enabled, _visible )

		local _buttonLayout 

		local _buttonvisible
		--------------------- Setup Defaults ---------------------

		if(_visible == nil) then
			_buttonvisible = 1
		else
			_buttonvisible = _visible
		end

		--------------------- The actual button constructor ---------------------

		local ContextMenuCheckButton = {
			type = "ContextMenuItem",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,

			name = _name,
			ignored = 1,
			--Layout = _buttonLayout,
			autosize=1,
			helpTip = _helptip,

			visible = _buttonvisible,

		
			onMouseClicked = _onclickLUA,

			-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
			soundOnEnter 		= "SFX_ButtonEnter",
			soundOnClicked 		= "SFX_ButtonClick",
			text = _text, 		
			;

							

		}


		return ContextMenuCheckButton

	end
end


if(NewContextMenuButtonData==nil) then

	function NewContextMenuButtonData(_name, _text, _helptip, _onclickLUA, _data, _data2, _data3,_enabled, _visible )

		local _buttonLayout 

		local _buttonvisible
		--------------------- Setup Defaults ---------------------

		if(_visible == nil) then
			_buttonvisible = 1
		else
			_buttonvisible = _visible
		end

		--------------------- The actual button constructor ---------------------

		local ContextMenuButton = {
			type = "ContextMenuItem",
			UseTemplate = TEMPLATE_CONTEXTMENUITEM,

			name = _name,
			ignored = 1,
			--Layout = _buttonLayout,
			autosize=1,
			helpTip = _helptip,

			visible = _buttonvisible,
			customData = _data,
			customData2 = _data2,
			customData3 = _data3,
			onMouseClicked = _onclickLUA,

			-- NOTE: if you dont want a sound to play onEnter, use FEButtonStyle1NoEnterSound
			soundOnEnter 		= "SFX_ButtonEnter",
			soundOnClicked 		= "SFX_ButtonClick",
			text = _text, 		
			;							

		}

		return ContextMenuButton

	end
end