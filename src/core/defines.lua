defines = defines or {}
defines.events = defines.events or {}

defines.mod = {}

defines.mod.events = {}
defines.mod.events.on_gui_action = "on_gui_action"
defines.mod.events.on_gui_queue = "on_gui_queue"
defines.mod.events.on_gui_event = "on_gui_event"
defines.mod.events.on_gui_open = "on_gui_open"
defines.mod.events.on_gui_update = "on_gui_update"
defines.mod.events.on_gui_close = "on_gui_close"
defines.mod.events.on_gui_error = "on_gui_error"
defines.mod.events.on_gui_message = "on_gui_message"
defines.mod.events.on_gui_mod_menu = "on_gui_mod_menu"
defines.mod.events.on_gui_reset = "on_gui_reset"
defines.mod.events.on_before_delete_cache = "on_before_delete_cache"
defines.mod.events.on_console_command = "on_console_command"

defines.mod.events.pattern = "([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)"

defines.mod.events.clickable_type = {}
defines.mod.events.clickable_type["button"] = true
defines.mod.events.clickable_type["sprite-button"] = true
defines.mod.events.clickable_type["choose-elem-button"] = false

defines.mod.command = {}
defines.mod.command.action = {}
defines.mod.command.action.menu="menu"
defines.mod.command.action.reset_ui="reset_ui"

defines.mod.direction = {}
defines.mod.direction.horizontal = "horizontal"
defines.mod.direction.vertical = "vertical"

defines.mod.styles = {}
defines.mod.styles.mod_gui_button = "frame_button"

defines.mod.styles.scroll = {}
defines.mod.styles.scroll.default = "scroll_pane"

defines.mod.styles.frame = {}
defines.mod.styles.frame.default = "frame"
defines.mod.styles.frame.inside_deep = "inside_deep_frame"
defines.mod.styles.frame.invisible ="invisible_frame"
defines.mod.styles.frame.action_button ="frame_action_button"
defines.mod.styles.frame.inner_padding = "inside_shallow_frame_with_padding"
defines.mod.styles.frame.inner = "inside_shallow_frame"
defines.mod.styles.frame.inner_tab = "inside_deep_frame_for_tabs"
defines.mod.styles.frame.subheader_frame ="subheader_frame"

