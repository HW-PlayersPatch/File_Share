crate_Ships =
{						
		{
				class = "cruiser",
				prob = 0.00,
				types =
				{
						{prob = 1.00, item = "Hgn_BattleCruiser", name = "$1538"},
				},
		},
		{
				class = "carrier",
				prob = 0.05,
				types =
				{
						{prob = 0.90, item = "Hgn_Carrier", name = "$1542"},
						{prob = 1.00, item = "Hgn_Shipyard", name = "$1544"},										
				},
		},
		{
				class = "destroyer",
				prob = 0.15,
				types =
				{
						{prob = 1.00, item = "Hgn_Destroyer", name = "$1530"},
				},
		},
		{
				class = "frigate",
				prob = 0.35,
				types =
				{
						{prob = 0.30, item = "Hgn_AssaultFrigate", name = "$1518"},
						{prob = 0.40, item = "Hgn_DefenseFieldFrigate", name = "$1526"},
						{prob = 0.60, item = "Hgn_IonCannonFrigate", name = "$1520"},
						{prob = 0.70, item = "Hgn_MarineFrigate", name = "$1528"},										
						{prob = 1.00, item = "Hgn_TorpedoFrigate", name = "$1522"},
				},
		},
		{
				class = "corvette",
				prob = 0.55,
				types =
				{
						{prob = 0.40, item = "Hgn_AssaultCorvette", name = "$1506"},										
						{prob = 0.90, item = "Hgn_PulsarCorvette", name = "$1508"},
						{prob = 1.00, item = "Hgn_MinelayerCorvette", name = "$1510"},
				},
		},
		{
				class = "fighter",
				prob = 0.75,
				types =
				{
						{prob = 0.30, item = "Hgn_Scout", name = "$1500"},
						{prob = 0.50, item = "Hgn_AttackBomber", name = "$1504"},										
						{prob = 1.00, item = "Hgn_Interceptor", name = "$1502"},
				},
		},
		{
				class = "platform",
				prob = 0.80,
				types =
				{
						{prob = 0.50, item = "Hgn_GunTurret", name = "$1512"},
						{prob = 1.00, item = "Hgn_IonTurret", name = "$1514"},
				},
		},
		{
				class = "resource",
				prob = 0.92,
				types =
				{
						{prob = 0.70, item = "Hgn_ResourceCollector", name = "$1532"},
						{prob = 1.00, item = "Hgn_ResourceController", name = "$1534"},
				},
		},
		{
				class = "noncombat",
				prob = 1.00,
				types =
				{
						{prob = 0.30, item = "Hgn_ProximitySensor", name = "$1548"},
						{prob = 0.60, item = "Hgn_ECMProbe", name = "$1550"},
						{prob = 1.00, item = "Hgn_Probe", name = "$1546"},
				},
		},
}