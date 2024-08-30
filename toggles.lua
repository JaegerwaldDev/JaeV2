local actionWheel = require("action_wheel")
local cf = require("custom_functions")

local toggles = {}

ToggleParts = {}

function pings.setVisible(modelPart, bool)
    ToggleParts[modelPart]:setVisible(bool)
end

local function load(table)
    for _, v in ipairs(table) do
        for _, t in ipairs(v[2]) do
            ToggleParts[cf.tablelength(ToggleParts)+1] = t
        end

        toggles[v[1][1]] = actionWheel.pages["toggles"]:newAction()
        :title("Toggle "..v[1][2])
        :texture(textures["textures.icons.icon_toggles"], v[1][3][1], v[1][3][2], v[1][3][3], v[1][3][4], 1)
        :toggleTexture(textures["textures.icons.icon_toggles"], v[1][4][1], v[1][4][2], v[1][4][3], v[1][4][4], 1)
        :toggled(v[1][5])
        :toggleColor(0, 0, 0)
        :onToggle(function()
            for _, t in ipairs(v[2]) do
                for k, _ in pairs(ToggleParts) do
                    if ToggleParts[k] == t then
                        pings.setVisible(k, not ToggleParts[k]:getVisible())
                    end
                end
            end
            for _, t in ipairs(v[3]) do
                toggles[t]:setToggled(false)
                toggles[t]:untoggle()
            end
        end)
        :onUntoggle(function()
            for _, t in ipairs(v[2]) do
                for k, _ in pairs(ToggleParts) do
                    if ToggleParts[k] == t then
                        pings.setVisible(k, false)
                    end
                end
            end
        end)
    end
end

---@class ToggleAPI
local ToggleAPI = {
    load = load,
    toggles = toggles
}

return ToggleAPI -- made w/ <3 by Jaegerwald