defines.mod.styles.frame.colored = {}
defines.mod.styles.frame.colored.yellow1 = "helfima_lib_frame_colored_yellow_1"
defines.mod.styles.frame.colored.yellow2 = "helfima_lib_frame_colored_yellow_2"
defines.mod.styles.frame.colored.yellow3 = "helfima_lib_frame_colored_yellow_3"
defines.mod.styles.frame.colored.yellow4 = "helfima_lib_frame_colored_yellow_4"
defines.mod.styles.frame.colored.yellow5 = "helfima_lib_frame_colored_yellow_5"
defines.mod.styles.frame.colored.yellow6 = "helfima_lib_frame_colored_yellow_6"
defines.mod.styles.frame.colored.yellow7 = "helfima_lib_frame_colored_yellow_7"
defines.mod.styles.frame.colored.orange1 = "helfima_lib_frame_colored_orange_1"
defines.mod.styles.frame.colored.orange2 = "helfima_lib_frame_colored_orange_2"
defines.mod.styles.frame.colored.orange3 = "helfima_lib_frame_colored_orange_3"
defines.mod.styles.frame.colored.orange4 = "helfima_lib_frame_colored_orange_4"
defines.mod.styles.frame.colored.orange5 = "helfima_lib_frame_colored_orange_5"
defines.mod.styles.frame.colored.orange6 = "helfima_lib_frame_colored_orange_6"
defines.mod.styles.frame.colored.orange7 = "helfima_lib_frame_colored_orange_7"
defines.mod.styles.frame.colored.red1 = "helfima_lib_frame_colored_red_1"
defines.mod.styles.frame.colored.red2 = "helfima_lib_frame_colored_red_2"
defines.mod.styles.frame.colored.red3 = "helfima_lib_frame_colored_red_3"
defines.mod.styles.frame.colored.red4 = "helfima_lib_frame_colored_red_4"
defines.mod.styles.frame.colored.red5 = "helfima_lib_frame_colored_red_5"
defines.mod.styles.frame.colored.red6 = "helfima_lib_frame_colored_red_6"
defines.mod.styles.frame.colored.red7 = "helfima_lib_frame_colored_red_7"
defines.mod.styles.frame.colored.green1 = "helfima_lib_frame_colored_green_1"
defines.mod.styles.frame.colored.green2 = "helfima_lib_frame_colored_green_2"
defines.mod.styles.frame.colored.green3 = "helfima_lib_frame_colored_green_3"
defines.mod.styles.frame.colored.green4 = "helfima_lib_frame_colored_green_4"
defines.mod.styles.frame.colored.green5 = "helfima_lib_frame_colored_green_5"
defines.mod.styles.frame.colored.green6 = "helfima_lib_frame_colored_green_6"
defines.mod.styles.frame.colored.green7 = "helfima_lib_frame_colored_green_7"
defines.mod.styles.frame.colored.blue1 = "helfima_lib_frame_colored_blue_1"
defines.mod.styles.frame.colored.blue2 = "helfima_lib_frame_colored_blue_2"
defines.mod.styles.frame.colored.blue3 = "helfima_lib_frame_colored_blue_3"
defines.mod.styles.frame.colored.blue4 = "helfima_lib_frame_colored_blue_4"
defines.mod.styles.frame.colored.blue5 = "helfima_lib_frame_colored_blue_5"
defines.mod.styles.frame.colored.blue6 = "helfima_lib_frame_colored_blue_6"
defines.mod.styles.frame.colored.blue7 = "helfima_lib_frame_colored_blue_7"
defines.mod.styles.frame.colored.gray1 = "helfima_lib_frame_colored_gray_1"
defines.mod.styles.frame.colored.gray2 = "helfima_lib_frame_colored_gray_2"
defines.mod.styles.frame.colored.gray3 = "helfima_lib_frame_colored_gray_3"
defines.mod.styles.frame.colored.gray4 = "helfima_lib_frame_colored_gray_4"
defines.mod.styles.frame.colored.gray5 = "helfima_lib_frame_colored_gray_5"
defines.mod.styles.frame.colored.gray6 = "helfima_lib_frame_colored_gray_6"
defines.mod.styles.frame.colored.gray7 = "helfima_lib_frame_colored_gray_7"
defines.mod.styles.frame.colored.magenta1 = "helfima_lib_frame_colored_magenta_1"
defines.mod.styles.frame.colored.magenta2 = "helfima_lib_frame_colored_magenta_2"
defines.mod.styles.frame.colored.magenta3 = "helfima_lib_frame_colored_magenta_3"
defines.mod.styles.frame.colored.magenta4 = "helfima_lib_frame_colored_magenta_4"
defines.mod.styles.frame.colored.magenta5 = "helfima_lib_frame_colored_magenta_5"
defines.mod.styles.frame.colored.magenta6 = "helfima_lib_frame_colored_magenta_6"
defines.mod.styles.frame.colored.magenta7 = "helfima_lib_frame_colored_magenta_7"
defines.mod.styles.frame.colored.none1 = "helfima_lib_frame_colored_none_1"
defines.mod.styles.frame.colored.none2 = "helfima_lib_frame_colored_none_2"
defines.mod.styles.frame.colored.none3 = "helfima_lib_frame_colored_none_3"
defines.mod.styles.frame.colored.none4 = "helfima_lib_frame_colored_none_4"
defines.mod.styles.frame.colored.none5 = "helfima_lib_frame_colored_none_5"
defines.mod.styles.frame.colored.none6 = "helfima_lib_frame_colored_none_6"
defines.mod.styles.frame.colored.none7 = "helfima_lib_frame_colored_none_7"

