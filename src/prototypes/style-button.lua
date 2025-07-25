local default_gui = data.raw["gui-style"].default

---Default glow
---@param tint_value any
---@param scale_value any
---@return table
local function default_glow(tint_value, scale_value)
  return
  {
    position = {200, 128},
    corner_size = 8,
    tint = tint_value,
    scale = scale_value,
    draw_type = "outer"
  }
end
local default_dirt_color = {15, 7, 3, 100}
local default_dirt = default_glow(default_dirt_color, 0.5)

-------------------------------------------------------------------------------
---Menu Button Icon
---@param name string
---@param icon_row table
---@param icon_col table
---@param suffix string|nil
---@param font string
---@param hovered_font_color table
local function menuButtonIcon(name, icon_row, icon_col, size, suffix, font, default_font_color, hovered_font_color)
  local style_name = name
  if suffix ~= nil then style_name = style_name.."_"..suffix end
  default_gui[style_name] = {
    type = "button_style",
    font = font or "default",
    default_font_color=default_font_color,
    horizontal_align = "center",
    padding = -2,
    width = size,
    height = size,
    scalable = false,
    default_graphical_set = {base = {position = {x=icon_col[1],y=icon_row[1]}, border = 0, corner_size = 8, shadow = default_dirt}},
    hovered_graphical_set = {base = {position = {x=icon_col[2],y=icon_row[2]}, border = 0, corner_size = 8, shadow = default_dirt}},
    hovered_font_color = hovered_font_color,
    clicked_graphical_set = {base = {position = {x=icon_col[3],y=icon_row[3]}, border = 0, corner_size = 8, shadow = default_dirt}},
    disabled_graphical_set = {base = {position = {x=icon_col[4],y=icon_row[4]}, border = 0, corner_size = 8, shadow = default_dirt}},
    stretch_image_to_widget_size = false
  }
end

-------------------------------------------------------------------------------
---Menu button icons
---@param name string
---@param font? string
local function menuButtonIcons(name, font)
  local font = "default"
  local font_bold = "default-bold"
  local font_white = {r=1, g=1, b=1}
  local font_black = {r=0, g=0, b=0}

  local function icon_row(default, hovered, clicked, disabled) 
    return {17 * (default - 1), 17 * (hovered - 1), 17 * (clicked - 1), 17 * (disabled - 1)}
  end
  local function icon_col(default, hovered, clicked, disabled) 
    if default == nil then return {570,570,570,570} end
    return {17 * (default - 1), 17 * (hovered - 1), 17 * (clicked - 1), 386 + 17 * (disabled - 1)}
  end
  local size_default=32
  local size_sm=24
  local size_tool=28
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_default, "default", font, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_sm, "sm_default", font, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_tool, "tool_default", font, font_white, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_default, nil, font, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_sm, "sm", font, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_tool, "tool", font, font_white, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(2,3,4,1), size_default, "selected", font, font_black, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(2,3,4,1), size_sm, "sm_selected", font, font_black, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(2,3,4,1), size_tool, "tool_selected", font, font_black, font_black)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,3,4,1), size_default, "dark", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,3,4,1), size_sm, "sm_dark", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,3,4,1), size_tool, "tool_dark", font, font_white, font_black)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(3,3,4,1), size_default, "dark_selected", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(3,3,4,1), size_sm, "sm_dark_selected", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(3,3,4,1), size_tool, "tool_dark_selected", font, font_white, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_default, "bold", font_bold, font_black, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_sm, "sm_bold", font_bold, font_black, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_tool, "tool_bold", font_bold, font_black, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(2,3,4,1), size_default, "bold_selected", font_bold, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(2,3,4,1), size_sm, "sm_bold_selected", font_bold, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(2,3,4,1), size_tool, "tool_bold_selected", font_bold, font_white, font_black)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,3,4,1), size_default, "dark_bold", font_bold, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,3,4,1), size_sm, "sm_dark_bold", font_bold, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,3,4,1), size_tool, "tool_dark_bold", font_bold, font_white, font_black)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(3,3,4,1), size_default, "dark_bold_selected", font_bold, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(3,3,4,1), size_sm, "sm_dark_bold_selected", font_bold, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(3,3,4,1), size_tool, "tool_dark_bold_selected", font_bold, font_white, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,9,10,2), size_default, "red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,9,10,2), size_sm, "sm_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,9,10,2), size_tool, "tool_red", font, font_white, font_white)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,9,10,2), size_default, "dark_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,9,10,2), size_sm, "sm_dark_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,9,10,2), size_tool, "tool_dark_red", font, font_white, font_white)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(9,11,10,2), size_default, "actived_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(9,11,10,2), size_sm, "sm_actived_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(9,11,10,2), size_tool, "tool_actived_red", font, font_white, font_white)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(11,9,10,2), size_default, "selected_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(11,9,10,2), size_sm, "sm_selected_red", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(11,9,10,2), size_tool, "tool_selected_red", font, font_white, font_white)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,7,8,3), size_default, "green", font, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,7,8,3), size_sm, "sm_green", font, font_white, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,7,8,3), size_tool, "tool_green", font, font_white, font_black)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,7,8,3), size_default, "dark_green", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,7,8,3), size_sm, "sm_dark_green", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,7,8,3), size_tool, "tool_dark_green", font, font_white, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(5,7,8,3), size_default, "actived_green", font, font_black, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(5,7,8,3), size_sm, "sm_actived_green", font, font_black, font_black)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(5,7,8,3), size_tool, "tool_actived_green", font, font_black, font_black)

  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,7,8,3), size_default, "selected_green", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,7,8,3), size_sm, "sm_selected_green", font, font_white, font_black)
  menuButtonIcon(name, icon_row(1,2,2,2), icon_col(1,7,8,3), size_tool, "tool_selected_green", font, font_white, font_black)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_default, "selected_yellow", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_sm, "sm_selected_yellow", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(1,3,4,1), size_tool, "tool_selected_yellow", font, font_white, font_white)

  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(), 36, "flat2", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(), size_default, "flat", font, font_white, font_white)
  menuButtonIcon(name, icon_row(2,2,2,2), icon_col(), size_sm, "sm_flat", font, font_white, font_white)
