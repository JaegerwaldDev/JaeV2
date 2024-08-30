local pages = {
    main = action_wheel:newPage()
}
action_wheel:setPage(pages["main"])

local function loadFolders(page, table)
    for _, v in ipairs(table) do
        pages[v[1]] = action_wheel:newPage(v[1])
        pages[v[1]]:newAction()
        :title("Back")
        :texture(textures["textures.icons.icon_back"], 0, 0, 16, 16, 1)
        :hoverColor(1, 1, 1)
        :onLeftClick(function()
            action_wheel:setPage(page)
        end)

        page:newAction()
        :title(v[2])
        :texture(textures[v[3]], v[4], v[5], v[6], v[7])
        :hoverColor(1, 1, 1)
        :onLeftClick(function()
            action_wheel:setPage(pages[v[1]])
        end)
    end
end

---@class CustomActionWheelAPI
local CustomActionWheelAPI = {
    loadFolders = loadFolders,
    pages = pages
}

return CustomActionWheelAPI -- made w/ <3 by Jaegerwald