supplyLimit("Fighter", 100);

supplyLimit("Scout", 24);
supplyLimit("Interceptor", 100);
supplyLimit("Bomber", 100);
supplyLimit("LanceFighter", 100);
supplyLimit("Defenders", 25);
supplyLimit("Defensefighters", 15);
supplyLimit("CloakedFighters", 25);
--
-- Vaygr FamilyOverride Fighter 170
-- Vaygr ShipOverride Interceptor 140
-- Vaygr ShipOverride Bomber 140
--
supplyLimit("Corvette", 60);

supplyLimit("MinelayerCorvette",6);
supplyLimit("CommandCorvette",3);
supplyLimit("SalvageCorvette",18);
--
-- Vaygr FamilyOverride Corvette 80
--
supplyLimit("Frigate", 30);

supplyLimit("DefenseFieldFrigate",3);
supplyLimit("CaptureFrigate",8);		
--
-- Kushan FamilyOverride Frigate 24
-- Taiidan FamilyOverride Frigate 24	
--
supplyLimit("Capital", 15);
	
supplyLimit("Destroyer", 7);
supplyLimit("MissileDestroyer", 3);
supplyLimit("Carrier", 4);
supplyLimit("Battlecruiser",3);
supplyLimit("HeavyCruiser",3);
supplyLimit("Shipyard", 1);
--
supplyLimit("Utility", 55);

supplyLimit("Probe", 8);
supplyLimit("ECMProbe", 8);
supplyLimit("ProximitySensor", 8);
--
supplyLimit("Resource", 31);

supplyLimit("ResourceCollector", 26);
supplyLimit("ResourceController", 5);
--
supplyLimit("NonCombat", 40);

supplyLimit("Probe_hw1", 8);
supplyLimit("ProximitySensor_hw1", 8);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 6);
supplyLimit("GravWellGenerator", 6);
supplyLimit("SensorArray", 6);
--
supplyLimit("Platform", 30);

supplyLimit("HyperspacePlatform", 8);
--
supplyLimit("Mothership", 1);
--
supplyLimit("SinglePlayerMisc", 100);




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


