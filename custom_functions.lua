local animFace = true

function AnimFace(bool)
    animFace = not(bool)
end

function Note(note)
    local refTable = {
        cb = "basedrum",
        wd = "bass",
        sd = "snare",
        pz = "harp"
    }
    local sound = refTable[string.sub(note,1,2)]
    local clicks = tonumber(string.sub(note,3,4))

    sounds:playSound("minecraft:block.note_block."..sound, player:getPos(), 100, 0.5*(2^(clicks/12)))
end

local customFunctions = {
    firstToLast = function(t)
        local firstItem = t[1]
        for i = 1, #t - 1 do
            t[i] = t[i + 1]
        end
        t[#t] = firstItem
    end,
    canFaceChange = function()
        return animFace
    end,
    tablelength = function(t)
        local count = 0
        for _ in pairs(t) do count = count + 1 end
        return count
    end,
    getAnimation = function(name)
        for i,v in ipairs(animations:getAnimations()) do
            if v:getName() == name then
                return v
            end
        end
    end
}

return customFunctions