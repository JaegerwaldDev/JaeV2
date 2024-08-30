-- READ license.lua !
local swingOnBody = require("libs.swinging_physics").swingOnBody

vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)

local expressions = require("expressions")
local funsies = require("funsies")

function events.entity_init()
    funsies.init()

    -- Lmao these physics are just copy pasted from the old avatar
    swingOnBody(models.model.root.Torso.Body.Tail, 0, {-90, 11.25, -180, 11.25, -22.5, 22.5}, models.model.root.Torso.Body, -5)
    swingOnBody(models.model.root.Torso.Body.Tail.TailBottom, 0, {-11.25, 11.25, -11.25, 11.25, -11.25, 11.25}, models.model.root.Torso.Body.Tail, 0.5)
end

function events.tick()
    expressions.tick()
end

--render event, called every time your avatar is rendered
--it have two arguments, "delta" and "context"
--"delta" is the percentage between the last and the next tick (as a decimal value, 0.0 to 1.0)
--"context" is a string that tells from where this render event was called (the paperdoll, gui, player render, first person)
function events.render(delta, context)
end