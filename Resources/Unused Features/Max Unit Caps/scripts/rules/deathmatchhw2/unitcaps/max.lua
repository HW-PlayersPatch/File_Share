supplyLimit("Fighter", 250);

supplyLimit("Scout", 250);
supplyLimit("Interceptor", 250);
supplyLimit("Bomber", 250);
supplyLimit("LanceFighter", 250);
supplyLimit("Defenders", 250);
supplyLimit("Defensefighters", 250);
supplyLimit("CloakedFighters", 250);
--
-- Vaygr FamilyOverride Fighter 410
-- Vaygr ShipOverride Interceptor 350
-- Vaygr ShipOverride Bomber 350
--
supplyLimit("Corvette", 250);

supplyLimit("MinelayerCorvette",250);
supplyLimit("CommandCorvette",250);
supplyLimit("SalvageCorvette",250);
--
-- Vaygr FamilyOverride Corvette 200
--
supplyLimit("Frigate", 250);

supplyLimit("DefenseFieldFrigate",250);
supplyLimit("CaptureFrigate",250);
--
supplyLimit("Capital", 250);

supplyLimit("Destroyer", 250);
supplyLimit("MissileDestroyer", 250);	
supplyLimit("Carrier", 250);
supplyLimit("Battlecruiser",250);
supplyLimit("HeavyCruiser",250);
supplyLimit("Shipyard", 1);
--
supplyLimit("Utility", 250);

supplyLimit("Probe", 250);
supplyLimit("ECMProbe", 250);
supplyLimit("ProximitySensor", 250);
--
supplyLimit("Resource", 250);

supplyLimit("ResourceCollector", 250);
supplyLimit("ResourceController", 250);
--
supplyLimit("NonCombat", 250);

supplyLimit("Probe_hw1", 250);
supplyLimit("ProximitySensor_hw1", 250);
supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);
supplyLimit("CloakGenerator", 250);
supplyLimit("GravWellGenerator", 250);
supplyLimit("SensorArray", 250);
--
supplyLimit("Platform", 250);

supplyLimit("HyperspacePlatform", 250);
--
supplyLimit("Mothership", 1);
--
supplyLimit("SinglePlayerMisc", 250);



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


