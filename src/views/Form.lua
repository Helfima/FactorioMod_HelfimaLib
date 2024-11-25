-------------------------------------------------------------------------------
---Class to help to build form
---@class Form : Object
---@field inner_frame string
---@field locate string
---@field panel_caption string
---@field auto_clear boolean
---@field panel_close boolean
---@field add_special_button boolean
---@field content_verticaly boolean
---@field content_padding number
---@field mod_menu boolean
---@field submenu_enabled boolean
---@field views {[string] : Form}
Form = newclass(Object, function(base, classname)
    Object.init(base, classname)
    base:bind()
    base:style()
    base.inner_frame = defines.mod.styles.frame.inner
    base.locate = defines.mod.views.locate.screen
    base.content_verticaly = true
    base.content_padding = 8
    base.auto_clear = true
    base.panel_close = true
    base.add_special_button = true
    base.mod_menu = false
    base.submenu_enabled = false
end)

Form.views = {}

-------------------------------------------------------------------------------
---Bind Dispatcher
---<br>Don't use this function! use Form:on_bind()
function Form:bind()
    Dispatcher:bind(defines.mod.events.on_gui_event, self, self.event)

    Dispatcher:bind(defines.mod.events.on_gui_open, self, self.open)
    Dispatcher:bind(defines.mod.events.on_gui_open, self, self.update)

    Dispatcher:bind(defines.mod.events.on_gui_update, self, self.update)
    Dispatcher:bind(defines.mod.events.on_gui_close, self, self.close)

    Dispatcher:bind(defines.mod.events.on_gui_error, self, self.update_error)
    Dispatcher:bind(defines.mod.events.on_gui_message, self, self.update_message)

    Dispatcher:bind(defines.mod.events.on_gui_mod_menu, self, self.update_mod_menu)
    self:on_bind()
end

-------------------------------------------------------------------------------
---For Bind Dispatcher Event
function Form:on_bind()
end

-------------------------------------------------------------------------------
---Style
---<br>Don't use this function! use Form:on_style()
function Form:style()
    local width_main, height_main = User.get_main_sizes()
    self.styles = {
        flow_panel = {
            width = width_main,
            height = height_main,
            minimal_width = width_main,
            minimal_height = height_main,
            maximal_width = width_main,
            maximal_height = height_main,
        }
    }
    self:on_style(self.styles, width_main, height_main)
end

-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function Form:on_style(styles, width_main, height_main)

end

-------------------------------------------------------------------------------
---Set style
---@param element LuaGuiElement
---@param style string
---@param property string
function Form:set_style(element, style, property)
    if element.style ~= nil and self.styles ~= nil and self.styles[style] ~= nil and self.styles[style][property] ~= nil then
        element.style[property] = self.styles[style][property]
    end
end

-------------------------------------------------------------------------------
---Get Button Sprites
---@return string|nil,string|nil
function Form:get_button_sprites()
    return nil, nil
end

-------------------------------------------------------------------------------
---Return button caption
---@return string|table
function Form:get_button_caption()
    return self.panel_caption
end

-------------------------------------------------------------------------------
---Is visible
---@return boolean
function Form:is_visible()
    return false
end

-------------------------------------------------------------------------------
---Is special
---@return boolean
function Form:is_special()
    return false
end

-------------------------------------------------------------------------------
---Get panel name
---@return string
function Form:get_panel_name()
    return self.classname
end

-------------------------------------------------------------------------------
---Get the parent panel
---@return LuaGuiElement
function Form:get_parent_panel()
    return Player.get_gui(self.locate)
end

-------------------------------------------------------------------------------
---Set style
---@param flow_panel LuaGuiElement
function Form:set_style_flow(flow_panel)
    if self.styles == nil or self.styles["flow_panel"] == nil then return end
    local styles = self.styles["flow_panel"]
    for style_name, value in pairs(styles) do
        self:set_style(flow_panel, "flow_panel", style_name)
    end
end

