------------------------------------------------------------------------------------------------
buildFamily =
{
	{
		name = "Fighter_Hgn",
	},
	{
		name = "Corvette_Hgn",
	},
	{
		name = "Mover_Hgn",
	},
	{
		name = "Frigate_Hgn",
	},
	{
		name = "SuperCap_Hgn",
	},
	{
		name = "Shipyard_Hgn",
	},
	{
		name = "Battlecruiser_Hgn",
	},
	{
		name = "Flagship_Hgn",
	},
	{
		name = "Utility_Hgn",
	},
	{
		name = "Probe_Hgn",
	},
	{
		name = "Platform_Hgn",
	},
	{
		name = "SubSystem_Hgn",
	},
	{
		name = "SubSystemLarge_Hgn",
	},
	{
		name = "Fighter_Vgr",
	},
	{
		name = "Corvette_Vgr",
	},
	{
		name = "Frigate_Vgr",
	},
	{
		name = "SuperCap_Vgr",
	},
	{
		name = "Shipyard_Vgr",
	},
	{
		name = "Battlecruiser_Vgr",
	},
	{
		name = "Flagship_Vgr",
	},
	{
		name = "Utility_Vgr",
	},
	{
		name = "Probe_Vgr",
	},
	{
		name = "Platform_Vgr",
	},
	{
		name = "SubSystem_Vgr",
	},
	{
		name = "SubSystemLarge_Vgr",
	},
	{
		name = "Fighter_Kus",
	},
	{
		name = "Corvette_Kus",
	},
	{
		name = "Frigate_Kus",
	},
	{
		name = "SuperCap_Kus",
	},
	{
		name = "Battlecruiser_Kus",
	},
	{
		name = "Flagship_Kus",
	},
	{
		name = "Resource_Kus",
	},
	{
		name = "NonCombat_Kus",
	},
	{
		name = "SubSystem_Kus",
	},
	{
		name = "Mover_Kus",
	},
	{
		name = "Fighter_Tai",
	},
	{
		name = "Corvette_Tai",
	},
	{
		name = "Frigate_Tai",
	},
	{
		name = "SuperCap_Tai",
	},
	{
		name = "Battlecruiser_Tai",
	},
	{
		name = "Flagship_Tai",
	},
	{
		name = "Resource_Tai",
	},
	{
		name = "NonCombat_Tai",
	},
	{
		name = "SubSystem_Tai",
	},
	{
		name = "Utility_Tai",
	},
	{
		name = "Fighter_Tur",
	},
	{
		name = "Corvette_Tur",
	},
	{
		name = "Frigate_Tur",
	},
	{
		name = "Flagship_Tur",
	},
	{
		name = "Fighter_Kad",
	},
	{
		name = "Corvette_Kad",
	},
	{
		name = "Frigate_Kad",
	},
	{
		name = "Utility_Kad",
	},
	{
		name = "Flagship_Kad",
	},
	{
		name = "NotBuildable",
	},
	{
		name = "Command",
	},
}

displayFamily =
{
	{
		name = "Fighter",
		stringParam = "$2100",
		numParam = 0,
	},
	{
		name = "Corvette",
		stringParam = "$2101",
		numParam = 10,
	},
	{
		name = "Frigate",
		stringParam = "$2102",
		numParam = 20,
	},
	{
		name = "Capital",
		stringParam = "$2103",
		numParam = 30,
	},
	{
		name = "Flagship",
		stringParam = "$2104",
		numParam = 40,
	},	
	{
		name = "Platform",
		stringParam = "$2105",
		numParam = 50,
	},	
	{
		name = "Utility",
		stringParam = "$2106",
		numParam = 60,
	},	
	{
		name = "Resource",
		stringParam = "$4910",
		numParam = 70,
	},
	{
		name = "NonCombat",
		stringParam = "$4909",
		numParam = 80,
	},
	{
		name = "SubSystemModule",
		stringParam = "$2107",
		numParam = 90,
	},
	{
		name = "SubSystemSensors",
		stringParam = "$2108",
		numParam = 100,
	},
	{
		name = "Munition",
		stringParam = "$2109",
		numParam = 110,
	},
	{
		name = "Megalith",
		stringParam = "$2110",
		numParam = 120,
	},	
}

