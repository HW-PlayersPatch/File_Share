function SPRestrict()	
	local i = 0
	local numplayers = Universe_PlayerCount()	
	while (i < numplayers) do
		SPRestrictOptions( i );	
		i = i + 1;
	end	
end

function MPRestrict()	
	local i = 0
	local numplayers = Universe_PlayerCount()	
	while (i < numplayers) do
		RestrictOptions( i );	
		i = i + 1;
	end	
end

function SPRestrictOptions( playerid )
	Player_RestrictResearchOption(playerid, PlayerRace_GetString(playerid, "generic_sp_research_restrict", ""))
	Player_RestrictBuildOption(playerid, PlayerRace_GetString(playerid, "generic_sp_build_restrict", ""))
end

function RestrictOptions( playerid )
	Player_RestrictResearchOption(playerid, PlayerRace_GetString(playerid, "generic_mp_research_restrict", ""))
	Player_RestrictBuildOption(playerid, PlayerRace_GetString(playerid, "generic_mp_build_restrict", ""))

	if Player_GetLevelOfDifficulty(playerid) == 0 then
		SPRestrictOptions(playerid)
	end				
end

