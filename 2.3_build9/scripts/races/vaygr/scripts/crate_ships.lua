crate_Ships =
{						
		{
				class = "cruiser",
				prob = 0.00,
				types =
				{
						{prob = 1.00, item = "Vgr_BattleCruiser", name = "$1632"},
				}
		},
		{
				class = "carrier",
				prob = 0.05,
				types =
				{
						{prob = 0.90, item = "Vgr_Carrier", name = "$1630"},
						{prob = 1.00, item = "Vgr_ShipYard", name = "$1528"},
				}
		},
		{
				class = "destroyer",
				prob = 0.15,
				types =
				{
						{prob = 1.00, item = "Vgr_Destroyer", name = "$1634"},
				}
		},
		{
				class = "frigate",
				prob = 0.35,
				types =
				{
						{prob = 0.40, item = "Vgr_AssaultFrigate",  name = "$1618"},
						{prob = 0.75, item = "Vgr_HeavyMissileFrigate", name = "$1622"},
						{prob = 1.00, item = "Vgr_InfiltratorFrigate", name = "$1620"},
				}
		},
		{
				class = "corvette",
				prob = 0.55,
				types =
				{
						{prob = 0.40, item = "Vgr_LaserCorvette", name = "$1610"},
						{prob = 0.80, item = "Vgr_MissileCorvette", name = "$1612"},
						{prob = 0.90, item = "Vgr_CommandCorvette", name = "$1616"},
						{prob = 1.00, item = "Vgr_MinelayerCorvette", name = "$1510"},
				}
		},
		{
				class = "fighter",
				prob = 0.75,
				types =
				{
						{prob = 0.25, item = "Vgr_Scout", name = "$1600"},
						{prob = 0.50, item = "Vgr_Bomber", name = "$1608"},
						{prob = 0.75, item = "Vgr_Interceptor", name = "$1602"},
						{prob = 1.00, item = "Vgr_LanceFighter", name = "$1606"},
				}
		},
		{
				class = "platform",
				prob = 0.80,
				types =
				{
						{prob = 0.40, item = "Vgr_WeaponPlatform_gun", name = "$1656"},
						{prob = 0.80, item = "Vgr_WeaponPlatform_missile", name = "$1658"},
						{prob = 1.00, item = "Vgr_HyperSpace_Platform", name = "$1660"},
				}
		},
		{
				class = "resource",
				prob = 0.92,
				types =
				{
						{prob = 0.70, item = "Vgr_ResourceCollector", name = "$1638"},
						{prob = 1.00, item = "Vgr_ResourceController", name = "$1640"},
				}
		},
		{
				class = "noncombat",
				prob = 1.00,
				types =
				{
						{prob = 0.30, item = "Vgr_Probe_Prox", name = "$1646"},
						{prob = 0.60, item = "Vgr_Probe_ECM", name = "$1644"},
						{prob = 1.00, item = "Vgr_Probe", name = "$1642"},
				},
		},
}