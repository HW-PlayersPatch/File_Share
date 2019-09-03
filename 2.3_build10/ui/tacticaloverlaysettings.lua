--===========================================================================
--  Name    : TacticalOverlaySettings.lua
--  Purpose : defines the stages of Tactical Overlay graphics cycled through
--			  using the TAB key
--	How to use: define as many or as few stages as you want, the names for
--				the feedback settings available are (case insensitive):
--              -  sphereModifiers      - show all sphere modifiers, all the time
--              -  selectionIcons       - display selection icons with the health bar
--              -  friendly             - shows TO for friendly units
--              -  enemy                - shows TO for enemy units
--              -  resources            - shows TO for all resources
--              -  distantTOs           - display TOs with mousover or selection, but not when distant like with regular TOs
--              -  noATIAtAll           - don't show any ATI at all
--              -  feedbackMouseOver    - shows order feedback lines and circle only for mouse over units
--              -  feedbackSelection    - shows order feedback lines and circle for selected units
--              -  feedbackAlwaysOn     - shows order feedback lines and circle for all friendly units
--              -  rallyPointsSelected  - shows rally points for selected ships only
--              -  rallyPointsAll       - shows all rally points
--
--  Copyright Relic Entertainment, Inc.  All rights reserved.
--===========================================================================

dofilepath("data:ui/PlayersPatch_UI_Util.lua")

stage = {
	-- SHOW MINIMUM AMOUNT OF INFORMATION
	{
		{setting = "FeedbackMouseOver"},
		{setting = "RallyPointsSelected"},
		{setting = "SelectionIcons"},
		{setting = "DistantTOs"},   -- This means disable distant TO's?
	},
	-- DEFAULT TO SETTING: SHOW MODERATE INFORMATION
	{
		{setting = "FeedbackMouseOver"},
		{setting = "RallyPointsSelected"},
		{setting = "SelectionIcons"},
	},
	-- SHOW MOST INFORMATION
	{
		{setting = "FeedbackMouseOver"}, -- this may say MAXIMUM info but that doesn't mean overload the player,
		{setting = "FeedbackSelection"}, -- these feedback settings are quite enough info!
		{setting = "Friendly"},
		{setting = "Enemy"},
		{setting = "Resources"},
		{setting = "RallyPointsSelected"},
		{setting = "SelectionIcons"},
		{setting = "SphereModifiers" },
	},
	-- SHOW ALL INFORMATION
	{
		{setting = "FeedbackAlwaysOn"}, -- for those who want total overkill ;)
		{setting = "Friendly"},
		{setting = "Enemy"},
		{setting = "Resources"},
		{setting = "RallyPointsAll"},
		{setting = "SelectionIcons"},
		{setting = "SphereModifiers" },
	}
}

i = GetTacticalOverlaySetting()

function incI()
	i = i + 1
	if i > 4 then i = 1 end
end

stage0 = stage[i]; incI()
stage1 = stage[i]; incI()
stage2 = stage[i]; incI()
stage3 = stage[i]; incI()

