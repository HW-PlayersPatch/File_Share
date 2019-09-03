supplyLimit("Fighter", 220);

supplyLimit("Scout", 48);
supplyLimit("Interceptor", 220);
supplyLimit("Bomber", 220);
supplyLimit("LanceFighter", 220);
supplyLimit("Defenders", 50);
supplyLimit("Defensefighters", 30);
supplyLimit("CloakedFighters", 50);
--
-- Vaygr FamilyOverride Fighter 170
-- Vaygr ShipOverride Interceptor 140
-- Vaygr ShipOverride Bomber 140
--
supplyLimit("Corvette", 120);

supplyLimit("MinelayerCorvette",12);
supplyLimit("CommandCorvette",6);
supplyLimit("SalvageCorvette",36);
--
-- Vaygr FamilyOverride Corvette 80
--
supplyLimit("Frigate", 60);

supplyLimit("DefenseFieldFrigate",6);
supplyLimit("CaptureFrigate",16);		
--
-- Kushan FamilyOverride Frigate 24
-- Taiidan FamilyOverride Frigate 24	
--
supplyLimit("Capital", 32);
	
supplyLimit("Destroyer", 14);
supplyLimit("MissileDestroyer", 6);
supplyLimit("Carrier", 10);
supplyLimit("Battlecruiser",6);
supplyLimit("HeavyCruiser",6);
supplyLimit("Shipyard", 2);
--
supplyLimit("Utility", 110);

supplyLimit("Probe", 16);
supplyLimit("ECMProbe", 16);
supplyLimit("ProximitySensor", 16);
--
supplyLimit("Resource", 62);

supplyLimit("ResourceCollector", 52);
supplyLimit("ResourceController", 10);
--
supplyLimit("NonCombat", 80);

supplyLimit("Probe_hw1", 16);
supplyLimit("ProximitySensor_hw1", 16);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 12);
supplyLimit("GravWellGenerator", 12);
supplyLimit("SensorArray", 12);
--
supplyLimit("Platform", 60);

supplyLimit("HyperspacePlatform", 16);
--
supplyLimit("Mothership", 2);
--
supplyLimit("SinglePlayerMisc", 200);




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


