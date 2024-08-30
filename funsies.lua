local actionWheel = require("action_wheel")
local toggles = require("toggles")
local cf = require("custom_functions")

local actions = {}

local renderTypes
local function loadRenderTypes(t)
    renderTypes = t
end
function pings.setRenderType(renderType)
    models.model:setPrimaryRenderType(renderType)
end

function pings.setScale(scale)
    models:setScale(scale)
    nameplate.ENTITY:setPivot(0,(scale.y*2)+0.25,0)
    renderer:setShadowRadius(0.5*scale.x)

    toggles.toggles["vanilla"]:untoggle()
    toggles.toggles["vanilla"]:setToggled(false)
end

local function init()
    actions["renderType"] = actionWheel.pages["funsies"]:newAction()
    :title("Change Render Type")
    :texture(textures["textures.icons.icon_render_type"], renderTypes[1][2], renderTypes[1][3], 24, 24, 1)
    :hoverColor(1, 1, 1)
    :onLeftClick(function()
        cf.firstToLast(renderTypes)
        pings.setRenderType(renderTypes[1][1])
        actions["renderType"]:setTexture(textures["textures.icons.icon_render_type"], renderTypes[1][2], renderTypes[1][3], 24, 24, 1)
    end)

    actions["cameraChanges"] = actionWheel.pages["funsies"]:newAction()
    :title("Can Camera be changed?")
    :toggled(false)
    :toggleTexture(textures["textures.icons.icon_funsies"], 64, 0, 16, 24, 1)
    :texture(textures["textures.icons.icon_funsies"], 80, 0, 16, 24, 1)
    :hoverColor(1, 1, 1)
    :toggleColor(0, 0, 0)
    :onToggle(function()
        if not actions["smolMode"]:isToggled() then
            renderer:setEyeOffset(0, 0, 0)
            renderer:setOffsetCameraPivot(0, 0, 0)
        else
            renderer:setEyeOffset(0, -1, 0)
            renderer:setOffsetCameraPivot(0, -1, 0)
        end
    end)
    :onUntoggle(function()
        renderer:setEyeOffset(0, 0, 0)
        renderer:setOffsetCameraPivot(0, 0, 0)
    end)

    actions["smolMode"] = actionWheel.pages["funsies"]:newAction()
    :title("Smol Mode\n\n>:3")
    :toggled(false)
    :texture(textures["textures.icons.icon_funsies"], 32, 0, 32, 24, 1)
    :toggleTexture(textures["textures.icons.icon_funsies"], 0, 0, 32, 24, 1)
    :hoverColor(1, 1, 1)
    :toggleColor(0, 0, 0)
    :onToggle(function()
        pings.setScale(vec(0.5, 0.5, 0.5))
        if not actions["cameraChanges"]:isToggled() then
            renderer:setEyeOffset(0, 0, 0)
            renderer:setOffsetCameraPivot(0, 0, 0)
        else
            renderer:setEyeOffset(0, -1, 0)
            renderer:setOffsetCameraPivot(0, -1, 0)
        end
    end)
    :onUntoggle(function()
        pings.setScale(vec(1, 1, 1))
        renderer:setEyeOffset(0, 0, 0)
        renderer:setOffsetCameraPivot(0, 0, 0)
    end)
end

---@class Funsies
local Funsies = {
    init = init,
    renderTypes = loadRenderTypes
}

return Funsies