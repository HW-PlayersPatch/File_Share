--===========================================================================
--            -Tai MotherShip Parade formation
--===========================================================================

-- format   slot-name   vector-offset    vector-heading  vector-direction of growth     size-of-growth (set to 0 if want default)
-- offset determines offset from center of formation {+left/-right, +up/-down, +front/-back}
-- heading determines heading, use { 0,0,1 } for forward
-- direction of growth determines how new formations will grow out
-- size of growth determines how spaced out additional formations are.  Set to 0 for default
-- one slot MUST be called "misc", leftovers will get put here

paradeSlot("Tai_Scout",							{-700, -50, 2000},	{0,0,1},	{-1,0,0},	70);
paradeSlot("Tai_Interceptor",				{-700, -50, 1800},	{0,0,1},	{-1,0,0},	70);
paradeSlot("Tai_AttackBomber",			{-700, -50, 1600},	{0,0,1},	{-1,0,0},	70);
paradeSlot("tai_defender",					{-700, -50, 1400},	{0,0,1},	{-1,0,0},	70);
paradeSlot("tai_defensefighter",		{-700, -50, 1200},	{0,0,1},	{-1,0,0},	70);

paradeSlot("Tai_LightCorvette",			{-700, -250, 2000},	{0,0,1},	{-1,0,0},	105);
paradeSlot("Tai_HeavyCorvette",			{-700, -250, 1800},	{0,0,1},	{-1,0,0},	105);
paradeSlot("Tai_RepairCorvette",		{-700, -250, 1600},	{0,0,1},	{-1,0,0},	123);
paradeSlot("Tai_SalvageCorvette",		{-700, -250, 1400},	{0,0,1},	{-1,0,0},	123);
paradeSlot("Tai_MultiGunCorvette",	{-700, -250, 1200},	{0,0,1},	{-1,0,0},	105);
paradeSlot("Tai_MinelayerCorvette",	{-700, -250, 1000},	{0,0,1},	{-1,0,0},	105);

paradeSlot("Tai_AssaultFrigate",		{-700, -525, 2000},	{0,0,1},	{-1,0,0},	350);
paradeSlot("Tai_IonCannonFrigate",	{-700, -525, 1700},	{0,0,1},	{-1,0,0},	350);
paradeSlot("tai_supportfrigate",		{-700, -525, 1400},	{0,0,1},	{-1,0,0},	350);
paradeSlot("tai_fieldfrigate",			{-700, -525, 1100},	{0,0,1},	{-1,0,0},	350);

paradeSlot("Tai_ResourceCollector",	{-2100, 50, -200},	{0,0,1},	{-1,0,0},	210);
paradeSlot("Tai_ResourceController",	{-2100, 100, -600},	{0,0,1},	{-1,0,0},	455);

paradeSlot("Tai_Destroyer",					{700, 150, 1700},		{0,0,1},	{1,0,0},	525);
paradeSlot("tai_MissileDestroyer",	{700, -250, 1700},	{0,0,1},	{1,0,0},	525);
paradeSlot("Tai_HeavyCruiser",			{700, -600, 1700},	{0,0,1},	{1,0,0},	700);
paradeSlot("Tai_Carrier",						{100, -550, 1700},		{0,0,1},	{0,-1,0},	770);

paradeSlot("Tai_ResearchShip",			{-400, -250, -1200},{0,0,1},	{-1,0,0},	350);
paradeSlot("Tai_sensorarray",				{400, -250, -1200}, {0,0,1},  {1,0,0},	350);
paradeSlot("Tai_cloakgenerator",		{-400, -250, -1600},{0,0,1},  {-1,0,0},	350);
paradeSlot("Tai_GravWellGenerator",	{400, -250, -1600},	{0,0,1},	{1,0,0},	350);

paradeSlot("misc",									{2100, 350, -600},	{0,0,1},	{1,0,0},	525); 
paradeSlot("strikegroup",							{-2100, 350, 600},	{0,0,1},	{-1,0,0.20},	525); 

-- Begin of new slots for some Kushan ships parade with salvaged Tai Carrier in singleplayer, because this parade file is also for Carrier. 											 
paradeSlot("Kus_Scout",							{-850, 500, 2000},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("Kus_Interceptor",				{-850, 500, 1800},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("Kus_AttackBomber",			{-850, 500, 1600},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("Kus_Defender",					{-850, 500, 1400},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("kus_CloakedFighter",		{-850, 500, 1200},	 {0,0,1},	{-1,0,0},	70);

paradeSlot("Kus_LightCorvette",			{-850, 500, 1000},	 {0,0,1},	{-1,0,0},	105);
paradeSlot("Kus_HeavyCorvette",			{-850, 500, 800},	 {0,0,1},	{-1,0,0},	105);
paradeSlot("Kus_SalvageCorvette",		{-850, 500, 600},	 {0,0,1},	{-1,0,0},	123);
paradeSlot("Kus_RepairCorvette", 		{-850, 500, 400},	 {0,0,1},	{-1,0,0},	123);
paradeSlot("Kus_MultiGunCorvette",	{-850, 500, 200},	 {0,0,1},	{-1,0,0},	105);
paradeSlot("Kus_MinelayerCorvette",	{-850, 500, 0},		 {0,0,1},	{-1,0,0},	105);
-- End of new slots for some Kushan ships parade
