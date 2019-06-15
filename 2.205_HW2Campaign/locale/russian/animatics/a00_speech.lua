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
SetSpeechFolder( "Data:Sound/Speech/Animatic/ANI_00" );

-- specify the .dat file to use for localized text
AddLocalizedText( "locale:leveldata/campaign/ascension/ANI_00_01_M00_BackStory.dat" );

-- example 1: speech file specified by name 
-- AddSpeechEvent( 2.35, "A0_KS_BySoDoing" );

-- exmaple 2: speech file specified by localized ID + subtitle; both fired off at the same time
--            The speech event would play "40531.mp3" and the subtitle event would play
--            "40530.mp3" and display localized text number 40530.

-- The time is given in sss.ff format : the integral part is in seconds and the 
-- framctional part ranges from .00 to .29 and indicates the frame offset where eac
-- frame is 1/30th of a second.  For example, 12.15 means 12 seconds + 15 frames.


AddSubtitleEvent( 31.25, Actor_LocationCard, "$55000", 0 );

AddSubtitleEvent( 40.16, Actor_LocationCard, "$55001", 0 );

AddSubtitleEvent( 68.19, Actor_LocationCard, "$55002", 0 );

AddSubtitleEvent( 87.16, Actor_LocationCard, "$55003", 0 );

-- AddSubtitleEvent( 00.00, Actor_LocationCard, "$55004", 0 );

AddSubtitleEvent( 101.10, Actor_LocationCard, "$55005", 0 );

AddSubtitleEvent( 115.07, Actor_LocationCard, "$55006", 0 );

AddSubtitleEvent( 125.18, Actor_LocationCard, "$55007", 0 );

AddSubtitleEvent( 137.18, Actor_LocationCard, "$55008", 0 );

AddSubtitleEvent( 143.29, Actor_LocationCard, "$55009", 0 );

AddSubtitleEvent( 154.06, Actor_LocationCard, "$55010", 0 );

AddSubtitleEvent( 166.01, Actor_LocationCard, "$55011", 0 );

AddSubtitleEvent( 172.05, Actor_LocationCard, "$55012", 0 );

AddSubtitleEvent( 176.15, Actor_LocationCard, "$55013", 0 );

AddSpeechEvent( 180.18, "$55014" );

AddSpeechEvent( 183.20, "$55015" );

AddSpeechEvent( 186.15, "$55016" );

AddSpeechEvent( 188.15, "$55017" );

AddSpeechEvent( 190.08, "$55018" );


