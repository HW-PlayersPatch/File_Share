crate_Ships =
{						
		{
				class = "cruiser",
				prob = 0.00,
				types =
				{
						{prob = 1.00, item = "Tai_HeavyCruiser", name = "$10038"},
				},
		},
		{
				class = "carrier",
				prob = 0.05,
				types =
				{
						{prob = 1.00, item = "Tai_Carrier", name = "$10040"},																			
				},
		},
		{
				class = "destroyer",
				prob = 0.15,
				types =
				{
						{prob = 0.90, item = "Tai_MissileDestroyer", name = "$10036"},
						{prob = 1.00, item = "Tai_Destroyer", name = "$10034"},
				},
		},
		{
				class = "frigate",
				prob = 0.35,
				types =
				{
						{prob = 0.40, item = "Tai_AssaultFrigate", name = "$10024"},
						{prob = 0.50, item = "Tai_IonCannonFrigate", name = "$10026"},
						{prob = 0.60, item = "Tai_SupportFrigate", name = "$10028"},
						{prob = 0.70, item = "Tai_FieldFrigate", name = "$10030"},
				},
		},
		{
				class = "corvette",
				prob = 0.55,
				types =
				{
						{prob = 0.40, item = "Tai_LightCorvette", name = "$10012"},									
						{prob = 0.60, item = "Tai_HeavyCorvette", name = "$10014"},
						{prob = 0.70, item = "Tai_SalvageCorvette", name = "$10020"},
						{prob = 0.80, item = "Tai_RepairCorvette", name = "$10022"},									
						{prob = 0.90, item = "Tai_MultiGunCorvette", name = "$10016"},
						{prob = 1.00, item = "Tai_MinelayerCorvette", name = "$10018"},
				},
		},
		{
				class = "fighter",
				prob = 0.75,
				types =
				{
						{prob = 0.30, item = "Tai_Scout", name = "$10000"},
						{prob = 0.50, item = "Tai_Interceptor", name = "$10002"},		
						{prob = 0.80, item = "Tai_AttackBomber", name = "$10004"},
						{prob = 0.90, item = "Tai_Defender", name = "$10006"},
						{prob = 1.00, item = "Tai_DefenseFighter", name = "$10008"},
				},
		},						
		{
				class = "resource",
				prob = 0.92,
				types =
				{
						{prob = 0.70, item = "Tai_ResourceCollector", name = "$10046"},
						{prob = 1.00, item = "Tai_ResourceController", name = "$10048"},
				},
		},
		{
				class = "noncombat",
				prob = 1.00,
				types =
				{
						--{prob = 0.30, item = "Tai_ResearchShip",},
						{prob = 0.30, item = "Tai_Probe", name = "$10054"},
						{prob = 0.50, item = "Tai_ProximitySensor", name = "$10056"},
						{prob = 0.60, item = "Tai_SensorArray", name = "$10058"},
						{prob = 0.80, item = "Tai_GravWellGenerator", name = "$10050"},
						{prob = 1.00, item = "Tai_CloakGenerator", name = "$10052"},										
				},
		},
}