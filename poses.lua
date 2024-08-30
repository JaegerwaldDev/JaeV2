local actionWheel = require("action_wheel")
local cf = require("custom_functions")

function pings.pose(v)
    if not cf.getAnimation(v[3]):isPlaying() then
        animations:stopAll()
        cf.getAnimation(v[3]):play()
        animations.model.start:play()
    elseif cf.getAnimation(v[3]):isPlaying() then
        animations:stopAll()
        animations.model["end"]:play()
    end
end

function pings.stopAllPoses()
    animations:stopAll()
    animations.model["end"]:play()
    AnimFace(false)
end

local function load(table)
    actionWheel.pages["poses"]:newAction()
    :title("Stop all animations")
    :texture(textures["textures.icons.icon_stop"], 0, 0, 16, 16, 1)
    :onLeftClick(pings.stopAllPoses)

    for _, v in ipairs(table) do
        actionWheel.pages["poses"]:newAction()
        :title(v[1])
        :texture(textures["textures.icons.icon_poses"], v[2][1], v[2][2], 32, 32, 1)
        :onLeftClick(function()
            pings.pose(v)
        end)
    end
end

---@class PoseAPI
local PoseAPI = {
    load = load
}

return PoseAPI -- made w/ <3 by Jaegerwald