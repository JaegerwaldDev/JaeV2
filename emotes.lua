local actionWheel = require("action_wheel")
local cf = require("custom_functions")

function pings.emote(v)
    animations:stopAll()
    AnimFace(false)
    cf.getAnimation(v[3]):play()
end

function pings.stopAllEmotes()
    animations:stopAll()
    animations.model["end"]:play()
    AnimFace(false)
end

local function load(table)
    actionWheel.pages["emotes"]:newAction()
    :title("Stop all animations")
    :texture(textures["textures.icons.icon_stop"], 0, 0, 16, 16, 1)
    :onLeftClick(pings.stopAllEmotes)

    for _, v in ipairs(table) do
        actionWheel.pages["emotes"]:newAction()
        :title(v[1])
        :texture(textures["textures.icons.icon_emotes"], v[2][1], v[2][2], 32, 32, 1)
        :onLeftClick(function()
            pings.emote(v)
        end)
    end
end

---@class EmoteAPI
local EmoteAPI = {
    load = load
}

return EmoteAPI -- made w/ <3 by Jaegerwald