end

menuButtonIcons("helfima_lib_button_menu")

---Monolith Icon
---@param filename any
---@param size any
---@param scale any
---@param shift any
---@param position any
---@param border table
---@param stretch any
---@return table
local function monolithIcon(filename, size, scale, shift, position, border, stretch)
  return {
    filename = filename,
    priority = "extra-high-no-scale",
    align = "center",
    size = size,
    scale = scale,
    shift = shift,
    position = position,
    border = border.top
  }
end

---Composition Icon
---@param filename any
---@param corner_size any
---@param position any
---@return table
local function compositionIcon(filename, corner_size, position)
  return {
    type = "composition",
    filename = filename,
    priority = "extra-high-no-scale",
    corner_size = corner_size,
    position = position
  }
end

local corner_size = {3, 3}

default_gui["helfima_lib_button_default"] = {
  type = "button_style",
  font = "default",
  default_font_color={r=1, g=1, b=1},
  horizontal_align = "center",
  top_padding = 2,
  right_padding = 2,
  bottom_padding = 2,
  left_padding = 2,
  height = 28,
  default_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 0}),
  hovered_font_color={r=0, g=0, b=0},
  hovered_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 8}),
  clicked_font_color={r=1, g=1, b=1},
  clicked_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 40}),
  disabled_font_color={r=0.5, g=0.5, b=0.5},
  disabled_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 16}),
  pie_progress_color = {r=1, g=1, b=1},
  stretch_image_to_widget_size = true
}

default_gui["helfima_lib_button_selected"] = {
    type = "button_style",
    font = "default",
    default_font_color={r=1, g=1, b=1},
    align = "center",
    top_padding = 2,
    right_padding = 2,
    bottom_padding = 2,
    left_padding = 2,
    height = 28,
    default_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 40}),
    hovered_font_color={r=1, g=1, b=1},
    hovered_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 40}),
    clicked_font_color={r=1, g=1, b=1},
    clicked_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 40}),
    disabled_font_color={r=0.5, g=0.5, b=0.5},
    disabled_graphical_set = compositionIcon("__core__/graphics/gui.png", corner_size, {0, 16}),
    pie_progress_color = {r=1, g=1, b=1}
  }

local icon_corner_size = 1

