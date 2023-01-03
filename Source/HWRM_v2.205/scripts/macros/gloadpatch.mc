-- =============================================================================
--     Name    : gloadpatch.mc
--     Purpose : macro script for loading all Patch SFXS for E3 -- used for tweaking all the patch parameters
--
--     Created 4/16/2001 by egeorges
--     Copyright Relic Entertainment, Inc.  All rights reserved.
-- =============================================================================


-- THIS IS A DEBUG LOADING OF ALL "ETGS AND SHIPS" PATCHES

loadPatchList("Sfx/Etg/", 
                               "BigExplosion_3d.wav",
                                         "SmallExplosion_3d.wav",
                                         "StrikeBaseExplosion_3d.wav",
                                         "FrigateBaseExplosion_3d.wav",
                                         "CapitalBaseExplosion_3d.wav",
                                         "FireACTurret_3D.wav",
					 "FireKineticLarge_3D.wav",
					 "FireKineticSmall_3D.wav",
					 "FireLaser_3D.wav",
					 "FireMissileLight_3D.wav",
					 "FirePlasmaBomb_3D.wav",
					 "FireIonCannon_3D.wav",
					 "BulletIonCannon_L_3D.wav",
					 "GunFire_3D.wav",
					 "GunFireDistant_3D.wav",
					 "HitACTurret_3D.wav",
					 "HitKineticLarge_3D.wav",
					 "HitKineticSmall_3D.wav",
					 "HitLaser_3D.wav",
					 "HitMissileSmall_3D.wav",
					 "HitPlasmaBomb_3D.wav",
					 "ETG_DeathStrikeBeam_3d.wav",
					 "ETG_DeathStrikeCannon_3d.wav",
					 "ETG_DeathStrikePlasma_3d.wav",
					 "ETG_DeathCapBeam_3d.wav",
					 "ETG_DeathCapCannon_3d.wav",
					 "ETG_DeathCapPlasma_3d.wav",
					 "ETG_DeathEmpBeam_3d.wav",
					 "ETG_DeathEmpCannon_3d.wav",
					 "ETG_DeathEmpPlasma_3d.wav"
					 
                               );
loadPatchList("Sfx/Ship/", 
                               "Amb1Resourcer_L_3D.wav",
                               "Ambient_L_3D.wav",
					 "Eng1Resourcer_L_3D.wav",
					 "Engine_L_3D.wav",
					 "HGN_Amb1Cloak_L_3D.wav",
					 "HGN_Amb1Flagship_L_3D.wav",
					 "HGN_Amb1Frigate_L_3D.wav",
					 "HGN_Eng1Corvette_L_3D.wav",
					 "HGN_Eng1Fighter_L_3D.wav",
					 "HGN_Eng1Flagship_L_3D.wav",
					 "HGN_Eng1Frigate_L_3D.wav",
					 "VGR_Amb1Flagship_L_3D.wav",
					 "VGR_Amb1Frigate_L_3D.wav",
					 "VGR_Amb1Sensor_L_3D.wav",
					 "VGR_Eng1Corvette_L_3D.wav",
					 "VGR_Eng1Flagship_L_3D.wav",
					 "VGR_Eng1Frigate_L_3D.wav",
					 "VGR_Eng1Missile_L_3D.wav",
					 
                                         "CarrierAmbient_L_3D.wav",
                                         "CarrierEngine_L_3D.wav",
                                         "FrigateAmbient_L_3D.wav",
                                         "FrigateEngine_L_3D.wav",
                                         "StrikeAmbient_L_3D.wav",
                                         "StrikeEngine_L_3D.wav"
                               );
-- UI patch loading
setPatchListUI();
loadPatchList("Sfx/FrontEnd/", 
                              "UIE_MoveDiscOn.wav",
 			      "UIE_MoveDiscOff.wav",
                              "UIE_MoveDiscHiLite.wav",
                              "UIE_UtilityMenuOn.wav",
                              "UIE_UtilityUpgradePopUp.wav",
                              "UIE_UtilityCheckBoxOn.wav",
                              "UIE_UtilityCheckBoxOff.wav",
                              "UIE_CommandClick.wav",
                              "UIE_ObjectiveListOn.wav",
                              "UIE_EventListOn.wav",
                              "UIE_PlayerActionsMenu.wav",
                              "UIE_ConsoleCheckBoxOn.wav",
                              "UIE_ConsoleCheckBoxOff.wav"
                               );
resetPatchList();