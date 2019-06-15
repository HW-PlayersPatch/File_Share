version = 13 -- version info

animatics = {
 unlocked = {
	 "data:animatics/logo.lua",
	 "data:animatics/1_credits.lua",
	 "data:animatics/2_trailer.lua",
 },
}
homeworldclassic = {
  maxmission = 1,
  mostrecentsave = "",
  scenario = 1,
}
lastcampaign = "tutorial"
lastsplevel = ""
lastmplevel = ""
lastmpgamerules = ""
tutorial = {
  maxmission =3,
  mostrecentsave = "",
  scenario = 1,
}
Options = {
  AudioOptions = {
  	sfxVolume = 1.0,
	musicVolume = 1.0,
	speechVolume = 1.0,
	uiVolume = 1.0,
	sfxChannels = 16,
	soundQuality = 1,
	enableBattleChatter = 1,
	enableSelectionSpeech = 1,
	-- if you want change this attribute, you will have change the values of the listbox items
	--  do a find for "m_comboBattleChatter" in FEGameOptions.lua and change customData field to this * 100
	voiceFrequency = 0.7 
  },

  VideoOptions = {
  	screenResolutionW = 800,
	screenResolutionH = 600,
	textureQuality = 0,
	anisotropicFiltering = 0,
	shadowResolution = 0,
	minLOD = 0,
	maxLOD = 5,
	enableVsync = 1,
  },
  GameplayOptions = {
  	enableNLIPS = 1,
	enablePan = 1,
	enableMilitary = 0,
	orderFeedbackDelay = 0.03,
	mouseSensitivity = 0.5,
	enableRightClickMenu = 1,
	enableRightClickRadialMenu = 0,
	enableSubtitles = 0,
	sobSubstitutions = 0,
  },
  ControlsOptions = {},
  FXOptions = {
  	shadows = 1,
	distanceFog = 0,
	damageFX = 0,
	backgrounds = 1,
	weaponFX = 1,
	hyperspaceQuality = 0,
	lightLOD = 3,
	goblins = 1,		
	autoLOD = 1,
	hazeFX = 1,
	depthFX = 1,
	motionFX = 1,
  },
  UIOptions = {
	showTimer = 0,
  	HUDScale = 1,
	notifications = 0,
  },
}
PlayerSetup = {
  --chatname = "Player",  -- Randy: This is set to the same as the player profile name by default
  teamcolour = { 93, 141, 170 },
  stripecolour = { 204, 204, 204 },
  emblem = "DATA:Badges/Hiigaran.tga",
  record = 0,
  colorswatches =
  {
    { 255, 0, 0},
    { 255, 255, 0},
    { 0, 255, 0},
    { 0, 255, 255},
    { 0, 0, 255},
    { 108, 0, 15},
    { 167, 164, 0},
    { 0, 117, 36},
    { 0, 163, 158},
    { 60, 17, 124},
    { 51, 43, 40},
    { 200, 165, 111},
    { 105, 79, 152},
    { 149, 129, 182},
    { 63, 75, 213},
    { 255, 211, 0},
  },
}
CPUSettings = {
  {
    emblem = "DATA:Badges/Vaygr.tga",
    stripecolour = {
      204,
      204,
      204,
    },
    teamcolour = {
      200,
      165,
      111,
    },
  },
  {
    emblem = "DATA:Badges/Hiigaran.tga",
    stripecolour = {
      25,
      25,
      25,
    },
    teamcolour = {
      67,
      229,
      7,
    },
  },
  {
    emblem = "DATA:Badges/Vaygr.tga",
    stripecolour = {
      25,
      25,
      25,
    },
    teamcolour = {
      175,
      255,
      233,
    },
  },
  {
    emblem = "DATA:Badges/Soban.tga",
    stripecolour = {
      255,
      211,
      0,
    },
    teamcolour = {
      229,
      229,
      229,
    },
  },
  {
    emblem = "DATA:Badges/Hiigaran.tga",
    stripecolour = {
      255,
      255,
      0,
    },
    teamcolour = {
      149,
      129,
      182,
    },
  },
  {
    emblem = "DATA:Badges/Relic.tga",
    stripecolour = {
      25,
      51,
      153,
    },
    teamcolour = {
      0,
      255,
      127,
    },
  },
  {
    emblem = "DATA:Badges/Relic.tga",
    stripecolour = {
      178,
      178,
      153,
    },
    teamcolour = {
      127,
      127,
      127,
    },
  },
}
