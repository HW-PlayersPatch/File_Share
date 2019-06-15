-- This is a sample speech file for animatics.

-- Valid actors:
--   Actor_FleetIntel
--   Actor_FleetCommand
--   Actor_Makaan
--   Actor_Keeper
--   Actor_Chimera
--   Actor_Bentusi
--   Actor_AllShips
--   Actor_AllShips2
--   Actor_AllShips3
--   Actor_Talorn
--   Actor_LocationCard

-- specify the folder where all speech data is to be found
SetSpeechFolder( "Data:Sound/Speech/Animatic/ANI_15" );

-- specify the .dat file to use for localized text
AddLocalizedText( "locale:leveldata/campaign/ascension/ANI_15_M15_Homeworld.dat" );

-- example 1: speech file specified by name 
-- AddSpeechEvent( 2.35, "A0_KS_BySoDoing" );

-- exmaple 2: speech file specified by localized ID + subtitle; both fired off at the same time
--            The speech event would play "40531.mp3" and the subtitle event would play
--            "40530.mp3" and display localized text number 40530.

-- The time is given in sss.ff format : the integral part is in seconds and the 
-- framctional part ranges from .00 to .29 and indicates the frame offset where eac
-- frame is 1/30th of a second.  For example, 12.15 means 12 seconds + 15 frames.


AddSubtitleEvent( 09.19, Actor_LocationCard, "$55180", 0 );

AddSubtitleEvent( 26.28, Actor_LocationCard, "$55181", 0 );

AddSubtitleEvent( 35.09, Actor_LocationCard, "$55182", 0 );

-- AddSubtitleEvent( 00.00, Actor_LocationCard, "$55183", 0 );

-- AddSubtitleEvent( 00.00, Actor_LocationCard, "$55184", 0 );

AddSubtitleEvent( 44.14, Actor_LocationCard, "$55185", 0 );

AddSubtitleEvent( 54.23, Actor_LocationCard, "$55186", 0 );

AddSubtitleEvent( 63.24, Actor_LocationCard, "$55187", 0 );

AddSubtitleEvent( 74.02, Actor_LocationCard, "$55188", 0 );

AddSubtitleEvent( 81.25, Actor_LocationCard, "$55189", 0 );

-- AddSubtitleEvent( 00.00, Actor_LocationCard, "$55190", 0 );

AddSubtitleEvent( 86.16, Actor_LocationCard, "$55191", 0 );

AddSubtitleEvent( 98.01, Actor_LocationCard, "$55192", 0 );