default_gui["helfima_lib_button_icon_default"] = {
  type = "button_style",
  parent = "helfima_lib_button_default",
  default_graphical_set = compositionIcon("__core__/graphics/gui.png", {icon_corner_size, icon_corner_size}, {3 - icon_corner_size, 3 - icon_corner_size}),
  hovered_graphical_set = compositionIcon("__core__/graphics/gui.png", {icon_corner_size, icon_corner_size}, {3 - icon_corner_size, 11 - icon_corner_size}),
  clicked_graphical_set = compositionIcon("__core__/graphics/gui.png", {icon_corner_size, icon_corner_size}, {3 - icon_corner_size, 43 - icon_corner_size}),
  disabled_graphical_set = compositionIcon("__core__/graphics/gui.png", {icon_corner_size, icon_corner_size}, {3 - icon_corner_size, 19 - icon_corner_size}),
}

local icon_sm_size=16
local icon_sm_padding=1

local icon_m_size=24
local icon_m_padding=1

local icon_size=32
local icon_padding=2

local icon_xxl_size=64
local icon_xxl_padding=2

local monolith_size=36
local monolith_scale=1

local icon_offset_y=144

local style_list = {
  {suffix="",offset = 0},
  {suffix="_red",offset = 36},
  {suffix="_yellow",offset = 72},
  {suffix="_green",offset = 108},
  {suffix="_flat"},
}

default_gui["helfima_lib_button_icon"] = {
  type = "button_style",
  parent = "helfima_lib_button_icon_default",
  width = icon_size + 2*icon_padding,
  height = icon_size + 2*icon_padding,
  top_padding = icon_padding,
  right_padding = icon_padding,
  bottom_padding = icon_padding,
  left_padding = icon_padding,
  default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=60}, {top=0,right=0,bottom=0,left=0}, true),
  scalable = false
}

default_gui["helfima_lib_button_slot"] = {
  type = "button_style",
  parent = "slot_button",
  width = icon_size + 2*icon_padding,
  height = icon_size + 2*icon_padding,
  top_padding = icon_padding,
  right_padding = icon_padding,
  bottom_padding = icon_padding,
  left_padding = icon_padding,
  scalable = false
}

for _,style in pairs(style_list) do
  if style.suffix == "_flat" then
    default_gui["helfima_lib_button_select_icon"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
    }
  else
    default_gui["helfima_lib_button_select_icon"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      hovered_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=148,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      clicked_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=184,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      disabled_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true)
    }
  end
end

default_gui["helfima_lib_button_icon_xxl"] = {
  type = "button_style",
  parent = "helfima_lib_button_icon_default",
  width = icon_xxl_size + 2*icon_xxl_padding,
  height = icon_xxl_size + 2*icon_xxl_padding,
  top_padding = icon_xxl_padding,
  right_padding = icon_xxl_padding,
  bottom_padding = icon_xxl_padding,
  left_padding = icon_xxl_padding,
  default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=60}, {top=0,right=0,bottom=0,left=0}, true),
  scalable = false
}

for _,style in pairs(style_list) do
  if style.suffix == "_flat" then
    default_gui["helfima_lib_button_select_icon_xxl"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon_xxl",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
    }
  else
    default_gui["helfima_lib_button_select_icon_xxl"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon_xxl",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      hovered_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=148,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      clicked_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=184,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      disabled_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true)
    }
  end
end

default_gui["helfima_lib_button_icon_m"] = {
  type = "button_style",
  parent = "helfima_lib_button_icon_default",
  width = icon_m_size + 2*icon_m_padding,
  height = icon_m_size + 2*icon_m_padding,
  top_padding = icon_m_padding,
  right_padding = icon_m_padding,
  bottom_padding = icon_m_padding,
  left_padding = icon_m_padding,
  default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=60}, {top=0,right=0,bottom=0,left=0}, true),
  scalable = false
}

default_gui["helfima_lib_button_slot_m"] = {
  type = "button_style",
  parent = "slot_button",
  width = icon_m_size + 2*icon_m_padding,
  height = icon_m_size + 2*icon_m_padding,
  top_padding = icon_m_padding,
  right_padding = icon_m_padding,
  bottom_padding = icon_m_padding,
  left_padding = icon_m_padding,
  scalable = false
}

for _,style in pairs(style_list) do
  if style.suffix == "_flat" then
    default_gui["helfima_lib_button_select_icon_m"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon_m",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
    }
  else
    default_gui["helfima_lib_button_select_icon_m"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon_m",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      hovered_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=148,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      clicked_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=184,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      disabled_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true)
    }
  end
end

