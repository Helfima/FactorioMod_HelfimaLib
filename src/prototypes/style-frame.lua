local default_gui = data.raw["gui-style"].default

local style_element_list = {
    { suffix = "yellow", x = 0, y = 16 },
    { suffix = "orange", x = 0, y = 24 },
    { suffix = "red", x = 0, y = 32 },
    { suffix = "green", x = 0, y = 40 },
    { suffix = "blue", x = 0, y = 48 },
    { suffix = "gray", x = 0, y = 56 },
    { suffix = "magenta", x = 0, y = 64 },
    { suffix = "none", x = 0, y = 72 }
}
local style_element_max = 7

for _, style in pairs(style_element_list) do
    for i = 1, style_element_max do
        local style_name = table.concat({ "helfima_lib_frame_colored", style.suffix, i }, "_")
        local x = style.x + (i - 1) * 8
        local y = style.y

        default_gui[style_name] = {
            type                     = "frame_style",
            graphical_set            = {
                filename = "__HelfimaLib__/graphics/gui.png",
                corner_size = 1,
                position = { x, y }
            },
            top_padding              = 0,
            right_padding            = 0,
            bottom_padding           = 0,
            left_padding             = 0,
            horizontally_stretchable = "on",
            vertically_stretchable   = "on"
        }
    end
end

default_gui["helfima_lib_flow_default"] = {
    type = "flow_style",
    horizontal_spacing = 1,
    vertical_spacing = 1
}

default_gui["helfima_lib_flow_horizontal"] = {
    type = "horizontal_flow_style",
    horizontal_spacing = 0
}

default_gui["helfima_lib_flow_vertical"] = {
    type = "vertical_flow_style",
    vertical_spacing = 0
}
