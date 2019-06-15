-------------------------------------------------------------------------------
-- SoundConfig.lua --
-- created by egeorges, 09/26/01
-- contains default settings for sound engine tunable variables
--


-- boolean defines
TRUE	= 1.0
FALSE	= 0.0


-- BitRate : 8bit/16bit resolution for audio mixer
BitRate		= 16

-- OutputChannels : 1(mono)/2(stereo) channel output for audio mixer
OutputChannels	= 2

-- SampleRate :  Maximum SampleRate of audio mixer (11025,22025,44100)
SampleRate	= 44100

ProviderHW3D	= "DirectSound3D Hardware Support"
ChannelsHW3D	= 16
ResChanHW3D	= 2

ProviderSW3D	= "DirectSound3D Software Emulation"
ChannelsSW3D	= 16
ResChanSW3D	= 2

-- 2D Provider List
--	"DX Audio"
Provider2D	= "dxaudio"
Channels2D	= 8
ResChan2D	= 2

-- Streaming Provider List
--	"DX Audio Streaming"
ProviderSTRM	= "dxa streamer"
ChannelsSTRM	= 6
ResChanSTRM	= 2


-- SoundDriver : NameTag of the Sound Driver DLL to use, currently only  -- "FDAudio" -- "DSS" 
SoundDriver = "FDAudio"

-- default filter to attach to each 2D based sample ("Reverb3 Filter" == emulates the EAX rooms for reverb settings)
DefaultFilter   = "Reverb3 Filter"

DefaultEnvType  = 18
