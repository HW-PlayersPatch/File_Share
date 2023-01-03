-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

strikegroup = {
Name = "Core",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip",
OffsetFromParent = {0, 0, 0},
Children = {{
Name = "CoreLeft",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip",
OffsetFromParent = {-1, 0, 0},}, {
Name = "CoreRight",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip",
OffsetFromParent = {1, 0, 0},}, {
Name = "LeftFlank",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {-1, 1, -0.5},
Children = {{
Name = "LeftFlankExtend",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {-1, 0, -0.5},},},}, {
Name = "RightFlank",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {1, 1, -0.5},
Children = {{
Name = "RightFlankExtend",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {1, 0, -0.5},},},}, {
Name = "BottomFlank",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {0, -1, -0.3},
Children = {{
Name = "BottomFlankLeft",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {-1, -0.5, -0.2},}, {
Name = "BottomFlankRight",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {1, -0.5, -0.2},},},}, {
Name = "Rear",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {0, 0, -1},
Children = {{
Name = "RearLeft",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {-1, 0, 0},}, {
Name = "RearRight",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {1, 0, 0},},},}, {
Name = "Assault",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {0, 0, 1},
Children = {{
Name = "AssaultLeft",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {-1, 0, -0.3},}, {
Name = "AssaultRight",
DesiredShipTypes = "BigCapitalShip",
OffsetFromParent = {1, 0, -0.3},},},},},}
