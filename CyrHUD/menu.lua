-- This file is part of CyrHUD
--
-- (C) 2015 Scott Yeskie (Sasky)
--
-- This p.rogram is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

CyrHUD = CyrHUD or {}
CyrHUD.menuPanel = {
    type = "panel",
    name = "CyrHUD",
    author = "Sasky",
    version = "1.1.0",
}

local CZ = "|cC5C29E" -- ZOS standard text color
local CR = "|cFFFFFF" -- Reset color

CyrHUD.menuOptions = {
    {
        type = "checkbox",
        name = "Auto-hide Default Quest Tracker",
        tooltip = "Hides quest trackers when CyrHUD is shown",
        getFunc = function() return CyrHUD.cfg.zosTrackerDisable or false end,
        setFunc = function(v) CyrHUD.cfg.zosTrackerDisable = v end
    },
    {
        type = "checkbox",
        name = "Auto-hide Wykkyd's Quest Tracker",
        tooltip = "Hides quest trackers when CyrHUD is shown",
        getFunc = function() return CyrHUD.cfg.trackerDisable or false end,
        setFunc = function(v) CyrHUD.cfg.trackerDisable = v end
    },
    {
        type = "checkbox",
        name = "Population bars for flags",
        tooltip = "Shows current population instead of alliance flag in summary",
        getFunc = function() return CyrHUD.cfg.showPopBars or false end,
        setFunc = function(v) CyrHUD.cfg.showPopBars = v; CyrHUD:reconfigureLabels() end,
    },
    {
        type = "checkbox",
        name = "Hide Imperial District Battles",
        tooltip = "Hides Imperial District battles from CyrHUD notifications",
        getFunc = function() return CyrHUD.cfg.hideImpBattles or false end,
        setFunc = function(v) CyrHUD.cfg.hideImpBattles = v; CyrHUD:reconfigureLabels() end
    },
    {
        type = "description",
        title = "Keybind",
        text = CZ .. "See the controls game menu for setting a keybind for the" .. CR .. "/cyrhud" .. CZ .. " command.\n"
            .."This toggles the addon on or off."
    }
}

--TODO: Move this and other strings to proper translator format
ZO_CreateStringId("SI_BINDING_NAME_CYRHUD_TOGGLE", "Enable/disable CyrHUD")
