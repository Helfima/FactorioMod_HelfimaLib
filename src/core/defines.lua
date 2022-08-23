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
defines.mod.events.on_console_command = "on_console_command"

defines.mod.events.pattern = "([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)=?([^=]*)"

defines.mod.events.clickable_type = {}
defines.mod.events.clickable_type["button"] = true
defines.mod.events.clickable_type["sprite-button"] = true
defines.mod.events.clickable_type["choose-elem-button"] = true

defines.mod.command = {}
defines.mod.command.action = {}
defines.mod.command.action.menu="menu"
defines.mod.command.action.reset_ui="reset_ui"

defines.mod.direction = {}
defines.mod.direction.horizontal = "horizontal"
defines.mod.direction.vertical = "vertical"

defines.mod.styles = {}
defines.mod.styles.mod_gui_button = "frame_button"

defines.mod.styles.frame = {}
defines.mod.styles.frame.default = "frame"
defines.mod.styles.frame.inside_deep = "inside_deep_frame"
defines.mod.styles.frame.inner_outer = "inner_frame_in_outer_frame"
defines.mod.styles.frame.invisible ="invisible_frame"
defines.mod.styles.frame.action_button ="frame_action_button"
defines.mod.styles.frame.inner = "inside_shallow_frame_with_padding"
defines.mod.styles.frame.inner_tab = "inside_deep_frame_for_tabs"

defines.mod.styles.label = {}
defines.mod.styles.label.heading_2 = "heading_2_label"

defines.mod.styles.flow = {}
defines.mod.styles.flow.default = "helfima_lib_flow_default"
defines.mod.styles.flow.horizontal = "helfima_lib_flow_horizontal"
defines.mod.styles.flow.vertical = "helfima_lib_flow_vertical"

defines.mod.styles.button = {}
defines.mod.styles.button.menu_default = "helfima_lib_button_menu_default"
defines.mod.styles.button.menu_sm_default = "helfima_lib_button_menu_sm_default"
defines.mod.styles.button.menu = "helfima_lib_button_menu"
defines.mod.styles.button.menu_sm = "helfima_lib_button_menu_sm"
defines.mod.styles.button.menu_selected = "helfima_lib_button_menu_selected"
defines.mod.styles.button.menu_sm_selected = "helfima_lib_button_menu_sm_selected"
defines.mod.styles.button.menu_dark = "helfima_lib_button_menu_dark"
defines.mod.styles.button.menu_sm_dark = "helfima_lib_button_menu_sm_dark"
defines.mod.styles.button.menu_dark_selected = "helfima_lib_button_menu_dark_selected"
defines.mod.styles.button.menu_sm_dark_selected = "helfima_lib_button_menu_sm_dark_selected"
defines.mod.styles.button.menu_bold = "helfima_lib_button_menu_bold"
defines.mod.styles.button.menu_sm_bold = "helfima_lib_button_menu_sm_bold"
defines.mod.styles.button.menu_bold_selected = "helfima_lib_button_menu_bold_selected"
defines.mod.styles.button.menu_sm_bold_selected = "helfima_lib_button_menu_sm_bold_selected"
defines.mod.styles.button.menu_dark_bold = "helfima_lib_button_menu_dark_bold"
defines.mod.styles.button.menu_sm_dark_bold = "helfima_lib_button_menu_sm_dark_bold"
defines.mod.styles.button.menu_dark_bold_selected = "helfima_lib_button_menu_dark_bold_selected"
defines.mod.styles.button.menu_sm_dark_bold_selected = "helfima_lib_button_menu_sm_dark_bold_selected"
defines.mod.styles.button.menu_red = "helfima_lib_button_menu_red"
defines.mod.styles.button.menu_sm_red = "helfima_lib_button_menu_sm_red"
defines.mod.styles.button.menu_dark_red = "helfima_lib_button_menu_dark_red"
defines.mod.styles.button.menu_sm_dark_red = "helfima_lib_button_menu_sm_dark_red"
defines.mod.styles.button.menu_actived_red = "helfima_lib_button_menu_actived_red"
defines.mod.styles.button.menu_sm_actived_red = "helfima_lib_button_menu_sm_actived_red"
defines.mod.styles.button.menu_selected_red = "helfima_lib_button_menu_selected_red"
defines.mod.styles.button.menu_sm_selected_red = "helfima_lib_button_menu_sm_selected_red"
defines.mod.styles.button.menu_green = "helfima_lib_button_menu_green"
defines.mod.styles.button.menu_sm_green = "helfima_lib_button_menu_sm_green"
defines.mod.styles.button.menu_dark_green = "helfima_lib_button_menu_dark_green"
defines.mod.styles.button.menu_sm_dark_green = "helfima_lib_button_menu_sm_dark_green"
defines.mod.styles.button.menu_actived_green = "helfima_lib_button_menu_actived_green"
defines.mod.styles.button.menu_sm_actived_green = "helfima_lib_button_menu_sm_actived_green"
defines.mod.styles.button.menu_selected_green = "helfima_lib_button_menu_selected_green"
defines.mod.styles.button.menu_sm_selected_green = "helfima_lib_button_menu_sm_selected_green"
defines.mod.styles.button.menu_selected_yellow = "helfima_lib_button_menu_selected_yellow"
defines.mod.styles.button.menu_sm_selected_yellow = "helfima_lib_button_menu_sm_selected_yellow"
defines.mod.styles.button.menu_flat2 = "helfima_lib_button_menu_flat2"
defines.mod.styles.button.menu_flat = "helfima_lib_button_menu_flat"
defines.mod.styles.button.menu_sm_flat = "helfima_lib_button_menu_sm_flat"

