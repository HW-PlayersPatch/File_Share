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
SetSpeechFolder( "Data:Sound/Speech/Animatic/ANI_00_01" );

-- specify the .dat file to use for localized text
AddLocalizedText( "locale:leveldata/campaign/homeworldclassic/A00_01.dat" );

-- example 1: speech file specified by name 
-- AddSpeechEvent( 2.35, "A0_KS_BySoDoing" );

-- exmaple 2: speech file specified by localized ID + subtitle; both fired off at the same time
--            The speech event would play "40531.mp3" and the subtitle event would play
--            "40530.mp3" and display localized text number 40530.

-- The time is given in sss.ff format : the integral part is in seconds and the 
-- framctional part ranges from .00 to .29 and indicates the frame offset where eac
-- frame is 1/30th of a second.  For example, 12.15 means 12 seconds + 15 frames.


AddSubtitleEvent( 6.00, Actor_LocationCard, "$65330", 0 );

AddSubtitleEvent( 13.5, Actor_LocationCard, "$65331", 0 );

AddSubtitleEvent( 26.3, Actor_LocationCard, "$65332", 0 );

AddSubtitleEvent( 52.5, Actor_LocationCard, "$65333", 0 );

AddSubtitleEvent( 63.0, Actor_LocationCard, "$65334", 0 );

AddSubtitleEvent( 67.0, Actor_LocationCard, "$65335", 0 );

AddSubtitleEvent( 73.0, Actor_LocationCard, "$65336", 0 );

AddSubtitleEvent( 75.0, Actor_LocationCard, "$65337", 0 );

AddSubtitleEvent( 98.0, Actor_LocationCard, "$65338", 0 );

AddSubtitleEvent( 102.0, Actor_LocationCard, "$65339", 0 );

AddSubtitleEvent( 115.0, Actor_LocationCard, "$65340", 0 );

AddSubtitleEvent( 128.0, Actor_LocationCard, "$65341", 0 );

AddSubtitleEvent( 139.0, Actor_LocationCard, "$65342", 0 );

AddSubtitleEvent( 148.0, Actor_LocationCard, "$65343", 0 );

AddSubtitleEvent( 153.0, Actor_LocationCard, "$65344", 0 );

AddSubtitleEvent( 158.0, Actor_LocationCard, "$65345", 0 );