------------------------------------------------------------------------------------------------
-- the number parameter indicates that the family can be attacked, 0 means un-attackable
attackFamily =
{
	{
		name = "Fighter",
		numParam = 1,
	},
	{
		name = "Fighter_hw1",
		numParam = 1,
	},
	{
		name = "Corvette",
		numParam = 1,
	},
	{
		name = "Corvette_hw1",
		numParam = 1,
	},
	{
		name = "Frigate",
		numParam = 1,
	},
	{
		name = "Utility",
		numParam = 1,
	},
	{
		name = "Munition",
		numParam = 1,
	},
	{
		name = "SmallCapitalShip",
		numParam = 1,
	},
	{
		name = "BigCapitalShip",
		numParam = 1,
	},
	{
		name = "Mothership",
		numParam = 1,
	},
	{
		name = "Emplacement",
		numParam = 1,
	},
	{
		name = "UnAttackable",
		numParam = 0,
	},
	{
		name = "SubSystem",
		numParam = 1,
	},
	{
		name = "Resource",
		numParam = 1,
	},
	{
		name = "ResourceLarge",
		numParam = 1,
	},
	{
		name = "Capturer",
		numParam = 1,
	},
	{
		name = "Chimera",
		numParam = 1,
	},
    --This family added in to work around a potiential bug in the HomeworldClassic campaign
    --whereby some missions request CLASS_CapitalShips, which does not exist.
    --This should have resulted in nothing being selected, which is what we are here emulating.
	{
		name = "NonsenseFamily",
		numParam = 1,
	},
	{
		name = "NonCombat",
		numParam = 1,
	},
-- Grouping Families
	{
		name = "Fighter_Scout",
		numParam = 1,
	},
	{
		name = "Fighter_EMPScout",
		numParam = 1,
	},
	{
		name = "Fighter_Bomber",
		numParam = 1,
	},
	{
		name = "Fighter_Defender",
		numParam = 1,
	},
	{
		name = "Fighter_Special",
		numParam = 1,
	},
	{
		name = "Fighter_Lance",
		numParam = 1,
	},
	{
		name = "Corvette_Laser",
		numParam = 1,
	},
	{
		name = "Corvette_Gunship",
		numParam = 1,
	},
	{
		name = "Corvette_Pulsar",
		numParam = 1,
	},
	{
		name = "Corvette_Missile",
		numParam = 1,
	},
	{
		name = "Corvette_Command",
		numParam = 1,
	},
	{
		name = "Corvette_TuranicMissile",
		numParam = 1,
	},
	{
		name = "Corvette_TuranicStandard",
		numParam = 1,
	},
-- Extra Balance Separation
	{
		name = "Swarmer",
		numParam = 1,
	},
	{
		name = "SpaceMine",
		numParam = 1,
	},
	{
		name = "Torpedo",
		numParam = 1,
	},
	{
		name = "HeavyMissile",
		numParam = 1,
	},
	{
		name = "SmallMissile",
		numParam = 1,
	},
}

------------------------------------------------------------------------------------------------
dockFamily =
{
	{
		name = "Mover"
	},
	{
		name = "Fighter"
	},
	{
		name = "Corvette"
	},
	{
		name = "Frigate"
	},
	{
		name = "Utility"
	},
	{
		name = "Controller"
	},
	{
		name = "Platform"
	},
	{
		name = "SuperCap"
	},
	{
		name = "BattleCruiser"
	},
	{
		name = "Transport"
	},
	{
		name = "Shipyard"
	},
	{
        -- motherships n such
		name = "Flagship"
	},
	{
		name = "Resource"
	},
	{
		name = "Inhibitor"
	},
    {
        -- big things collectors drag back, like the bentus debris
        name = "LargeSalvage"
    },
    {
        -- stuff like the dreadnaught
        name = "UltraCap"
    },
	{
		name = "CantDock"
	},
	{name = "drone"},
	{name = "drone1"},
	{name = "drone2"},
	{name = "drone3"},	
	{name = "ResearchShip"},
	{name = "ResearchShip_1"},
	{name = "ResearchShip_2"},
	{name = "ResearchShip_3"},
	{name = "ResearchShip_4"},	
	{name = "ResearchShip_5"},	
	{name = "fieldgenerator1"},	
	{name = "fieldgenerator2"},
	{name = "fieldgenerator3"},
	{name = "fieldgenerator4"},
	{name = "fieldgenerator5"},
	{name = "fieldgenerator6"},
	{name = "fieldgenerator7"},
	{name = "fieldgenerator8"},
	{name = "Carrier"},
}