defines.mod.styles.button.default = "helfima_lib_button_default"
defines.mod.styles.button.selected = "helfima_lib_button_selected"
defines.mod.styles.button.icon_default = "helmod_button_icon_default"

defines.mod.styles.button.icon = "helmod_button_icon"
defines.mod.styles.button.icon_xxl = "helmod_button_icon_xxl"
defines.mod.styles.button.icon_m = "helmod_button_icon_m"
defines.mod.styles.button.icon_sm = "helmod_button_icon_sm"

defines.mod.styles.button.slot = "helmod_button_slot"
defines.mod.styles.button.slot_m = "helmod_button_slot_m"
defines.mod.styles.button.slot_sm = "helmod_button_slot_sm"

defines.mod.styles.button.select_icon = "helmod_button_select_icon"
defines.mod.styles.button.select_icon_green = "helmod_button_select_icon_green"
defines.mod.styles.button.select_icon_yellow = "helmod_button_select_icon_yellow"
defines.mod.styles.button.select_icon_red = "helmod_button_select_icon_red"
defines.mod.styles.button.select_icon_flat = "helmod_button_select_icon_flat"

defines.mod.styles.button.select_icon_xxl = "helmod_button_select_icon_xxl"
defines.mod.styles.button.select_icon_xxl_green = "helmod_button_select_icon_xxl_green"
defines.mod.styles.button.select_icon_xxl_yellow = "helmod_button_select_icon_xxl_yellow"
defines.mod.styles.button.select_icon_xxl_red = "helmod_button_select_icon_xxl_red"
defines.mod.styles.button.select_icon_xxl_flat = "helmod_button_select_icon_xxl_flat"

defines.mod.styles.button.select_icon_m = "helmod_button_select_icon_m"
defines.mod.styles.button.select_icon_m_green = "helmod_button_select_icon_m_green"
defines.mod.styles.button.select_icon_m_yellow = "helmod_button_select_icon_m_yellow"
defines.mod.styles.button.select_icon_m_red = "helmod_button_select_icon_m_red"
defines.mod.styles.button.select_icon_m_flat = "helmod_button_select_icon_m_flat"

defines.mod.styles.button.select_icon_sm = "helmod_button_select_icon_sm"
defines.mod.styles.button.select_icon_sm_green = "helmod_button_select_icon_sm_green"
defines.mod.styles.button.select_icon_sm_yellow = "helmod_button_select_icon_sm_yellow"
defines.mod.styles.button.select_icon_sm_red = "helmod_button_select_icon_sm_red"
defines.mod.styles.button.select_icon_sm_flat = "helmod_button_select_icon_sm_flat"

defines.mod.views = {}
defines.mod.views.locate = {}
defines.mod.views.locate.top="top"
defines.mod.views.locate.left="left"
defines.mod.views.locate.center="center"
defines.mod.views.locate.goal="goal"
defines.mod.views.locate.screen="screen"

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
