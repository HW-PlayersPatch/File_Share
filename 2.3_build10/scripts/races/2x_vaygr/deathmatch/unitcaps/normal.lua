supplyLimit("Fighter", 160);

supplyLimit("Scout", 36);
supplyLimit("Interceptor", 160);
supplyLimit("Bomber", 160);
supplyLimit("LanceFighter", 160);
supplyLimit("Defenders", 40);
supplyLimit("Defensefighters", 20);
supplyLimit("CloakedFighters", 40);
--
-- Vaygr FamilySupplyOverride Fighter 108
-- Vaygr ShipSupplyOverride Interceptor 108
-- Vaygr ShipSupplyOverride Bomber 108
--
supplyLimit("Corvette", 84);

supplyLimit("MinelayerCorvette",8);
supplyLimit("CommandCorvette",4);
supplyLimit("SalvageCorvette",28);
--
-- Vaygr FamilySupplyOverride Corvette 56
--
supplyLimit("Frigate", 42);

supplyLimit("DefenseFieldFrigate",4);
supplyLimit("CaptureFrigate",12);
--
-- Kushan FamilySupplyOverride Frigate 24
-- Taiidan FamilySupplyOverride Frigate 24		
--
supplyLimit("Capital", 24);

supplyLimit("Destroyer", 10);
supplyLimit("MissileDestroyer", 4);
supplyLimit("Carrier", 8);
supplyLimit("Battlecruiser",4);
supplyLimit("HeavyCruiser",4);
supplyLimit("Shipyard", 2);

--
-- Vaygr FamilySupplyOverride Capital 15
--

supplyLimit("Utility", 88);

supplyLimit("Probe", 12);
supplyLimit("ECMProbe", 12);
supplyLimit("ProximitySensor", 12);

--
supplyLimit("NonCombat", 60);

supplyLimit("Probe_hw1", 12);
supplyLimit("ProximitySensor_hw1", 12);
supplyLimit("CloakGenerator", 8);
supplyLimit("GravWellGenerator", 8);
supplyLimit("SensorArray", 8);

supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);

--
supplyLimit("Resource", 52);

supplyLimit("ResourceCollector", 44);
supplyLimit("ResourceController", 8);

--
supplyLimit("Platform", 42);

supplyLimit("HyperspacePlatform", 12);
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


