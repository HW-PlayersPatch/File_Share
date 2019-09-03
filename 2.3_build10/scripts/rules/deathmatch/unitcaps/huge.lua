supplyLimit("Fighter", 125);

supplyLimit("Scout", 30);
supplyLimit("Interceptor", 125);
supplyLimit("Bomber", 125);
supplyLimit("LanceFighter", 125);
supplyLimit("Defenders", 30);
supplyLimit("Defensefighters", 20);
supplyLimit("CloakedFighters", 30);
--
-- Vaygr FamilyOverride Fighter 205
-- Vaygr ShipOverride Interceptor 175
-- Vaygr ShipOverride Bomber 175
--
supplyLimit("Corvette", 75);

supplyLimit("MinelayerCorvette",8);
supplyLimit("CommandCorvette",4);
supplyLimit("SalvageCorvette",22);
--
-- Vaygr FamilyOverride Corvette 100
--
supplyLimit("Frigate", 35);

supplyLimit("DefenseFieldFrigate",4);
supplyLimit("CaptureFrigate",10);
--
supplyLimit("Capital", 25);

supplyLimit("Destroyer", 14);
supplyLimit("MissileDestroyer", 6);	
supplyLimit("Carrier", 4);
supplyLimit("Battlecruiser",6);
supplyLimit("HeavyCruiser",6);
supplyLimit("Shipyard", 1);
--
supplyLimit("Utility", 71);

supplyLimit("Probe", 12);
supplyLimit("ECMProbe", 12);
supplyLimit("ProximitySensor", 12);
--
supplyLimit("Resource", 35);

supplyLimit("ResourceCollector", 30);
supplyLimit("ResourceController", 5);
--
supplyLimit("NonCombat", 60);

supplyLimit("Probe_hw1", 12);
supplyLimit("ProximitySensor_hw1", 12);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 10);
supplyLimit("GravWellGenerator", 10);
supplyLimit("SensorArray", 10);
--
supplyLimit("Platform", 35);

supplyLimit("HyperspacePlatform", 10);
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


