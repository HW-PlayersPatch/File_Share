supplyLimit("Fighter", 86);

supplyLimit("Scout", 30);
supplyLimit("Interceptor", 80);
supplyLimit("Bomber", 80);
supplyLimit("LanceFighter", 60);
supplyLimit("Defenders", 24);
supplyLimit("Defensefighters", 10);
supplyLimit("CloakedFighters", 24);
--
-- Vaygr FamilyOverride Fighter 56
-- Vaygr ShipOverride Interceptor 56
-- Vaygr ShipOverride Bomber 56
--
supplyLimit("Corvette", 48);

supplyLimit("MinelayerCorvette",4);
supplyLimit("CommandCorvette",4);
supplyLimit("SalvageCorvette",20);
--
-- Vaygr FamilyOverride Corvette 32
--
supplyLimit("Frigate", 24);

supplyLimit("DefenseFieldFrigate",2);
supplyLimit("CaptureFrigate",8);
--



supplyLimit("Capital", 20);

supplyLimit("Destroyer", 10);
supplyLimit("MissileDestroyer", 2);
supplyLimit("Carrier", 4);
supplyLimit("Battlecruiser",4);
supplyLimit("HeavyCruiser",4);
supplyLimit("Shipyard", 2);
--
supplyLimit("Utility", 66);
supplyLimit("Probe", 8);
supplyLimit("ECMProbe", 8);
supplyLimit("ProximitySensor", 8);
--
supplyLimit("Resource", 42);
supplyLimit("ResourceCollector", 36);
supplyLimit("ResourceController", 6);
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
supplyLimit("CloakGenerator", 4);
supplyLimit("GravWellGenerator", 4);
supplyLimit("SensorArray", 4);
--
supplyLimit("Platform", 24);
supplyLimit("HyperspacePlatform", 8);
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


