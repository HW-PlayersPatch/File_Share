-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

feSoundRoot = "data:sound/sfx/ui/frontend/"
gamespaceSoundRoot = "data:sound/sfx/ui/game_space/"

SFX_ButtonClick = {filename = feSoundRoot.."Mouseexitbuttonstyle2"}
SFX_ButtonEnter = {filename = feSoundRoot.."Mouseoverbuttonstyle1"}
SFX_TabEnter = {filename = SFX_ButtonEnter["filename"]}
SFX_DropDownListEnter = {filename = SFX_ButtonEnter["filename"]}
SFX_DropDownListClick = {filename = SFX_ButtonClick["filename"]}
SFX_ScrollButtonClick = {filename = feSoundRoot.."Scrollbarmousebuttonreleasedinpageupdownspace"}
SFX_ScrollBarPage = {filename = SFX_ScrollButtonClick["filename"]};
SFX_TextInputClicked = {filename = SFX_ButtonClick["filename"]};
SFX_TextInputAccept = {filename = feSoundRoot.."Selectitemfromdropdownlist"}
SFX_ListBoxItemEnter = {filename = SFX_ButtonEnter["filename"]}
SFX_ListBoxItemClick = {filename = SFX_ButtonClick["filename"]}
SFX_CheckBoxUnchecked = {filename = feSoundRoot.."keytypedintotextentry"}
SFX_CheckBoxChecked = {filename = feSoundRoot.."Keytypedintotextentry"}
SFX_MissionSelectClick = {filename = SFX_ButtonClick["filename"]}
SFX_GameInfoClicked = {filename = SFX_ButtonClick["filename"]}
SFX_ReadyButtonChecked = {filename = SFX_CheckBoxChecked["filename"]}
SFX_ReadyButtonUnchecked = {filename = SFX_CheckBoxUnchecked["filename"]}
SFX_FacilityTabEnter = {filename = SFX_ButtonEnter["filename"]}
SFX_TaskbarControlGroupsEnter = {filename = SFX_ButtonEnter["filename"]}
SFX_BuildItemClick = {filename = SFX_ButtonClick["filename"]}
SFX_ResearchItemClick = {filename = SFX_ButtonClick["filename"]}
SFX_RightClickMenuClick = {filename = SFX_ButtonClick["filename"]}
SFX_ATIToggle = {filename = gamespaceSoundRoot.."TOGGLEFORWARDBACKTACTICAL"}
SFX_GameMenuONOFF = {filename = feSoundRoot.."Mouseexitbuttonstyle2"}
SFX_ErrorMessage = {filename = feSoundRoot.."Errormessagepopup"}
SFX_BuildMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_LaunchMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_ChatMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_ObjectiveMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_ResearchMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_RightClickMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_RecallMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_TaksbarMenuONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_GlobalQueueONOFF = {filename = SFX_GameMenuONOFF["filename"]}
SFX_Chatmessagereceived = {filename = feSoundRoot.."Chatmessagereceived"}
SFX_Privatechatmessagereceived = {filename = feSoundRoot.."Privatechatmessagereceived"}
SFX_Playerjoinschatroom = {filename = feSoundRoot.."Playerjoinschatroom"}
SFX_Playerleaveschatroom = {filename = feSoundRoot.."Playerleaveschatroom"}
SFX_Playerkickedfromchatroom = {filename = feSoundRoot.."Playerkickedfromchatroom"}
SFX_Playerkickedfromchatroom = {filename = feSoundRoot.."Playerkickedfromchatroom"}
