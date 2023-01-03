-- =============================================================================
--     Name    : vol.mc
--     Purpose : macro script for setting volume spheres and patch parameters
--
--     Created 4/16/2001 by egeorges
--     Copyright Relic Entertainment, Inc.  All rights reserved.
-- =============================================================================

--showPatchVol(1)

-- THIS IS A PARAMETER LIST FOR TWEAKING "ETG AND SHIP" PATCHES
-- NOTES: For Loop positions (specify the SMP * 2) 
--        Also 0 = start; -1 == End of Wave;
--        loopcount of 0 = infinite,
--        loopcount of 1 no loop (!!!WARNING: unless "_L_" is in the wav/mp3 name the patch WILL NOT LOOP!!)
               
--                 N-A-M-E                VOL  MIN    MAX      ALLOWED    DELAY    LOOPSTART  LOOPEND  LOOPCOUNT
setPatchParams("BigExplosion_3d",        125,  1500,   25000,       2,     0                                  )
setPatchParams("SmallExplosion_3d",      125,  1500,   25000,       3,     0                                  )
setPatchParams("StrikeBaseExplosion_3d", 125,  1500,   25000,       3,     0                                  )
setPatchParams("FrigateBaseExplosion_3d",125,  1500,   25000,       3,     0                                  )
setPatchParams("CapitalBaseExplosion_3d",125,  1500,   25000,       3,     0                                  )
setPatchParams("FireACTurret_3d",        120,  500,	  5000,       3,     0                                  )
setPatchParams("FireKineticLarge_3d",    120,  500,	  5000,       3,     0                                  )
setPatchParams("FireKineticSmall_3d",    120,  500,	  5000,       3,     0                                  )
setPatchParams("FireLaser_3d",	         120,  500,	  5000,       3,     0                                  )
setPatchParams("FireMissileLight_3d",    120,  500,	  5000,       3,     0                                  )
setPatchParams("FirePlasmaBomb_3d",      120,  500,	  5000,       3,     0                                  )
setPatchParams("GunFire_3d",	         120,  500,	  9000,       3,     0                                  )
setPatchParams("GunFireDistant_3d",      120,  500,	  9000,       3,     0                                  )
setPatchParams("HitACTurret_3d",         120,  600,	  8000,       3,     0                                  )
setPatchParams("HitKineticLarge_3d",     120,  600,	  8000,       3,     0                                  )
setPatchParams("HitKineticSmall_3d",     120,  600,	  8000,       3,     0                                  )
setPatchParams("HitLaser_3d",            120,  600,	  8000,       3,     0                                  )
setPatchParams("HitMissileSmall_3d",     120,  600,	  8000,       3,     0                                  )
setPatchParams("HitPlasmaBomb_3d",       120,  600,	  8000,       3,     0                                  )
setPatchParams("FireIonCannon_3d",       120,  1400,	 22000,       3,     0  				)
setPatchParams("BulletIonCannon_L_3d",   120,  1400,	 22000,       3,     0  			        )

setPatchParams("Amb1Resourcer_L_3d",     100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("Ambient_L_3d",	         100,   10,	  1400,       1,     0,           0,      -1,         0 )
setPatchParams("Engine_L_3d",	         100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Amb1Cloak_L_3d",     100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Amb1Flagship_L_3d",  100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Amb1Frigate_L_3d",   100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Eng1Corvette_L_3d",  100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Eng1Fighter_L_3d",    40,   15,	  1400,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Eng1Flagship_L_3d",  100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("HGN_Eng1Frigate_L_3d",   100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Amb1Flagship_L_3d",  100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Amb1Frigate_L_3d",   100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Amb1Sensor_L_3d",    100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Eng1Corvette_L_3d",  100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Eng1Flagship_L_3d",  100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Eng1Frigate_L_3d",   100,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("VGR_Eng1Missile_L_3d",   100,  300,	  6000,       1,     0,           0,      -1,         0 )

-- shared generic ship patches
setPatchParams("CarrierAmbient_L_3D",     120,  3400,	 18000,       1,     0,           0,      -1,         0 )
setPatchParams("CarrierEngine_L_3D",      120,  600,	  8000,       1,     0,           0,      -1,         0 )
setPatchVol("CarrierAmbient_L_3D","",             9000,9000,9000)
setPatchVol("CarrierEngine_L_3D","EngineNozzle1", 5000,5000,5000)

setPatchParams("FrigateAmbient_L_3D",     120,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchParams("FrigateEngine_L_3D",      120,  300,	  6000,       1,     0,           0,      -1,         0 )
setPatchVol("FrigateAmbient_L_3D","",             9000,9000,9000)
setPatchVol("FrigateEngine_L_3D","EngineNozzle1", 2000,2000,2000)

setPatchParams("StrikeAmbient_L_3D",      120,  50,	  2000,       1,     0,           0,      -1,         0 )
setPatchParams("StrikeEngine_L_3D",       120,  50,	  2000,       1,     0,           0,      -1,         0 )
setPatchVol("StrikeAmbient_L_3D","",             800,800,800)
setPatchVol("StrikeEngine_L_3D","EngineNozzle1", 800,800,800)

setPatchVol("HGN_Eng1Frigate_L_3d","EngineNozzle1")
setPatchVol("HGN_Amb1Frigate_L_3d","",1000,500,1000)

-- new explosion sounds
setPatchParams("ETG_DeathStrikeBeam_3d",       125,  2500,   25000,       2,     0                                  )
setPatchParams("ETG_DeathStrikeCannon_3d",     125,  2500,   25000,       2,     0                                  )
setPatchParams("ETG_DeathStrikePlasma_3d",     125,  2500,   25000,       2,     0                                  )

setPatchParams("ETG_DeathCapBeam_3d",          125,  3500,   25000,       2,     0                                  )
setPatchParams("ETG_DeathCapCannon_3d",        125,  3500,   25000,       2,     0                                  )
setPatchParams("ETG_DeathCapPlasma_3d",        125,  3500,   25000,       2,     0                                  )

setPatchParams("ETG_DeathEmpBeam_3d",          125,  2500,   25000,       2,     0                                  )
setPatchParams("ETG_DeathEmpCannon_3d",        125,  2500,   25000,       2,     0                                  )
setPatchParams("ETG_DeathEmpPlasma_3d",        125,  2500,   25000,       2,     0                                  )


-- set loading path 
-- setSfxPath("sfx/Scenario/")
-- addSoundEmitter("testVolume","Tunnel_L_STR.wav","", -125938, 24696, 163961, 90,0,0,   50,0.8, 3500,3500,3500 )

-- testing sample text
--setSfxPath("speech/attackconfirmed/")				-- set the path for loading
--setSampleText("Event071_02_STR.wav",0,"Assume Combat Stations")	-- the sample text is now associated with this patch
--playPatch("Event071_02_STR.wav")				-- play back the sample "if text is avail" it will call Andre's gfx setup see SoundManager.cpp line 102 SoundManager::PlayPatch"
--setSfxPath("sfx/")
