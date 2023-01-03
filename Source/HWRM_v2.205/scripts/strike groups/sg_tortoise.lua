Name = "tortoise"
Order = -1.0		-- Means invisible to UI

StanceGrouping = "Batch"
StanceGroupingAg = "Shape"
StanceGroupingEv = "Subs"

UnitLimit = 32

SupplyLimits =
{
	LayoutFighter = 25,
	LayoutCorvette = 18,
	LayoutFrigate = 12,
	LayoutDestroyer = 4,
	LayoutBattleCruiser = 1,
	LayoutResource = 9,
}

strikegroup = 
{
	Name					= "Core",
	FamilyOccupy 		= "BigCapitalShip, SmallCapitalShip, Frigate, Corvette, Fighter, Capturer, Utility",
	OffsetFromParent 		= {0,0,0},
	Children = 
	{
		--==========================================================
		-- captial ships, in a line
		--==========================================================
		{
			Name					= "CoreLeft",
			FamilyOccupy 		= "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent 		= {-1,0,0},
		},
		{
			Name					= "CoreRight",
			FamilyOccupy 		= "BigCapitalShip, SmallCapitalShip",
			OffsetFromParent 		= {1,0,0},
		},
		--==========================================================
		-- corvettes, form a roof over the cap line, roof is 5 deep 
		-- and then spreads left/right
		--==========================================================
		{
			-- up
			Name					= "Corvette Roof",
			FamilyOccupy 		= "Corvette",
			OffsetFromParent 		= {0,1,0},
			Children = 
			{
				{
					-- the forward elements
					Name					= "CorvetteRoof Forward 1",
					FamilyOccupy 		= "Corvette",
					OffsetFromParent 		= {0,0,1},
					Children = 
					{
						{
							Name					= "CorvetteRoof Forward 1 Left",
							FamilyOccupy 		= "Corvette",
							OffsetFromParent 		= {-1,0,0},
						},
						{
							Name					= "CorvetteRoof Forward 1 Right",
							FamilyOccupy 		= "Corvette",
							OffsetFromParent 		= {1,0,0},
						},
					},
				},
				{
					-- the rear elements
					Name					= "CorvetteRoof Backwards 1",
					FamilyOccupy 		= "Corvette",
					OffsetFromParent 		= {0,0,-1},
					Children = 
					{
						{
							Name					= "CorvetteRoof Backwards 1 Left",
							FamilyOccupy 		= "Corvette",
							OffsetFromParent 		= {-1,0,0},
						},
						{
							Name					= "CorvetteRoof Backwards 1 Right",
							FamilyOccupy 		= "Corvette",
							OffsetFromParent 		= {1,0,0},
						},
						{
							Name					= "CorvetteRoof Backwards 2",
							FamilyOccupy 		= "Corvette",
							OffsetFromParent 		= {0,0,-1},
							Children = 
							{
								{
									Name					= "CorvetteRoof Backwards 2 Left",
									FamilyOccupy 		= "Corvette",
									OffsetFromParent 		= {-1,0,0},
								},
								{
									Name					= "CorvetteRoof Backwards 2 Right",
									FamilyOccupy 		= "Corvette",
									OffsetFromParent 		= {1,0,0},
								},
								{
									Name					= "CorvetteRoof Backwards 3",
									FamilyOccupy 		= "Corvette",
									OffsetFromParent 		= {0,0,-1},
									Children = 
									{
										{
											Name					= "CorvetteRoof Backwards 3 Left",
											FamilyOccupy 		= "Corvette",
											OffsetFromParent 		= {-1,0,0},
										},
										{
											Name					= "CorvetteRoof Backwards 3 Right",
											FamilyOccupy 		= "Corvette",
											OffsetFromParent 		= {1,0,0},
										},
									},
								},
							},
						},
					},
				},
			},
		},
		--==========================================================
		-- frigates in lines to the rear
		--==========================================================
		{
			Name					= "Frigate Line Left",
			FamilyOccupy 		= "Frigate, Capturer",
			OffsetFromParent 		= {-1,0,-1},
			Children = 
			{
				{
					Name					= "Frigate Line Left Continuation",
					FamilyOccupy 		= "Frigate, Capturer",
					OffsetFromParent 		= {-1,0,0},
				},
				{
					Name					= "Frigate Line Left Upper",
					FamilyOccupy 		= "Frigate, Capturer",
					OffsetFromParent 		= {0,1,0},
					Children = 
					{
						{
							Name					= "Frigate Line Left Upper Continuation",
							FamilyOccupy 		= "Frigate, Capturer",
							OffsetFromParent 		= {-1,0,0},
						},
					},
				},
				{
					Name					= "Frigate Line Left Lower",
					FamilyOccupy 		= "Frigate, Capturer",
					OffsetFromParent 		= {0,-1,0},
					Children = 
					{
						{
							Name					= "Frigate Line Left Lower Continuation",
							FamilyOccupy 		= "Frigate, Capturer",
							OffsetFromParent 		= {-1,0,0},
						},
					},
				},
			},
		},
		{
			Name					= "Frigate Line Right",
			FamilyOccupy 		= "Frigate, Capturer",
			OffsetFromParent 		= {1,0,-1},
			Children = 
			{
				{
					Name					= "Frigate Line Right Continuation",
					FamilyOccupy 		= "Frigate, Capturer",
					OffsetFromParent 		= {1,0,0},
				},
				{
					Name					= "Frigate Line Right Upper",
					FamilyOccupy 		= "Frigate, Capturer",
					OffsetFromParent 		= {0,1,0},
					Children = 
					{
						{
							Name					= "Frigate Line Right Upper Continuation",
							FamilyOccupy 		= "Frigate, Capturer",
							OffsetFromParent 		= {1,0,0},
						},
					},
				},
				{
					Name					= "Frigate Line Right Lower",
					FamilyOccupy 		= "Frigate, Capturer",
					OffsetFromParent 		= {0,-1,0},
					Children = 
					{
						{
							Name					= "Frigate Line Right Lower Continuation",
							FamilyOccupy 		= "Frigate, Capturer",
							OffsetFromParent 		= {1,0,0},
						},
					},
				},
			},
		},
		--==========================================================
		-- utility in a line down and to the rear
		--==========================================================
		{
			Name					= "Utility",
			FamilyOccupy 		= "Utility",
			OffsetFromParent 		= {0,-0.6,-1},
			Children = 
			{
				{
					Name					= "Utility Left",
					FamilyOccupy 		= "Utility",
					OffsetFromParent 		= {-1,0,0},
				},
				{
					Name					= "Utility Right",
					FamilyOccupy 		= "Utility",
					OffsetFromParent 		= {1,0,0},
				},
			},
		},
		--==========================================================
		-- strike craft in walls out to the front
		--==========================================================
		{
			Name					= "StrikeCraft upper line",
			FamilyOccupy 		= "Fighter",
			OffsetFromParent 		= {0,0.3,1},
			Children = 
			{
				{
					Name					= "Left",
					FamilyOccupy 		= "Fighter",
					OffsetFromParent 		= {-1,0,0},
				},
				{
					Name					= "Right",
					FamilyOccupy 		= "Fighter",
					OffsetFromParent 		= {1,0,0},
				},
				{
					Name					= "StrikeCraft upper line second tier",
					FamilyOccupy 		= "Fighter",
					OffsetFromParent 		= {0,1,0},
					Children = 
					{
						{
							Name					= "Left",
							FamilyOccupy 		= "Fighter",
							OffsetFromParent 		= {-1,0,0},
						},
						{
							Name					= "Right",
							FamilyOccupy 		= "Fighter",
							OffsetFromParent 		= {1,0,0},
						},
					},
				},
			},
		},
		{
			Name					= "StrikeCraft lower line",
			FamilyOccupy 		= "Fighter",
			OffsetFromParent 		= {0,-0.3,1},
			Children = 
			{
				{
					Name					= "Left",
					FamilyOccupy 		= "Fighter",
					OffsetFromParent 		= {-1,0,0},
				},
				{
					Name					= "Right",
					FamilyOccupy 		= "Fighter",
					OffsetFromParent 		= {1,0,0},
				},
				{
					Name					= "StrikeCraft lower line second tier",
					FamilyOccupy 		= "Fighter",
					OffsetFromParent 		= {0,-1,0},
					Children = 
					{
						{
							Name					= "Left",
							FamilyOccupy 		= "Fighter",
							OffsetFromParent 		= {-1,0,0},
						},
						{
							Name					= "Right",
							FamilyOccupy 		= "Fighter",
							OffsetFromParent 		= {1,0,0},
						},
					},
				},
			},
		},
	},
}