--------------------------------------------------------------------------------
---Get the parent panel
---@return LuaGuiElement, LuaGuiElement, LuaGuiElement, LuaGuiElement
function Form:get_panel()
    local panel_name = self:get_panel_name()
    local inner_name = "inner"
    local content_name = "content"
    local header_name = "header_panel"
    local menu_name = "menu_panel"
    local submenu_name = "submenu_name"
    local parent_panel = self:get_parent_panel()
    if parent_panel[panel_name] ~= nil and parent_panel[panel_name].valid then
        return parent_panel[panel_name],
            parent_panel[panel_name][inner_name][content_name],
            parent_panel[panel_name][inner_name][submenu_name],
            parent_panel[panel_name][header_name][menu_name]
    end
    ---main panel
    ---@type GuiFrame
    local main_frame = GuiFrameV(panel_name):style(defines.mod.styles.frame.default)

    local flow_panel = GuiElement.add(parent_panel, main_frame)
    flow_panel.style.horizontally_stretchable = true
    flow_panel.style.vertically_stretchable = true
    if self.anchor == nil then
        flow_panel.location = User.get_form_location(panel_name)
    end
    self:set_style_flow(flow_panel)

    local header_panel = GuiElement.add(flow_panel, GuiFlowH(header_name))
    header_panel.style.horizontally_stretchable = true
    ---header panel
    local title_panel = GuiElement.add(header_panel,
        GuiFrameH("title_panel"):caption(self.panel_caption or self.classname):style(defines.mod.styles.frame.invisible))
    title_panel.style.horizontally_stretchable = true
    title_panel.style.height = 28

    title_panel.drag_target = flow_panel

    local menu_panel = GuiElement.add(header_panel, GuiFlowH(menu_name))
    menu_panel.style.horizontal_spacing = 10
    menu_panel.style.horizontal_align = "right"

    local inner_panel = GuiElement.add(flow_panel, GuiFrameV(inner_name):style(self.inner_frame))

    local submenu_panel = nil
    if self.submenu_enabled then
        submenu_panel = GuiElement.add(inner_panel, GuiFrameH(submenu_name):style(defines.mod.styles.frame.subheader_frame))
        submenu_panel.style.height = 36
        submenu_panel.style.horizontally_stretchable = true
    end

    local content_panel = nil
    if self.content_verticaly then
        content_panel = GuiElement.add(inner_panel, GuiFrameV(content_name):style(defines.mod.styles.frame.invisible))
    else
        content_panel = GuiElement.add(inner_panel, GuiFrameH(content_name):style(defines.mod.styles.frame.invisible))
    end
    content_panel.style.padding = self.content_padding
    content_panel.style.vertically_stretchable = true
    content_panel.style.horizontally_stretchable = true

    return flow_panel, content_panel, submenu_panel, menu_panel
end

-------------------------------------------------------------------------------
---Get or create frame panel
---@param panel_name string
---@param style? string
---@param direction? string --horizontal, vertical
---@return LuaGuiElement
function Form:get_frame_panel(panel_name, style, direction)
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    if content_panel[panel_name] ~= nil and content_panel[panel_name].valid then
        return content_panel[panel_name]
    end
    local frame_panel = nil
    if direction == "horizontal" then
        frame_panel = GuiElement.add(content_panel,
            GuiFrameH(panel_name):style(style or defines.mod.styles.frame.default))
    else
        frame_panel = GuiElement.add(content_panel,
            GuiFrameV(panel_name):style(style or defines.mod.styles.frame.default))
    end
    frame_panel.style.horizontally_stretchable = true
    return frame_panel
end

-------------------------------------------------------------------------------
---Get or create flow panel
---@param panel_name string
---@param direction? string
---@return LuaGuiElement
function Form:get_flow_panel(panel_name, direction)
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    if content_panel[panel_name] ~= nil and content_panel[panel_name].valid then
        return content_panel[panel_name]
    end
    local frame_panel = nil
    if direction == "horizontal" then
        frame_panel = GuiElement.add(content_panel, GuiFlowH(panel_name))
    else
        frame_panel = GuiElement.add(content_panel, GuiFlowV(panel_name))
    end
    frame_panel.style.horizontally_stretchable = true
    return frame_panel
end

-------------------------------------------------------------------------------
---Get or create scroll panel
---@param panel_name string
---@return LuaGuiElement
function Form:get_scroll_panel(panel_name)
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    if content_panel[panel_name] ~= nil and content_panel[panel_name].valid then
        return content_panel[panel_name]
    end
    local frame_panel = GuiElement.add(content_panel, GuiScroll(panel_name))
    frame_panel.style.horizontally_stretchable = true
    return frame_panel
end

-------------------------------------------------------------------------------
---Get or create frame panel
---@param panel_name string
---@param direction? string --horizontal, vertical
---@return LuaGuiElement
function Form:get_frame_deep_panel(panel_name, direction)
    return self:get_frame_panel(panel_name, defines.mod.styles.frame.inside_deep, direction)
end

-------------------------------------------------------------------------------
---Get or create tab panel
---@return LuaGuiElement
function Form:get_tab_pane()
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    content_panel.style.padding = 0
    
    local content_panel = self:get_flow_panel("panel", "vertical")
    local panel_name = "tab_panel"
    local name = table.concat({ self.classname, "change-tab", panel_name }, "=")
    if content_panel[name] ~= nil and content_panel[name].valid then
        return content_panel[name]
    end
    local panel = GuiElement.add(content_panel, GuiTabPane(self.classname, "change-tab", panel_name))
    panel.style.margin = 0
    panel.style.top_padding = 10
    panel.style.right_padding = 0
    panel.style.left_padding = 0
    panel.style.bottom_padding = 0
    return panel