default_gui["helfima_lib_button_icon_sm"] = {
  type = "button_style",
  parent = "helfima_lib_button_icon_default",
  width = icon_sm_size + 2*icon_sm_padding,
  height = icon_sm_size + 2*icon_sm_padding,
  top_padding = icon_sm_padding,
  right_padding = icon_sm_padding,
  bottom_padding = icon_sm_padding,
  left_padding = icon_sm_padding,
  default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=60}, {top=0,right=0,bottom=0,left=0}, true),
  scalable = false
}

default_gui["helfima_lib_button_slot_sm"] = {
  type = "button_style",
  parent = "slot_button",
  width = icon_sm_size + 2*icon_sm_padding,
  height = icon_sm_size + 2*icon_sm_padding,
  top_padding = icon_sm_padding,
  right_padding = icon_sm_padding,
  bottom_padding = icon_sm_padding,
  left_padding = icon_sm_padding,
  scalable = false
}

for _,style in pairs(style_list) do
  if style.suffix == "_flat" then
    default_gui["helfima_lib_button_select_icon_sm"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon_sm",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
    }
  else
    default_gui["helfima_lib_button_select_icon_sm"..style.suffix] = {
      type = "button_style",
      parent = "helfima_lib_button_icon_sm",
      default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      hovered_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=148,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      clicked_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=184,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true),
      disabled_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=111,y=icon_offset_y+style.offset}, {top=0,right=0,bottom=0,left=0}, true)
    }
  end
end

local blank_image= {
  filename = "__HelfimaLib__/graphics/blank.png",
  priority = "very-low",
  width = 1,
  height = 1,
  frame_count = 1,
  scale = 8,
}

default_gui["helfima_lib_sort_checkbox_inactive"] = {
  type = "checkbox_style",
  font = "default",
  padding = 0,
  text_padding = 5,
  default_graphical_set = blank_image,
  hovered_graphical_set = blank_image,
  clicked_graphical_set = blank_image,
  disabled_graphical_set = blank_image,
  selected_graphical_set = blank_image,
  selected_hovered_graphical_set = blank_image,
  selected_clicked_graphical_set = blank_image,
  selected_disabled_graphical_set = blank_image,
  checkmark = blank_image,
  disabled_checkmark = blank_image
}

default_gui["helfima_lib_sort_checkbox"] = {
  type = "checkbox_style",
  parent = "helfima_lib_sort_checkbox_inactive",
  default_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  hovered_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-down-hover.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  clicked_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  disabled_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-down-white.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  selected_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  selected_hovered_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-up-hover.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  selected_clicked_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
    size = { 16, 16 },
    scale = 0.5,
  },
  selected_disabled_graphical_set = {
    filename = "__core__/graphics/arrows/table-header-sort-arrow-up-white.png",
    size = { 16, 16 },
    scale = 0.5,
  }
}

default_gui["helfima_lib_sort_checkbox_bold_inactive"] = {
  type = "checkbox_style",
  parent = "helfima_lib_sort_checkbox_inactive",
  font = "default-bold"
}

default_gui["helfima_lib_sort_checkbox_bold"] = {
  type = "checkbox_style",
  parent = "helfima_lib_sort_checkbox",
  font = "default-bold"
}

gui_color =
{
    white = { 1, 1, 1 },
    white_with_alpha = { 1, 1, 1, 0.5 },
    grey = { 0.5, 0.5, 0.5 },
    green = { 0, 1, 0 },
    red = { 255, 142, 142 },
    orange = { 0.98, 0.66, 0.22 },
    light_orange = { 1, 0.74, 0.40 },
    caption = { 255, 230, 192 },
    achievement_green = { 210, 253, 145 },
    achievement_tan = { 255, 230, 192 },
    achievement_failed = { 176, 171, 171 },
    achievement_failed_body = { 255, 136, 136 },
    blue = { 128, 206, 240 }
}

default_gui["helfima_lib_link"] = {
  type = "button_style",
  parent = "helfima_lib_button_default",
  horizontal_align = "left",
  font = "default-bold",
  minimal_width = 0,
  height = 19,
  padding = 1,
  margin = 1,
  default_font_color = gui_color.light_orange,
  hovered_font_color = gui_color.grey,
  default_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
  hovered_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
  clicked_graphical_set = monolithIcon("__core__/graphics/gui.png", monolith_size, monolith_scale, {0,0}, {x=0,y=150}, {top=0,right=0,bottom=0,left=0}, true),
  
}

default_gui["helfima_lib_link2"] = {
  type = "button_style",
  parent = "helfima_lib_link",
  default_font_color = gui_color.orange,
  hovered_font_color = gui_color.grey,
}