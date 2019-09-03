supplyLimit("Fighter", 250);

supplyLimit("Scout", 120);
supplyLimit("Interceptor", 250);
supplyLimit("Bomber", 250);
supplyLimit("LanceFighter", 250);
supplyLimit("Defenders", 120);
supplyLimit("Defensefighters", 80);
supplyLimit("CloakedFighters", 120);
--
-- Vaygr FamilyOverride Fighter 410
-- Vaygr ShipOverride Interceptor 350
-- Vaygr ShipOverride Bomber 350
--
supplyLimit("Corvette", 250);

supplyLimit("MinelayerCorvette",32);
supplyLimit("CommandCorvette",16);
supplyLimit("SalvageCorvette",88);
--
-- Vaygr FamilyOverride Corvette 200
--
supplyLimit("Frigate", 140);

supplyLimit("DefenseFieldFrigate",16);
supplyLimit("CaptureFrigate",40);
--
supplyLimit("Capital", 98);

supplyLimit("Destroyer", 56);
supplyLimit("MissileDestroyer", 24);	
supplyLimit("Carrier", 16);
supplyLimit("Battlecruiser",24);
supplyLimit("HeavyCruiser",24);
supplyLimit("Shipyard", 2);
--
supplyLimit("Utility", 250);

supplyLimit("Probe", 48);
supplyLimit("ECMProbe", 48);
supplyLimit("ProximitySensor", 48);
--
supplyLimit("Resource", 140);

supplyLimit("ResourceCollector", 120);
supplyLimit("ResourceController", 20);
--
supplyLimit("NonCombat", 240);

supplyLimit("Probe_hw1", 48);
supplyLimit("ProximitySensor_hw1", 48);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 40);
supplyLimit("GravWellGenerator", 40);
supplyLimit("SensorArray", 40);
--
supplyLimit("Platform", 140);

supplyLimit("HyperspacePlatform", 40);
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


