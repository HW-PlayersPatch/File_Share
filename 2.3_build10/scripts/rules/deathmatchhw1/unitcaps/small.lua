supplyLimit("Fighter", 40);

supplyLimit("Scout", 12);
supplyLimit("Interceptor", 40);
supplyLimit("Bomber", 40);
supplyLimit("LanceFighter", 30);
supplyLimit("Defenders", 12);
supplyLimit("Defensefighters", 5);
supplyLimit("CloakedFighters", 12);
--
-- Vaygr FamilyOverride Fighter 56
-- Vaygr ShipOverride Interceptor 56
-- Vaygr ShipOverride Bomber 56
--
supplyLimit("Corvette", 24);

supplyLimit("MinelayerCorvette",2);
supplyLimit("CommandCorvette",2);
supplyLimit("SalvageCorvette",10);
--
-- Vaygr FamilyOverride Corvette 32
--
supplyLimit("Frigate", 12);

supplyLimit("DefenseFieldFrigate",1);
supplyLimit("CaptureFrigate",4);
--



supplyLimit("Capital", 10);

supplyLimit("Destroyer", 5);
supplyLimit("MissileDestroyer", 1);
supplyLimit("Carrier", 2);
supplyLimit("Battlecruiser",2);
supplyLimit("HeavyCruiser",2);
supplyLimit("Shipyard", 1);
--
supplyLimit("Utility", 33);
supplyLimit("Probe", 4);
supplyLimit("ECMProbe", 4);
supplyLimit("ProximitySensor", 4);
--
supplyLimit("Resource", 21);
supplyLimit("ResourceCollector", 18);
supplyLimit("ResourceController", 3);
--
supplyLimit("NonCombat", 20);
supplyLimit("Probe_hw1", 4);
supplyLimit("ProximitySensor_hw1", 4);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 2);
supplyLimit("GravWellGenerator", 2);
supplyLimit("SensorArray", 2);
--
supplyLimit("Platform", 12);
supplyLimit("HyperspacePlatform", 4);
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


