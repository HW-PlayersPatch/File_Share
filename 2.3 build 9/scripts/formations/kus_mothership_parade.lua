--===========================================================================
--            -Kus MotherShip Parade formation
--===========================================================================

-- format   slot-name   vector-offset    vector-heading  vector-direction of growth     size-of-growth (set to 0 if want default)
-- offset determines offset from center of formation {+left/-right, +up/-down, +front/-back}
-- heading determines heading, use { 0,0,1 } for forward
-- direction of growth determines how new formations will grow out
-- size of growth determines how spaced out additional formations are.  Set to 0 for default
-- one slot MUST be called "misc", leftovers will get put here

paradeSlot("Kus_Scout",							{-850, -500, 2000},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("Kus_Interceptor",				{-850, -500, 1800},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("Kus_AttackBomber",			{-850, -500, 1600},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("Kus_Defender",					{-850, -500, 1400},	 {0,0,1},	{-1,0,0},	70);
paradeSlot("kus_CloakedFighter",		{-850, -500, 1200},	 {0,0,1},	{-1,0,0},	70);

paradeSlot("Kus_LightCorvette",			{-850, -500, 1000},	 {0,0,1},	{-1,0,0},	105);
paradeSlot("Kus_HeavyCorvette",			{-850, -500, 800},	 {0,0,1},	{-1,0,0},	105);
paradeSlot("Kus_SalvageCorvette",		{-850, -500, 600},	 {0,0,1},	{-1,0,0},	123);
paradeSlot("Kus_RepairCorvette", 		{-850, -500, 400},	 {0,0,1},	{-1,0,0},	123);
paradeSlot("Kus_MultiGunCorvette",	{-850, -500, 200},	 {0,0,1},	{-1,0,0},	105);
paradeSlot("Kus_MinelayerCorvette",	{-850, -500, 0},		 {0,0,1},	{-1,0,0},	105);

paradeSlot("Kus_AssaultFrigate",		{-850, -500, -350},	 {0,0,1},	{-1,0,0},	300);
paradeSlot("Kus_IonCannonFrigate",	{-850, -500, -700},	 {0,0,1},	{-1,0,0},	300);
paradeSlot("Kus_SupportFrigate",		{-850, -500, -1050}, {0,0,1},	{-1,0,0},	300);
paradeSlot("Kus_DroneFrigate",			{-850, -500, -1400}, {0,0,1},	{-1,0,0},	300);

paradeSlot("Kus_ResourceCollector",	{850, -500, -600},	 {0,0,1},	{1,0,0},	175);
paradeSlot("Kus_ResourceController",{850, -500, -1000},	 {0,0,1},	{1,0,0},	400);

paradeSlot("Kus_Destroyer",					{1100, -500, 1500},	 {0,0,1},	{1,0,0},	600);
paradeSlot("Kus_MissileDestroyer",	{1100, -500, 900},	 {0,0,1},	{1,0,0},	600);
paradeSlot("Kus_HeavyCruiser",			{1100, -500, 200},	 {0,0,1},	{1,0,0},	700);
paradeSlot("Kus_Carrier",		  			{0, -500, 1500},		 {0,0,1},	{0,-1,0},	700);

-- paradeSlot("Kus_ResearchShip",			{-400, 0, -900},		 {0,0,1},	{-1,0,0},	350);
-- paradeSlot("kus_cloakgenerator",		{400, 0, -1300},		 {0,0,1},	{1,0,0},	350);
-- paradeSlot("Kus_GravWellGenerator",	{400, 0, -900},			 {0,0,1},	{1,0,0},	350);
-- paradeSlot("kus_sensorarray",				{-400, 0, -1300},		 {0,0,1},	{-1,0,0},	350);

paradeSlot("Kus_ResearchShip",			{-400, 0, -900},		 {0,0,1},	{-1,0,0},	350);
paradeSlot("Kus_SensorArray",				{400, 0, -900},		   {0,0,1},	{1,0,0},	350);
paradeSlot("Kus_CloakGenerator",		{-400, 0, -1300},		 {0,0,1},	{-1,0,0},	350);
paradeSlot("Kus_GravWellGenerator",	{400, 0, -1300},		 {0,0,1},	{1,0,0},	350);
paradeSlot("Kus_ProximitySensor",				{100, 0, -1300},		 {0,0,1},	{0,1,0},	100);


-- Begin of new slots for some possible salvaged ships											 
paradeSlot("Tai_Destroyer",					{1100, -1200, 1500},	 {0,0,1},	{1,0,0},	600);
paradeSlot("Tai_MissileDestroyer",	{1100, -1200, 900},	 {0,0,1},	{1,0,0},	600);
paradeSlot("Tai_HeavyCruiser",			{1100, -1200, 200},	 {0,0,1},	{1,0,0},	700);
paradeSlot("Tai_Carrier",		  			{0, 500, 1500},		 {0,0,1},	{0,1,0},	700);
-- paradeSlot("Tai_Carrier",		  			{-1100, -1200, 1500},		 {0,0,1},	{-1,0,0},	700);

paradeSlot("Tur_StandardCorvette",			{1100, 300, 900}, {0,0,1},	{1,0,0},	125);
paradeSlot("Tur_MissileCorvette",			{1100, 300, 700}, {0,0,1},	{1,0,0},	125);
paradeSlot("Tur_IonArrayFrigate",			{1100, 300, 350}, {0,0,1},	{1,0,0},	0);
paradeSlot("Kad_MultibeamFrigate",			{1100, 300, 0}, {0,0,1},	{1,0,0},	150);
paradeSlot("Tai_AssaultFrigate",		{1100, 300, -350},	 {0,0,1},	{1,0,0},	150);
paradeSlot("Tai_IonCannonFrigate",	{1100, 300, -700},	 {0,0,1},	{1,0,0},	150);
paradeSlot("Tai_SupportFrigate",		{1100, 300, -1050}, {0,0,1},	{1,0,0},	150);
paradeSlot("Tai_FieldFrigate",		{1100, 300, -1400}, {0,0,1},	{1,0,0},	150);

paradeSlot("Tai_ResourceCollector",	{850, -750, -600},	 {0,0,1},	{1,0,0},	175);
paradeSlot("Tai_ResourceController",{850, -750, -1000},	 {0,0,1},	{1,0,0},	400);
-- End of new slots for some possible salvaged ships 

paradeSlot("misc",									{1100, 1100, -175},		 {0,0,1},	{1,0,0}, 	0); 
paradeSlot("strikegroup",							{-1100, 750, -200},		 {0,0,1},	{-1,0,-0.20}, 	525); 
