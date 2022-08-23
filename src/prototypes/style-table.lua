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