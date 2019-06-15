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
SetSpeechFolder( "Data:Sound/Speech/Animatic/ANI_02" );

-- specify the .dat file to use for localized text
AddLocalizedText( "locale:leveldata/campaign/ascension/ANI_02-03_M02_Hiigara.dat" );

-- example 1: speech file specified by name 
-- AddSpeechEvent( 2.35, "A0_KS_BySoDoing" );

-- exmaple 2: speech file specified by localized ID + subtitle; both fired off at the same time
--            The speech event would play "40531.mp3" and the subtitle event would play
--            "40530.mp3" and display localized text number 40530.

-- The time is given in sss.ff format : the integral part is in seconds and the 
-- framctional part ranges from .00 to .29 and indicates the frame offset where eac
-- frame is 1/30th of a second.  For example, 12.15 means 12 seconds + 15 frames.


AddSubtitleEvent( 10.00, Actor_LocationCard, "$55030", 0 );

AddSubtitleEvent( 18.25, Actor_LocationCard, "$55031", 0 );

AddSubtitleEvent( 24.23, Actor_LocationCard, "$55032", 0 );

AddSpeechEvent( 22.13, "$55033" );

AddSpeechEvent( 28.06, "$55034" );

AddSpeechEvent( 34.28, "$55039" );

AddSubtitleEvent( 35.27, Actor_LocationCard, "$55035", 0 );

-- AddSubtitleEvent( 00.00, Actor_LocationCard, "$55036", 0 );

AddSubtitleEvent( 40.19, Actor_LocationCard, "$55037", 0 );

AddSpeechEvent( 45.00, "$55038" );

AddSubtitleEvent( 50.15, Actor_LocationCard, "$55040", 0 );

AddSubtitleEvent( 56.06, Actor_LocationCard, "$55041", 0 );

AddSubtitleEvent( 65.11, Actor_LocationCard, "$55042", 0 );