end

-------------------------------------------------------------------------------
---Get or create tab panel
---@param panel_name string
---@param caption string|table
---@return LuaGuiElement
function Form:get_tab(panel_name, caption)
    local content_panel = self:get_tab_pane()
    local flow_name = "scroll-" .. panel_name
    if content_panel[panel_name] ~= nil and content_panel[panel_name].valid then
        return content_panel[flow_name]
    end
    local tab_panel = GuiElement.add(content_panel, GuiTab(panel_name):caption(caption))
    local flow_panel = GuiElement.add(content_panel, GuiFlowV(flow_name))
    content_panel.add_tab(tab_panel, flow_panel)
    flow_panel.style.horizontally_stretchable = true
    flow_panel.style.vertically_stretchable = true
    flow_panel.style.margin = 10
    return flow_panel
end

-------------------------------------------------------------------------------
---Get or create tab panel
---@param panel_name string
---@param caption string|table
---@return LuaGuiElement
function Form:get_tab_scroll(panel_name, caption)
    local content_panel = self:get_tab_pane()
    local scroll_name = "scroll-" .. panel_name
    if content_panel[panel_name] ~= nil and content_panel[panel_name].valid then
        return content_panel[scroll_name]
    end
    local tab_panel = GuiElement.add(content_panel, GuiTab(panel_name):caption(caption))
    local scroll_panel = GuiElement.add(content_panel, GuiScroll(scroll_name):style("scroll_pane"):policy(true))
    content_panel.add_tab(tab_panel, scroll_panel)
    scroll_panel.style.horizontally_stretchable = true
    scroll_panel.style.vertically_stretchable = true
    scroll_panel.style.margin = 10
    return scroll_panel
end

-------------------------------------------------------------------------------
---Is opened panel
---@return boolean
function Form:is_opened()
    local parent_panel = self:get_parent_panel()
    if parent_panel[self:get_panel_name()] ~= nil then
        return true
    end
    return false
end

-------------------------------------------------------------------------------
---Event
---<br>Don't use this function! use Form:on_event(event)
---@param event EventModData
function Form:event(event)
    if not (self:is_opened()) then return end
    self:on_event_form(event)
    self:on_event(event)
    self:on_event_extensions(event)
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function Form:on_event(event)
end

-------------------------------------------------------------------------------
---On event extensions, is use for extension view
---@param event EventModData
function Form:on_event_extensions(event)
end

-------------------------------------------------------------------------------
---On form event
---<br>Don't use this function! use Form:on_event(event)
---@param event EventModData
function Form:on_event_form(event)
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    if event.action == "CLOSE" then
        self:close(event)
    end
    if event.action == "minimize-window" then
        content_panel.visible = false
        flow_panel.style.height = 50
        flow_panel.style.minimal_width = 100
    end
    if event.action == "maximize-window" then
        content_panel.visible = true
        self:set_style_flow(flow_panel)
    end
end

-------------------------------------------------------------------------------
---Close
---<br>Don't use this function! use Form:on_close(event)
---@param event EventModData
function Form:close(event)
    if not (self:is_opened()) then return end
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    User.set_form_close(self.classname, flow_panel.location)
    flow_panel.destroy()
    self:on_close(event)
end

-------------------------------------------------------------------------------
---Close
---@param event EventModData
function Form:on_close(event)
end

-------------------------------------------------------------------------------
---Build first container
---<br>Don't use this function! use Form:on_open(event) or Form:on_open_before(event)
---@param event EventModData
function Form:open(event)
    self:style()
    self:on_open_before(event)
    if not(self:is_opened()) then
        local flow_panel = self:get_panel()
        flow_panel.bring_to_front()
        return true
    end
    local parent_panel = self:get_parent_panel()
    User.set_form_opened(self.classname)
    self:update_menu_header(event)
    local panel_name = self:get_panel_name()
    if parent_panel[panel_name] == nil then
        self:on_open(event)
    end
end

-------------------------------------------------------------------------------
---On before open
---@param event EventModData
function Form:on_open_before(event)
end

-------------------------------------------------------------------------------
---On before open
---@param event EventModData
function Form:on_open(event)
end

