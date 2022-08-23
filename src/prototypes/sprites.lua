local function sprite_mipmap(name, size, count)
    local icon_name = "helfima-lib-" .. name
    return {
        type = "sprite",
        name = icon_name,
        filename = "__HelfimaLib__/graphics/icons/" .. name .. ".png",
        size = size,
        mipmap_count = count,
        flags = { "gui-icon" }
    }
end

local mipmaps = require("__HelfimaLib__.prototypes.sprites_builded")

local spite_icons = {}

for icon_row, icon in pairs(mipmaps) do
    table.insert(spite_icons, sprite_mipmap(icon.name, icon.size, icon.count))
end
data:extend(spite_icons)
