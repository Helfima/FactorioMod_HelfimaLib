function border_image_set()
  return
  {
    border_width = 8,
    vertical_line = {position = {0, 40}, size = {8, 1}},
    horizontal_line = {position = {8, 40}, size = {1, 8}},
    top_right_corner = {position = {16, 40}, size = {8, 8}},
    bottom_right_corner = {position = {24, 40}, size = {8, 8}},
    bottom_left_corner = {position = {32, 40}, size = {8, 8}},
    top_left_coner = {position = {40, 40}, size = {8, 8}},
    top_t = {position = {64, 40}, size = {8, 8}},
    right_t = {position = {72, 40}, size = {8, 8}},
    bottom_t = {position = {48, 40}, size = {8, 8}},
    left_t = {position = {56, 40}, size = {8, 8}},
    cross = {position = {80, 40}, size = {8, 8}},
    top_end = {position = {88, 40}, size = {8, 8}},
    right_end = {position = {96, 40}, size = {8, 8}},
    bottom_end = {position = {104, 40}, size = {8, 8}},
    left_end = {position = {112, 40}, size = {8, 8}}
  }
end

local default_gui = data.raw["gui-style"].default

default_gui["helfima_lib_table_default"] = {
  type = "table_style",
  horizontal_spacing = 2,
  vertical_spacing = 2,
  cell_spacing = 4,
  top_padding = 0,
  right_padding = 1,
  bottom_padding = 0,
  left_padding = 1,
  vertical_align = "top"
}

default_gui["helfima_lib_table_border"] = {
  type = "table_style",
  parent = "helfima_lib_table_default",
  border = border_image_set(),
}