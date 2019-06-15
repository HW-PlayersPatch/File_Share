--Kushan
--supplyLimit("Fighter", 70);
--supplyLimit("Corvette", 42);
--supplyLimit("Destroyer",6);


supplyLimit("Fighter", 70);
supplyLimit("Interceptor", 70);
supplyLimit("Bomber", 70);
supplyLimit("Defenders", 35);
supplyLimit("CloakedFighters", 35);

supplyLimit("Corvette", 42);
supplyLimit("SalvageCorvette",14);

supplyLimit("Frigate", 21);

supplyLimit("Capital", 15);

supplyLimit("Destroyer", 6);

supplyLimit("Battlecruiser",3);
supplyLimit("HeavyCruiser",3);

supplyDesc("Battlecruiser","HeavyCruiser");

--
supplyLimit("NonCombat", 30);

supplyLimit("Probe_hw1", 6);
supplyLimit("ProximitySensor_hw1", 6);
supplyLimit("CloakGenerator", 4);
supplyLimit("GravWellGenerator", 4);
supplyLimit("SensorArray", 4);

supplyLimit("Research", 1);
supplyLimit("Research1", 1);
supplyLimit("Research2", 1);
supplyLimit("Research3", 1);
supplyLimit("Research4", 1);
supplyLimit("Research5", 1);

--
supplyLimit("Resource", 26);

supplyLimit("ResourceCollector", 22);
supplyLimit("ResourceController", 4);

--
--
supplyLimit("Mothership", 1);
--
supplyLimit("SinglePlayerMisc", 100);



-- Generic Indents
supplyIndent("Scout", 1);

supplyIndent("Destroyer", 1);
supplyIndent("Carrier", 1);


-- Race Specific Indents

supplyIndent("SalvageCorvette", 1);

supplyIndent("MissileDestroyer", 1);
supplyIndent("Battlecruiser", 1);
supplyIndent("HeavyCruiser", 1);

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



-- Display Rules
supplyShow("Fighter", "Always");
supplyShow("Corvette", "Always");
supplyShow("Frigate", "Always");
supplyShow("Capital", "Always");

supplyShow("Utility", "Never");
supplyShow("Resource", "NotEmpty");
supplyShow("Platform", "Never");

supplyShow("Mothership", "Never");
supplyShow("SinglePlayerMisc", "Never");

supplyShow("NonCombat", "NotEmpty");

supplyShow("Research", "Never");
supplyShow("Research1", "Never");
supplyShow("Research2", "Never");
supplyShow("Research3", "Never");
supplyShow("Research4", "Never");
supplyShow("Research5", "Never");