defines.mod.styles.label = {}
defines.mod.styles.label.frame_title = "frame_title"
defines.mod.styles.label.frame_subheading = "frame_subheading_label"
defines.mod.styles.label.subheader = "subheader_label"
defines.mod.styles.label.heading_2 = "heading_2_label"
defines.mod.styles.label.bold_grey ="bold_grey_label"
defines.mod.styles.label.bold = "bold_label"

defines.mod.styles.flow = {}
defines.mod.styles.flow.default = "helfima_lib_flow_default"
defines.mod.styles.flow.horizontal = "helfima_lib_flow_horizontal"
defines.mod.styles.flow.vertical = "helfima_lib_flow_vertical"

defines.mod.styles.table = {}
defines.mod.styles.table.default="helfima_lib_table_default"
defines.mod.styles.table.bordered="helfima_lib_table_border"
defines.mod.styles.table.bordered_white="helfima_lib_table_border_white"
defines.mod.styles.table.bordered_gray="helfima_lib_table_border_gray"
defines.mod.styles.table.bordered_green="helfima_lib_table_border_green"
defines.mod.styles.table.bordered_yellow="helfima_lib_table_border_yellow"
defines.mod.styles.table.bordered_red="helfima_lib_table_border_red"
defines.mod.styles.table.bordered_blue="helfima_lib_table_border_blue"

