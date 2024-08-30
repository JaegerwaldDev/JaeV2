local actionWheel = require("action_wheel")
local cf = require("custom_functions")

---Configure this to make sure the expression system works with your avatar.
local eyeParts
local function eyeModelParts(leftPart, rightPart)
    eyeParts = {
        leftPart,
        rightPart
    }
end

local mode, curFrames, changeValue
local function default(expressionMode, frames, changerValue)
    mode = expressionMode
    curFrames = frames
    changeValue = changerValue or 40
end

local frameData = {}
local animCount

function pings.setExpression(m, t, v)
    mode = m
    curFrames = t
    changeValue, animCount = v, v
end

function SetFace(right, left)
    eyeParts[1]
    :primaryTexture("CUSTOM", textures[frameData[left][1]])
    :secondaryTexture("CUSTOM", textures[frameData[left][2]])
    :uvPixels(frameData[left][3], frameData[left][4])
    eyeParts[2]
    :primaryTexture("CUSTOM", textures[frameData[right][1]])
    :secondaryTexture("CUSTOM", textures[frameData[right][2]])
    :uvPixels(frameData[right][3], frameData[right][4])
end

local ticks = {
    static = function()
        SetFace(curFrames[1], curFrames[1])
    end,
    matchedStatic = function()
        SetFace(curFrames[1], curFrames[2])
    end,
    blinking = function()
        if math.random(0, changeValue) == 0 then
            SetFace(curFrames[2], curFrames[2])
        else
            SetFace(curFrames[1], curFrames[1])
        end
    end,
    matchedBlinking = function()
        if math.random(0, changeValue) == 0 then
            SetFace(curFrames[1][2], curFrames[2][2])
        else
            SetFace(curFrames[1][1], curFrames[2][1])
        end
    end,
    animated = function()
        if animCount == 0 then
            animCount = changeValue
            cf.firstToLast(curFrames)
            SetFace(curFrames[1], curFrames[1])
        else
            animCount = math.max(animCount-1, 0)
            SetFace(curFrames[1], curFrames[1])
        end
    end
}

---Required for Animations to run.
local function tick()
    if cf.canFaceChange() then 
        ticks[mode]()
    end
end

local function loadFrames(table)
    for _, v in ipairs(table) do
        frameData[v[1]] = {
            "textures.face"..v[2],
            "textures.face"..v[2].."_e",
            v[3],
            v[4]
        }
    end
end
local function loadExpressions(table)
    if host:isHost() then
        for _, v in ipairs(table) do
            actionWheel.pages["expressions"]:newAction()
            :title(v[1][1])
            :texture(textures["textures.icons.icon_expressions"], v[1][2], v[1][3], 24, 24, 1)
            :onLeftClick(function()
                pings.setExpression(v[2][1], v[3], v[2][2])
            end)
        end
    end
end

---@class ExpressionAPI
local ExpressionAPI = {
    eyeParts = eyeModelParts,
    default = default,
    loadFrames = loadFrames,
    loadExpressions = loadExpressions,
    tick = tick
}

return ExpressionAPI -- made w/ <3 by Jaegerwald