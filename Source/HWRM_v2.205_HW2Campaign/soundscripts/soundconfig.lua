-------------------------------------------------------------------------------
-- SoundConfig.lua --
-- created by salfreds, 05/03/01
-- contains default settings for sound engine tunable variables
--

-- boolean defines
TRUE = 1.0
FALSE = 0.0

-- MusicTuning: the set of parameters for fading the music volume based on distance to nearest object,
-- if that object is doing something and what type of music is currently being played
MusicTuning =
{
	-- Ambient music tuning values
	{
		volMax = 0.9,
		volMin = 0.5,
		volMinActive = 0.4,
		distanceMax = 2500,
		distanceMin = 700,
		fadeTime = 0.8
	},
	-- Staging music tuning values
	{
		volMax = 1.0,
		volMin = 0.7,
		volMinActive = 0.6,
		distanceMax = 2500,
		distanceMin = 300,
		fadeTime = 0.7
	},
	-- Battle track tuning values
	{
		volMax = 1.0,
		volMin = 0.8,
		volMinActive = 0.7,
		distanceMax = 2500,
		distanceMin = 300,
		fadeTime = 0.7
	},
	-- Stinger tuning values (for completeness, not being used in HW2)
	{
		volMax = 1.0,
		volMin = 0.5,
		volMinActive = 0.3,
		distanceMax = 10000,
		distanceMin = 500,
		fadeTime = 5.0
	},
}

-- SensorsVolFactor: float, percentages of normal music volume to play at when in Sensors Manager
SensorsVolFactor = 0.2

-- CameraMaxVelocity: float, used for capping the camera max velocity which is used in the doppler shifting function
CameraMaxVelocity = 1000.0

-- SpeechVolDuckingLevel: float, volume at which to play non-Intel events when Intel events are occuring
SpeechVolDuckingLevel = 0.1

-- FEMusic: string, the file to use as the Front End Music Track, also is the default mission music if nothing is selected
FEMusic = "data:sound/music/ambient/amb_03"

-- FEBattleMusic: string, the file to use as the battle music during combat
FEBattleMusic = "data:sound/music/battle/battle_01"

-- FEmusicVol: float 0.0 - 1.0, sets the volume of the front end music
FEmusicVol = 0.5

-- GameMusicVol: float 0.0 - 1.0, sets the max volume for music in the game (when zoomed out at the furthest distance)
GameMusicVol = 1.0

-- MinMusicVol: float 0.0 - 1.0, sets the minimum volume that music will play at when zoomed in to the action
MinMusicVol = 1.0

-- MusicFadeTime: float, # of seconds to fade from last volume to new volume (when zooming in or out from the action. not when cross fading between different tracks)
MusicFadeTime = 1.0

-- MusicDistance: int, distance in meters from the nearest entity to start fading the volume down from GameMusicVol
MusicDistance = 97

-- MusicCrossFadeTime: float, # of seconds for the cross fade to take when switching between level and battle tracks.
MusicCrossFadeTime = 2.0

-- MusicFadeToStingerTime: float, # of seconds to fade from music (level or battle) before starting the stinger.  Stinger does not fade out when it ends.
MusicFadeToStingerTime = 0.5

-- EnableAmbient: boolean, enables ambient sound emmiters that are set in the mission editor
EnableAmbient = TRUE

-- EnableMusic: boolean, enables music in the game
EnableMusic = TRUE

-- MaxAmbients: int, max # of looping ambient sounds to play at the same time (nearest to furthest)
MaxAmbients = 32

-- SpeechQueueTimeout: float, # of seconds that queued speech events will stay in the queue
SpeechQueueTimeout = 5.0

-- SpeechQueueInterruptPriority: int, set for what priority level you want to have interrupt currently playing speech events, 100 is max, 1 is min.  Example: setting to 100, events with priority of 100 will interrupt any events with priority 99 or lower.  Setting to 90, events with priority 90 to 100 will never be interrupted, but will interrupt events with priority 89 or lower.
SpeechQueueInterruptPriority = 100