defines.mod.styles.button = {}
defines.mod.styles.button.link = "helfima_lib_link"
defines.mod.styles.button.menu_default = "helfima_lib_button_menu_default"
defines.mod.styles.button.menu_sm_default = "helfima_lib_button_menu_sm_default"
defines.mod.styles.button.menu_tool_default = "helfima_lib_button_menu_tool_default"
defines.mod.styles.button.menu = "helfima_lib_button_menu"
defines.mod.styles.button.menu_sm = "helfima_lib_button_menu_sm"
defines.mod.styles.button.menu_tool = "helfima_lib_button_menu_tool"
defines.mod.styles.button.menu_selected = "helfima_lib_button_menu_selected"
defines.mod.styles.button.menu_sm_selected = "helfima_lib_button_menu_sm_selected"
defines.mod.styles.button.menu_tool_selected = "helfima_lib_button_menu_tool_selected"
defines.mod.styles.button.menu_dark = "helfima_lib_button_menu_dark"
defines.mod.styles.button.menu_sm_dark = "helfima_lib_button_menu_sm_dark"
defines.mod.styles.button.menu_tool_dark = "helfima_lib_button_menu_tool_dark"
defines.mod.styles.button.menu_dark_selected = "helfima_lib_button_menu_dark_selected"
defines.mod.styles.button.menu_sm_dark_selected = "helfima_lib_button_menu_sm_dark_selected"
defines.mod.styles.button.menu_tool_dark_selected = "helfima_lib_button_menu_tool_dark_selected"
defines.mod.styles.button.menu_bold = "helfima_lib_button_menu_bold"
defines.mod.styles.button.menu_sm_bold = "helfima_lib_button_menu_sm_bold"
defines.mod.styles.button.menu_tool_bold = "helfima_lib_button_menu_tool_bold"
defines.mod.styles.button.menu_bold_selected = "helfima_lib_button_menu_bold_selected"
defines.mod.styles.button.menu_sm_bold_selected = "helfima_lib_button_menu_sm_bold_selected"
defines.mod.styles.button.menu_tool_bold_selected = "helfima_lib_button_menu_tool_bold_selected"
defines.mod.styles.button.menu_dark_bold = "helfima_lib_button_menu_dark_bold"
defines.mod.styles.button.menu_sm_dark_bold = "helfima_lib_button_menu_sm_dark_bold"
defines.mod.styles.button.menu_tool_dark_bold = "helfima_lib_button_menu_tool_dark_bold"
defines.mod.styles.button.menu_dark_bold_selected = "helfima_lib_button_menu_dark_bold_selected"
defines.mod.styles.button.menu_sm_dark_bold_selected = "helfima_lib_button_menu_sm_dark_bold_selected"
defines.mod.styles.button.menu_tool_dark_bold_selected = "helfima_lib_button_menu_tool_dark_bold_selected"
defines.mod.styles.button.menu_red = "helfima_lib_button_menu_red"
defines.mod.styles.button.menu_sm_red = "helfima_lib_button_menu_sm_red"
defines.mod.styles.button.menu_tool_red = "helfima_lib_button_menu_tool_red"
defines.mod.styles.button.menu_dark_red = "helfima_lib_button_menu_dark_red"
defines.mod.styles.button.menu_sm_dark_red = "helfima_lib_button_menu_sm_dark_red"
defines.mod.styles.button.menu_tool_dark_red = "helfima_lib_button_menu_tool_dark_red"
defines.mod.styles.button.menu_actived_red = "helfima_lib_button_menu_actived_red"
defines.mod.styles.button.menu_sm_actived_red = "helfima_lib_button_menu_sm_actived_red"
defines.mod.styles.button.menu_tool_actived_red = "helfima_lib_button_menu_tool_actived_red"
defines.mod.styles.button.menu_selected_red = "helfima_lib_button_menu_selected_red"
defines.mod.styles.button.menu_sm_selected_red = "helfima_lib_button_menu_sm_selected_red"
defines.mod.styles.button.menu_tool_selected_red = "helfima_lib_button_menu_tool_selected_red"
defines.mod.styles.button.menu_green = "helfima_lib_button_menu_green"
defines.mod.styles.button.menu_sm_green = "helfima_lib_button_menu_sm_green"
defines.mod.styles.button.menu_tool_green = "helfima_lib_button_menu_tool_green"
defines.mod.styles.button.menu_dark_green = "helfima_lib_button_menu_dark_green"
defines.mod.styles.button.menu_sm_dark_green = "helfima_lib_button_menu_sm_dark_green"
defines.mod.styles.button.menu_tool_dark_green = "helfima_lib_button_menu_tool_dark_green"
defines.mod.styles.button.menu_actived_green = "helfima_lib_button_menu_actived_green"
defines.mod.styles.button.menu_sm_actived_green = "helfima_lib_button_menu_sm_actived_green"
defines.mod.styles.button.menu_tool_actived_green = "helfima_lib_button_menu_tool_actived_green"
defines.mod.styles.button.menu_selected_green = "helfima_lib_button_menu_selected_green"
defines.mod.styles.button.menu_sm_selected_green = "helfima_lib_button_menu_sm_selected_green"
defines.mod.styles.button.menu_tool_selected_green = "helfima_lib_button_menu_tool_selected_green"
defines.mod.styles.button.menu_selected_yellow = "helfima_lib_button_menu_selected_yellow"
defines.mod.styles.button.menu_sm_selected_yellow = "helfima_lib_button_menu_sm_selected_yellow"
defines.mod.styles.button.menu_tool_selected_yellow = "helfima_lib_button_menu_tool_selected_yellow"
defines.mod.styles.button.menu_flat2 = "helfima_lib_button_menu_flat2"
defines.mod.styles.button.menu_flat = "helfima_lib_button_menu_flat"
defines.mod.styles.button.menu_sm_flat = "helfima_lib_button_menu_sm_flat"

defines.mod.styles.button.default = "helfima_lib_button_default"
defines.mod.styles.button.selected = "helfima_lib_button_selected"
defines.mod.styles.button.icon_default = "helfima_lib_button_icon_default"

defines.mod.styles.button.icon = "helfima_lib_button_icon"
defines.mod.styles.button.icon_xxl = "helfima_lib_button_icon_xxl"
defines.mod.styles.button.icon_m = "helfima_lib_button_icon_m"
defines.mod.styles.button.icon_sm = "helfima_lib_button_icon_sm"

defines.mod.styles.button.slot = "helfima_lib_button_slot"
defines.mod.styles.button.slot_m = "helfima_lib_button_slot_m"
defines.mod.styles.button.slot_sm = "helfima_lib_button_slot_sm"

