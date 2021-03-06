-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

strikegroup = {
Name = "Core",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip, Mothership, Capturer",
OffsetFromParent = {0, 0, 0},
Children = {{
Name = "Capship Left",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip, Mothership, Capturer",
OffsetFromParent = {-1, 0, 0},}, {
Name = "Capship Right",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip, Mothership, Capturer",
OffsetFromParent = {1, 0, 0},}, {
Name = "Capship Up",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip, Mothership, Capturer",
OffsetFromParent = {0, -1, 0},}, {
Name = "Capship Down",
DesiredShipTypes = "BigCapitalShip, SmallCapitalShip, Mothership, Capturer",
OffsetFromParent = {0, 1, 0},}, {
Name = "Frigate Front",
DesiredShipTypes = "Frigate",
OffsetFromParent = {0, 0, 1},
Children = {{
Name = "FrigateUp",
DesiredShipTypes = "Frigate",
OffsetFromParent = {0, 1, 0},
Children = {{
Name = "FrigateLeft",
DesiredShipTypes = "Frigate",
OffsetFromParent = {-1, 0, 0},}, {
Name = "FrigateRight",
DesiredShipTypes = "Frigate",
OffsetFromParent = {1, 0, 0},},},}, {
Name = "FrigateLeft",
DesiredShipTypes = "Frigate",
OffsetFromParent = {1, 0, 0},}, {
Name = "FrigateRight",
DesiredShipTypes = "Frigate",
OffsetFromParent = {-1, 0, 0},}, {
Name = "FrigateDown",
DesiredShipTypes = "Frigate",
OffsetFromParent = {0, -1, 0},
Children = {{
Name = "FrigateRight",
DesiredShipTypes = "Frigate",
OffsetFromParent = {-1, 0, 0},}, {
Name = "FrigateLeft",
DesiredShipTypes = "Frigate",
OffsetFromParent = {1, 0, 0},},},},},}, {
Name = "Fighter Forward",
DesiredShipTypes = "Fighter, Corvette, Utility",
OffsetFromParent = {0, 0, 2.5},
Children = {{
Name = "Fighter Back left",
DesiredShipTypes = "Fighter",
OffsetFromParent = {-1, 0, -0.5},
Children = {{
Name = "Fighter Back left",
DesiredShipTypes = "Fighter",
OffsetFromParent = {-1, 0, -0.25},}, {
Name = "Fighter Back left",
DesiredShipTypes = "Fighter",
OffsetFromParent = {-2, 0, -0.5},},},}, {
Name = "Fighter Back right",
DesiredShipTypes = "Fighter",
OffsetFromParent = {1, 0, -0.5},
Children = {{
Name = "Fighter Back right",
DesiredShipTypes = "Fighter",
OffsetFromParent = {1, 0, -0.25},}, {
Name = "Fighter Back left",
DesiredShipTypes = "Fighter",
OffsetFromParent = {2, 0, -0.5},},},}, {
Name = "Fighter Up",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 1, -0.5},
Children = {{
Name = "Fighter up",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 1, -0.25},}, {
Name = "Fighter Back left",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 2, -0.5},},},}, {
Name = "Fighter Down",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, -1, -0.5},
Children = {{
Name = "Fighter Down",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, -1, -0.25},}, {
Name = "Fighter Down",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, -2, -0.5},},},},},}, {
Name = "Corvette Left",
DesiredShipTypes = "Corvette, Utility",
OffsetFromParent = {1, 0, 1},
Children = {{
Name = "Corvette Back",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 0, -1},}, {
Name = "Corvette Up",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 1, 0},},},}, {
Name = "Corvette Right",
DesiredShipTypes = "Corvette, Utility",
OffsetFromParent = {-1, 0, 1},
Children = {{
Name = "Corvette Back",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 0, -1},}, {
Name = "Corvette Up",
DesiredShipTypes = "Fighter",
OffsetFromParent = {0, 1, 0},},},},},}