------------------------------------------------------------------------------------------------
avoidanceFamily =
{
	{
		name = "None",
		numParam = 0,
	},
	{
		name = "DontAvoid",
		numParam = 1,
	},
	{
		name = "Strikecraft",
		numParam = 2,
	},
	{
		name = "Utility",
		numParam = 3,
	},
	{
		name = "Frigate",
		numParam = 4,
	},
	{
		name = "SmallRock",
		numParam = 5,
	},
	{
		name = "Capital",
		numParam = 6,
	},
	{
		name = "SuperCap",
		numParam = 7,
	},
	{
		name = "BattleCruiser",
		numParam = 8,
	},
	{
		name = "MotherShip",
		numParam = 9,
	},
	{
		name = "BigRock",
		numParam = 10,
	},
	{
		name = "SuperPriority",
		numParam = 11,
	}
}


------------------------------------------------------------------------------------------------
collisionFamily =
{
	{
		name = "Small",
		numParam = 0,
	},
	{
		name = "Big",
		numParam = 1,
	},
	{
		name = "Unmoveable",
		numParam = 2,
	},
}

------------------------------------------------------------------------------------------------
collisionDamageFamily =
{
	{
		name = "SmallShip",
		numParam = 0,
	},
	{
		name = "BigShip",
		numParam = 1,
	},
	{
		name = "SmallRock",
		numParam = 2,
	},
	{
		name = "BigRock",
		numParam = 3,
	},
}


------------------------------------------------------------------------------------------------
autoFormationFamily =
{
	{
		name = "Fighter",
		numParam = 0,
	},
	{
		name = "Corvette",
		numParam = 1,
	},
	{
		name = "Frigate",
		numParam = 2,
	},
	{
		name = "CapShip",
		numParam = 3,
	},
	{
		name = "SuperCap",
		numParam = 4,
	},
}

------------------------------------------------------------------------------------------------
armourFamily =
{
    {
        name = "Unarmoured",
    },
    {
        name = "Unarmoured_hw1",
    },
    {
        name = "LightArmour",
    },
    {
        name = "LightArmour_hw1",
    },
    {
        name = "MediumArmour",
    },
    {
        name = "HeavyArmour",
    },
    {
        name = "SubSystemArmour",
    },
    {
        name = "TurretArmour",
    },
    {
        name = "ResArmour",
    },
    {
        name = "MoverArmour",
    },
    {
        name = "PlanetKillerArmour",
    },
    {
        name = "MineArmour",
    },
    {
        name = "ChunkArmour",
    },
    {
        name = "ResourceArmour",
    },
    {
        name = "GravityWellArmour",
    },
    {
        name = "SwarmerArmor",
    },
    {
        name = "SpaceMineArmor",
    },
    {
        name = "TorpedoArmor",
    },
    {
        name = "HeavyMissileArmor",
    },
    {
        name = "SmallMissileArmor",
    },
    {
        name = "ProbeArmour",
    },
}