-------------------------------------------------------------------------------
---Update
---<br>Don't use this function! use Form:on_update(event)
---@param event EventModData
function Form:update(event)
    if not (self:is_opened()) then return end
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
    if self.auto_clear then
        content_panel.clear()
        if self.submenu_enabled then
            submenu_panel.clear()
        end
    end
    self:update_menu_header(event)
    self:on_update(event)
    self:on_update_extensions(event)
    self:update_location(event)
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function Form:on_update(event)
end

-------------------------------------------------------------------------------
---On Update extensions, is use for extension view
---@param event EventModData
function Form:on_update_extensions(event)
end

-------------------------------------------------------------------------------
---Update top menu
---@param event EventModData
function Form:update_menu_header(event)
    ---ajoute un menu
    if self.panel_caption ~= nil then
        local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()
        menu_panel.clear()
        if self.panel_close then
            ---special tab
            local special_group = GuiElement.add(menu_panel, GuiFlowH("special_group"))
            for _, form in pairs(Form.views) do
                if self.add_special_button == true and form:is_visible() and form:is_special() then
                    local icon_hovered, icon = form:get_button_sprites()
                    GuiElement.add(special_group,
                        GuiButton(form.classname, "OPEN"):sprite("menu", icon_hovered, icon):style(defines.mod.styles.frame
                            .action_button):tooltip(form.panel_caption))
                end
            end
            ---Standard group
            local standard_group = GuiElement.add(menu_panel, GuiFlowH("standard_group"))
            GuiElement.add(standard_group,
                GuiButton(self.classname, "minimize-window"):sprite("menu", defines.sprites.minimize.white,
                    defines.sprites.minimize.black):style(defines.mod.styles.frame.action_button):tooltip({ "helfima-lib.minimize" }))
            GuiElement.add(standard_group,
                GuiButton(self.classname, "maximize-window"):sprite("menu", defines.sprites.maximize.white,
                    defines.sprites.maximize.black):style(defines.mod.styles.frame.action_button):tooltip({ "helfima-lib.maximize" }))
            GuiElement.add(standard_group,
                GuiButton(self.classname, "CLOSE"):sprite("menu", defines.sprites.close.white,
                    defines.sprites.close.black):
                style(defines.mod.styles.frame.action_button):tooltip({ "helfima-lib.close" }))
        end
    else
        Logging:warn(self.classname, "self.panel_caption not found")
    end
end

-------------------------------------------------------------------------------
---Update location
---@param event EventModData
function Form:update_location(event)
    local width, height = Player.get_display_sizes()
    local width_main, height_main = User.get_main_sizes()
    local flow_panel, content_panel, submenu_panel, menu_panel = self:get_panel()

    local location = flow_panel.location
    if location.x < 0 or location.x > (width - 100) then
        location.x = 0
        flow_panel.location = location
    end
    if location.y < 0 or location.y > (height - 50) then
        location.y = 50
        flow_panel.location = location
    end
end

-------------------------------------------------------------------------------
---Add cell header
---@param guiTable LuaGuiElement
---@param name string
---@param caption string|table
function Form:add_cell_header(guiTable, name, caption)
    local cell = GuiElement.add(guiTable, GuiFlowH("header", name))
    GuiElement.add(cell, GuiLabel("label"):caption(caption))
end

-------------------------------------------------------------------------------
---Update message
---@param event EventModData
function Form:update_message(event)
    if not (self:is_opened()) then return end
    local panel = self:get_frame_deep_panel("message")
    panel.clear()
    GuiElement.add(panel, GuiLabel("message"):caption(event.message))
end

-------------------------------------------------------------------------------
---Update error
---@param event EventModData
function Form:update_error(event)
    if not (self:is_opened()) then return end
    local panel = self:get_frame_deep_panel("error")
    panel.clear()
    GuiElement.add(panel, GuiLabel("message"):caption(event.message or "Unknown error"):color("red"))
end

local ModGui = require "mod-gui"
---Build mod menu at top
function Form:update_mod_menu()
    if self.mod_menu ~= true then return end
    local sprite1, sprite2 = self:get_button_sprites()
    if sprite1 == nil then return end
    local gui_name = string.format("%s=OPEN", self.classname)
    local lua_player = Player.native()
    local lua_gui_element = ModGui.get_button_flow(lua_player)
    if lua_gui_element ~= nil and lua_gui_element[gui_name] ~= nil then
        lua_gui_element[gui_name].destroy()
    end
    if lua_gui_element ~= nil and lua_gui_element[gui_name] == nil then
        local gui_button = GuiElement.add(lua_gui_element,
            GuiButton(gui_name)
            :sprite("menu", sprite1, sprite2)
            :style(defines.mod.styles.mod_gui_button)
            :tooltip(self.panel_caption))
        gui_button.style.width = 37
        gui_button.style.height = 37
    end
end
