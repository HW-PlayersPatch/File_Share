supplyLimit("Fighter", 250);

supplyLimit("Scout", 60);
supplyLimit("Interceptor", 250);
supplyLimit("Bomber", 250);
supplyLimit("LanceFighter", 250);
supplyLimit("Defenders", 60);
supplyLimit("Defensefighters", 40);
supplyLimit("CloakedFighters", 60);
--
-- Vaygr FamilyOverride Fighter 205
-- Vaygr ShipOverride Interceptor 175
-- Vaygr ShipOverride Bomber 175
--
supplyLimit("Corvette", 150);

supplyLimit("MinelayerCorvette",16);
supplyLimit("CommandCorvette",8);
supplyLimit("SalvageCorvette",44);
--
-- Vaygr FamilyOverride Corvette 100
--
supplyLimit("Frigate", 70);

supplyLimit("DefenseFieldFrigate",8);
supplyLimit("CaptureFrigate",20);
--
supplyLimit("Capital", 50);

supplyLimit("Destroyer", 28);
supplyLimit("MissileDestroyer", 12);	
supplyLimit("Carrier", 8);
supplyLimit("Battlecruiser",12);
supplyLimit("HeavyCruiser",12);
supplyLimit("Shipyard", 2);
--
supplyLimit("Utility", 142);

supplyLimit("Probe", 24);
supplyLimit("ECMProbe", 24);
supplyLimit("ProximitySensor", 24);
--
supplyLimit("Resource", 70);

supplyLimit("ResourceCollector", 60);
supplyLimit("ResourceController", 10);
--
supplyLimit("NonCombat", 120);

supplyLimit("Probe_hw1", 24);
supplyLimit("ProximitySensor_hw1", 24);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 20);
supplyLimit("GravWellGenerator", 20);
supplyLimit("SensorArray", 20);
--
supplyLimit("Platform", 70);

supplyLimit("HyperspacePlatform", 20);
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