-- numParam -> display priority -> order undefined if priority not unique
-- stringPara -> localized display name
unitcapsFamily =
{
	{
		name = "Fighter",
		numParam = 10,
		stringParam = "$2405",

	},

	-- hw1 fighters
	{
		name = "Defenders",
		numParam = 12,
		stringParam = "$10006",
	},
	{
		name = "Defensefighters",
		numParam = 13,
		stringParam = "$10010",
	},
	{
		name = "CloakedFighters",
		numParam = 14,
		stringParam = "$10008",
	},
	-- Hiigaran 
	{
		name = "Interceptor",
		numParam = 15,
		stringParam = "$1502",
	},
	-- Vaygr 
	{
		name = "Scout",
		numParam = 16,
		stringParam = "$1600",
	},

	{
		name = "Bomber",
		numParam = 18,
		stringParam = "$2401",
	},
	{
		name = "LanceFighter",
		numParam = 19,
		stringParam = "$1606",
	},
	{
		name = "Corvette",
		numParam = 20,
		stringParam = "$2406",

	},

	-- Corvettes
	{
		name = "MinelayerCorvette",
		numParam = 21,
		stringParam = "$2135",
	},
	{
		name = "CommandCorvette",
		numParam = 23,
		stringParam = "$1616",
	},
	{
		name = "SalvageCorvette",
		numParam = 22,
		stringParam = "$2408",
	},
	{
		name = "Mover",
		numParam = 28,
		stringParam = "$2121",
	},
	{
		name = "Frigate",
		numParam = 30,
		stringParam = "$2115",

	},
	-- Frigates
	{
		name = "TorpedoFrigate",
		numParam = 31,
		stringParam = "$2122",
	},
	{
		name = "CaptureFrigate",
		numParam = 32,
		stringParam = "$2123",
	},
	{
		name = "DefenseFieldFrigate",
		numParam = 33,
		stringParam = "$2124",
	},
	{
		name = "Capital",
		numParam = 40,
		stringParam = "$2116",

	},
	-- Capital ships	
	{
		name = "Carrier",
		numParam = 41,
		stringParam = "$2126",
	},
	{
		name = "Destroyer",
		numParam = 42,
		stringParam = "$2125",
	},
	{
		name = "MissileDestroyer",
		numParam = 43,
		stringParam = "$10036",
	},
	{
		name = "Battlecruiser",
		numParam = 44,
		stringParam = "$2127",
	},
	{
		name = "HeavyCruiser",
		numParam = 45,
		stringParam = "$2404",
	},
	{
		name = "Shipyard",
		numParam = 46,
		stringParam = "$2128",
	},
	{
		name = "Platform",
		numParam = 50,
		stringParam = "$2117",
	},
	-- Platforms
	{
		name = "HyperspacePlatform",
		numParam = 51,
		stringParam = "$2129",
	},
	{
		name = "Utility",
		numParam = 60,
		stringParam = "$2118",
	},
	-- Utility ships
	{
		name = "Probe",
		numParam = 63,
		stringParam = "$2132",
	},
	{
		name = "ProximitySensor",
		numParam = 64,
		stringParam = "$2134",
	},
	{
		name = "ECMProbe",
		numParam = 65,
		stringParam = "$2133",
	},
	-- Resource	
	{
		name = "Resource",
		numParam = 70,
		stringParam = "$4910",
	},

	{
		name = "ResourceCollector",
		numParam = 71,
		stringParam = "$2130",
	},
	{
		name = "ResourceController",
		numParam = 72,
		stringParam = "$2131",
	},
	{
		name = "NonCombat",
		numParam = 80,
		stringParam = "$4909",
	},	
	{
		name = "Probe_hw1",
		numParam = 87,
		stringParam = "$2132",
	},	
	{
		name = "ProximitySensor_hw1",
		numParam = 88,
		stringParam = "$2134",
	},
	{
		name = "SensorArray",
		numParam = 89,
		stringParam = "$10058",
	},
	{
		name = "CloakGenerator",
		numParam = 90,
		stringParam = "$11558",
	},
	{
		name = "GravWellGenerator",
		numParam = 91,
		stringParam = "$10050",
	},	
	{
		name = "Mothership",
		numParam = 100,
		stringParam = "$2119",
	},
	{
		name = "DreadNaught",
		numParam = 105,
		stringParam = "$2120",
	},
	{
		name = "SPMovers",
		numParam = 110,
		stringParam = "$2121",
	},
	{
		name = "SinglePlayerMisc",
		numParam = 120,
		stringParam = "$4911",
	},
	{
		name = "CommStation",
		numParam = 130,
		show = "Never",
		stringParam = "This should not be displayed",
	},
	{
		name = "Research",
		numParam = 181,
		stringParam = "$10044",
	},
	{
		name = "Research1",
		numParam = 182,
		stringParam = "$10044",
	},
	{
		name = "Research2",
		numParam = 183,
		stringParam = "$10044",
	},
	{
		name = "Research3",
		numParam = 184,
		stringParam = "$10044",
	},
	{
		name = "Research4",
		numParam = 185,
		stringParam = "$10044",
	},
	{
		name = "Research5",
		numParam = 186,
		stringParam = "$10044",
	},

	-- Caps just for Layout, never show!!!
	{
		name = "LayoutFighter",
		show = "Never",
		numParam = 1000,
	},
	{
		name = "LayoutCorvette",
		show = "Never",
		numParam = 1000,
	},
	{
		name = "LayoutFrigate",
		show = "Never",
		numParam = 1000,
	},
	{
		name = "LayoutDestroyer",
		show = "Never",
		numParam = 1000,
	},
	{
		name = "LayoutBattleCruiser",
		show = "Never",
		numParam = 1000,
	},
	{
		name = "LayoutResource",
		show = "Never",
		numParam = 1000,
	},
}