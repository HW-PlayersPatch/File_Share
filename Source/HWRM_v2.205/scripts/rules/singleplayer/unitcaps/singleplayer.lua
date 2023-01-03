supplyLimit("Fighter", 70);

supplyLimit("Scout", 18);
supplyLimit("Interceptor", 70);
supplyLimit("Bomber", 70);

--
supplyLimit("Corvette", 42);
supplyLimit("MinelayerCorvette",4);
supplyLimit("SalvageCorvette",14);
--
supplyLimit("Frigate", 21);
supplyLimit("DefenseFieldFrigate",2);
supplyLimit("CaptureFrigate",6);		
--
supplyLimit("Capital", 14);
supplyLimit("Destroyer", 6);
supplyLimit("MissileDestroyer", 2);
supplyLimit("Carrier", 4);
supplyLimit("Battlecruiser",3);
supplyLimit("HeavyCruiser",3);
supplyLimit("Shipyard", 1);
--
supplyLimit("Utility", 30);
supplyLimit("Probe", 10);
supplyLimit("ECMProbe", 10);
supplyLimit("ProximitySensor", 10);
--
supplyLimit("Resource", 25);
supplyLimit("ResourceCollector", 20);
supplyLimit("ResourceController", 5);
--
supplyLimit("NonCombat", 25);
supplyLimit("Probe_hw1", 6);
supplyLimit("ProximitySensor_hw1", 6);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 4);
supplyLimit("GravWellGenerator", 4);
supplyLimit("SensorArray", 4);

--
supplyLimit("Platform", 20);
supplyLimit("HyperspacePlatform", 4);

--
supplyLimit("Mothership", 1);

--
supplyLimit("DreadNaught", 1);

supplyLimit("SinglePlayerMisc", 100);

--
supplyLimit("SinglePlayerMisc", 100);
supplyLimit("Mover", 10);		-- max 10 movers

--	
supplyLimit("SPMovers", 10);

--
supplyLimit("CommStation", 1 );



-- Generic Indents
supplyIndent("Scout", 1);
supplyIndent("Interceptor", 1);
supplyIndent("Bomber", 1);

supplyIndent("MinelayerCorvette", 1);

supplyIndent("Destroyer", 1);
supplyIndent("Carrier", 1);


-- Race Specific Indents
supplyIndent("LanceFighter", 1);
supplyIndent("Defenders", 1);
supplyIndent("Defensefighters", 1);
supplyIndent("CloakedFighters", 1);

supplyIndent("CommandCorvette", 1);
supplyIndent("SalvageCorvette", 1);

supplyIndent("DefenseFieldFrigate", 1);
supplyIndent("CaptureFrigate", 1);

supplyIndent("MissileDestroyer", 1);
supplyIndent("Battlecruiser", 1);
supplyIndent("HeavyCruiser", 1);
supplyIndent("Shipyard", 1);

supplyIndent("ResourceCollector", 1);
supplyIndent("ResourceController", 1);

supplyIndent("Probe", 1);
supplyIndent("Probe_hw1", 1);

supplyIndent("ProximitySensor", 1);
supplyIndent("ProximitySensor_hw1", 1);

supplyIndent("CloakGenerator", 1);
supplyIndent("GravWellGenerator", 1);
supplyIndent("ECMProbe", 1);
supplyIndent("SensorArray", 1);

supplyIndent("HyperspacePlatform", 1);


-- Display Rules
supplyShow("Fighter", "Always");
supplyShow("Corvette", "Always");
supplyShow("Frigate", "Always");
supplyShow("Capital", "Always");

supplyShow("Utility", "NotEmpty");
supplyShow("Resource", "NotEmpty");
supplyShow("Platform", "NotEmpty");

supplyShow("Mothership", "Never");
supplyShow("SinglePlayerMisc", "Never");

supplyShow("NonCombat", "NotEmpty");

supplyShow("Research", "Never");
supplyShow("Research1", "Never");
supplyShow("Research2", "Never");
supplyShow("Research3", "Never");
supplyShow("Research4", "Never");
supplyShow("Research5", "Never");