defines.mod.styles.button.select_icon = "helfima_lib_button_select_icon"
defines.mod.styles.button.select_icon_green = "helfima_lib_button_select_icon_green"
defines.mod.styles.button.select_icon_yellow = "helfima_lib_button_select_icon_yellow"
defines.mod.styles.button.select_icon_red = "helfima_lib_button_select_icon_red"
defines.mod.styles.button.select_icon_flat = "helfima_lib_button_select_icon_flat"

defines.mod.styles.button.select_icon_xxl = "helfima_lib_button_select_icon_xxl"
defines.mod.styles.button.select_icon_xxl_green = "helfima_lib_button_select_icon_xxl_green"
defines.mod.styles.button.select_icon_xxl_yellow = "helfima_lib_button_select_icon_xxl_yellow"
defines.mod.styles.button.select_icon_xxl_red = "helfima_lib_button_select_icon_xxl_red"
defines.mod.styles.button.select_icon_xxl_flat = "helfima_lib_button_select_icon_xxl_flat"

defines.mod.styles.button.select_icon_m = "helfima_lib_button_select_icon_m"
defines.mod.styles.button.select_icon_m_green = "helfima_lib_button_select_icon_m_green"
defines.mod.styles.button.select_icon_m_yellow = "helfima_lib_button_select_icon_m_yellow"
defines.mod.styles.button.select_icon_m_red = "helfima_lib_button_select_icon_m_red"
defines.mod.styles.button.select_icon_m_flat = "helfima_lib_button_select_icon_m_flat"

defines.mod.styles.button.select_icon_sm = "helfima_lib_button_select_icon_sm"
defines.mod.styles.button.select_icon_sm_green = "helfima_lib_button_select_icon_sm_green"
defines.mod.styles.button.select_icon_sm_yellow = "helfima_lib_button_select_icon_sm_yellow"
defines.mod.styles.button.select_icon_sm_red = "helfima_lib_button_select_icon_sm_red"
defines.mod.styles.button.select_icon_sm_flat = "helfima_lib_button_select_icon_sm_flat"

defines.mod.views = {}
defines.mod.views.locate = {}
defines.mod.views.locate.top="top"
defines.mod.views.locate.left="left"
defines.mod.views.locate.center="center"
defines.mod.views.locate.goal="goal"
defines.mod.views.locate.screen="screen"
defines.mod.views.locate.relative="relative"

defines.mod.tags = {}
defines.mod.tags.color = {}
defines.mod.tags.color.close = "[/color]"
defines.mod.tags.color.white = "[color=255,255,255]"
defines.mod.tags.color.gray = "[color=229,229,229]"
defines.mod.tags.color.yellow = "[color=255,222,61]"
defines.mod.tags.color.red = "[color=255,0,0]"
defines.mod.tags.color.red_light = "[color=255,50,50]"
defines.mod.tags.color.green = "[color=0,127,14]"
defines.mod.tags.color.green_light = "[color=50,200,50]"
defines.mod.tags.color.blue = "[color=66,141,255]"
defines.mod.tags.color.blue_light = "[color=100,200,255]"
defines.mod.tags.color.gold = "[color=255,230,192]"
defines.mod.tags.color.orange = "[color=255,106,0]"
defines.mod.tags.color.black = "[color=0,0,0]"

defines.mod.tags.font = {}
defines.mod.tags.font.close = "[/font]"
defines.mod.tags.font.default_bold = "[font=default-bold]"
defines.mod.tags.font.default_semibold = "[font=default-semibold]"
defines.mod.tags.font.default_large_bold = "[font=default-large-bold]"

defines.mod.cardinal = {}
defines.mod.cardinal.unknown = 0
defines.mod.cardinal.north = 1
defines.mod.cardinal.east = 2
defines.mod.cardinal.south = 4
defines.mod.cardinal.west = 8

defines.mod.index_gui_type = {}
defines.mod.index_gui_type.controller_gui=3