-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

fx = {
	style = "STYLE_RING", properties = {
	property_26 = {name = "DepthOffset", type = "VARTYPE_FLOAT", value = 10},
	property_25 = {name = "SortOrder", type = "VARTYPE_INT", value = 4},
	property_24 = {name = "RandomBitmap", type = "VARTYPE_BOOL", value = 1},
	property_23 = {name = "BirthSpawn_Fx", type = "VARTYPE_STRING", value = ""},
	property_22 = {name = "Spawn_Fx", type = "VARTYPE_STRING", value = ""},
	property_21 = {name = "Mesh", type = "VARTYPE_STRING", value = "Data:art/fx/box.hod"},
	property_11 = {name = "SpinRandom", type = "VARTYPE_BOOL", value = 1},
	property_15 = {name = "UseDepthSort", type = "VARTYPE_BOOL", value = 1},
	property_18 = {name = "SelfIlluminated", type = "VARTYPE_BOOL", value = 1},
	property_17 = {name = "Billboard", type = "VARTYPE_BOOL", value = 1},
	property_16 = {name = "Loop", type = "VARTYPE_BOOL", value = 0},
	property_19 = {name = "Blending", type = "VARTYPE_INT", value = 2},
	property_09 = {name = "SpinEpsilonY", type = "VARTYPE_FLOAT", value = 0},
	property_04 = {name = "SpinZ", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 6.53333, 1, 0},},
	property_03 = {name = "SpinY", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 0, 1, 0},},
	property_06 = {name = "RadiusEpsilon", type = "VARTYPE_FLOAT", value = 0.35},
	property_05 = {name = "Colour", type = "VARTYPE_ARRAY_TIMECOLOUR", value = {entry_19 = {0.64328, 0.7908, 0.79245, 0.7908, 0.99452}, entry_18 = {0.60299, 0.36716, 0.36792, 0.36716, 0.99481}, entry_17 = {0.5791, 0.99792, 1, 0.99792, 0.99499}, entry_06 = {0.14925, 0.99792, 1, 0.99792, 0.9978}, entry_07 = {0.17164, 0.51778, 0.51887, 0.51778, 0.99767}, entry_08 = {0.18657, 0.99792, 1, 0.99792, 0.99761}, entry_09 = {0.22388, 0.5272, 0.5283, 0.5272, 0.99736}, entry_26 = {1, 0, 0, 0, 0}, entry_25 = {0.95075, 0.99024, 0.99231, 0.99024, 0.99231}, entry_24 = {0.84478, 0.81904, 0.82075, 0.81904, 0.99307}, entry_23 = {0.79701, 0.5, 0.5, 0.5, 0.99342}, entry_22 = {0.77761, 0.83601, 0.83775, 0.83601, 0.99356}, entry_21 = {0.72687, 0.7908, 0.79245, 0.7908, 0.99392}, entry_00 = {0, 0.36792, 0.36792, 0.36792, 1}, entry_01 = {0.01343, 0.99792, 1, 0.99792, 1}, entry_02 = {0.0597, 0.99792, 1, 0.99792, 1}, entry_03 = {0.07612, 0.50943, 0.50943, 0.50943, 0.99907}, entry_04 = {0.09254, 0.99792, 1, 0.99792, 0.99809}, entry_05 = {0.12388, 0.36716, 0.36792, 0.36716, 0.99793}, entry_16 = {0.44627, 0.83788, 0.83962, 0.83788, 0.99587}, entry_15 = {0.42388, 0.44247, 0.4434, 0.44247, 0.99603}, entry_14 = {0.41194, 0.87553, 0.87736, 0.87553, 0.99611}, entry_13 = {0.39851, 0.95085, 0.95283, 0.95085, 0.9962}, entry_12 = {0.3403, 0.90378, 0.90566, 0.90378, 0.99658}, entry_11 = {0.32239, 0.44247, 0.4434, 0.44247, 0.9967}, entry_10 = {0.31045, 0.99792, 1, 0.99792, 0.99678}, entry_20 = {0.6806, 0.48954, 0.49057, 0.48954, 0.99426},},},
	property_08 = {name = "SpinEpsilonX", type = "VARTYPE_FLOAT", value = 0},
	property_07 = {name = "RateEpsilon", type = "VARTYPE_FLOAT", value = 0},
	property_02 = {name = "SpinX", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 7.73333, 1, 0},},
	property_01 = {name = "Offset", type = "VARTYPE_ARRAY_TIMEVECTOR3", value = {entry_00 = {0, 0, 0, 0}, entry_01 = {1, 0, 0, 0},},},
	property_13 = {name = "UseMesh", type = "VARTYPE_BOOL", value = 0},
	property_14 = {name = "UseDepthTest", type = "VARTYPE_BOOL", value = 0},
	property_20 = {name = "Texture", type = "VARTYPE_STRING", value = "DATA:ART/FX/FIRERY EXPLOSIONS/FIERY_HEAD_RING.TGA"},
	property_12 = {name = "Duration", type = "VARTYPE_FLOAT", value = 3},
	property_00 = {name = "Radius", type = "VARTYPE_ARRAY_TIMEFLOAT", value = {0, 0, 0.04375, 0.69825, 0.07875, 0.95675, 0.12625, 1.03333, 0.1475, 1.2, 0.155, 0.91667, 0.19625, 0.96667, 0.2125, 1.16667, 0.2275, 1.03333, 0.2675, 1.2, 0.305, 1.05687, 0.33875, 1.16667, 0.36125, 1.11667, 0.3725, 1.28333, 0.39625, 1.27844, 0.44625, 1.41667, 0.46, 1.36667, 0.52875, 1.45, 0.55875, 1.55, 0.57375, 1.38333, 0.6, 1.43333, 0.61, 1.28333, 0.64875, 1.38333, 0.695, 1.29515, 0.72625, 1.1, 0.7325, 1.26667, 0.7525, 1.05, 0.79, 0.93333, 0.79125, 1.06667, 0.8025, 0.88333, 0.8225, 0.95, 0.855, 0.73463, 0.89, 0.56667, 0.8975, 0.78333, 0.955, 0.3217, 1, 0.01032},},
	property_10 = {name = "SpinEpsilonZ", type = "VARTYPE_FLOAT", value = 0},},}
