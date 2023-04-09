-------------------------------------------------------------------------------
---Class to help to build form
---@class FormRelative : Object
---@field inner_frame string
---@field locate string
---@field panel_caption string
---@field auto_clear boolean
---@field panel_close boolean
---@field add_special_button boolean
---@field mod_menu boolean
---@field anchor GuiAnchor
---@field views {[string] : FormRelative}
FormRelative = newclass(Object, function(base, classname)
    Object.init(base, classname)
    base:bind()
    base:style()
    base.inner_frame = defines.mod.styles.frame.inner
    base.locate = defines.mod.views.locate.relative
    base.content_verticaly = true
    base.mod_menu = false
    base.vertically_stretchable = false
end)

FormRelative.views = {}

-------------------------------------------------------------------------------
---Check Valid
---@param event EventModData
function FormRelative:check_valid(event)
    return false
end
-------------------------------------------------------------------------------
---Bind Dispatcher
---<br>Don't use this function! use Form:on_bind()
function FormRelative:bind()
    Dispatcher:bind(defines.mod.events.on_gui_event, self, self.event)

    Dispatcher:bind(defines.mod.events.on_gui_open, self, self.open)
    Dispatcher:bind(defines.mod.events.on_gui_open, self, self.update)

    Dispatcher:bind(defines.mod.events.on_gui_update, self, self.update)
    Dispatcher:bind(defines.mod.events.on_gui_close, self, self.close)

    --Dispatcher:bind(defines.mod.events.on_gui_mod_menu, self, self.update_mod_menu)
    self:on_bind()
end

-------------------------------------------------------------------------------
---For Bind Dispatcher Event
function FormRelative:on_bind()
end

-------------------------------------------------------------------------------
---Get panel name
---@return string
function FormRelative:get_panel_name()
    return self.classname
end

-------------------------------------------------------------------------------
---Get the parent panel
---@return LuaGuiElement
function FormRelative:get_parent_panel()
    return Player.get_gui(self.locate)
end

-------------------------------------------------------------------------------
---Is opened panel
---@return boolean
function FormRelative:is_opened()
    local parent_panel = self:get_parent_panel()
    if parent_panel[self:get_panel_name()] ~= nil then
        return true
    end
    return false
end

--------------------------------------------------------------------------------
---Get the parent panel
---@return LuaGuiElement, LuaGuiElement, LuaGuiElement
function FormRelative:get_panel()
    local panel_name = self:get_panel_name()
    local inner_name = "inner"
    local header_name = "header_panel"
    local menu_name = "menu_panel"
    local parent_panel = self:get_parent_panel()
    if parent_panel[panel_name] ~= nil and parent_panel[panel_name].valid then
        return parent_panel[panel_name], parent_panel[panel_name][inner_name],
            parent_panel[panel_name][header_name][menu_name]
    end

    if self.anchor == nil then
        error("anchor not specified for relative frame : " .. self.classname)
    end
    ---main panel
    ---@type GuiFrame
    local main_frame = GuiFrameV(panel_name):anchor(self.anchor.gui, self.anchor.position):style(defines.mod.styles.frame.inner_outer)
    
    local flow_panel = GuiElement.add(parent_panel, main_frame)
    flow_panel.style.horizontally_stretchable = true
    flow_panel.style.vertically_stretchable = self.vertically_stretchable

    --self:set_style_flow(flow_panel)

    local header_panel = GuiElement.add(flow_panel, GuiFlowH(header_name))
    header_panel.style.horizontally_stretchable = true

    if self.panel_caption ~= nil then
        ---header panel
        local title_panel = GuiElement.add(header_panel,
            GuiFrameH("title_panel"):caption(self.panel_caption):style(defines.mod.styles.frame.invisible))
        title_panel.style.horizontally_stretchable = true
        title_panel.style.height = 28
    end

    local menu_panel = GuiElement.add(header_panel, GuiFlowH(menu_name))
    menu_panel.style.horizontal_spacing = 10
    menu_panel.style.horizontal_align = "right"

    local content_panel
    content_panel = GuiElement.add(flow_panel, GuiFrameV(inner_name):style(self.inner_frame))
    content_panel.style.vertically_stretchable = self.vertically_stretchable
    content_panel.style.horizontally_stretchable = true
    return flow_panel, content_panel, menu_panel
end

-------------------------------------------------------------------------------
---Style
---<br>Don't use this function! use Form:on_style()
function FormRelative:style()
    local width_main, height_main = User.get_main_sizes()
    self.styles = {}
    self:on_style(self.styles, width_main, height_main)
end

-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function FormRelative:on_style(styles, width_main, height_main)

end

-------------------------------------------------------------------------------
---Build first container
---<br>Don't use this function! use Form:on_open(event) or Form:on_open_before(event)
---@param event EventModData
function FormRelative:open(event)
    self:style()
    if not(self:is_opened()) then
        self:get_panel()
        self:on_open(event)
    end
end

-------------------------------------------------------------------------------
---On before open
---@param event EventModData
function FormRelative:on_open(event)
end

-------------------------------------------------------------------------------
---Update
---<br>Don't use this function! use Form:on_update(event)
---@param event EventModData
function FormRelative:update(event)
    if not (self:is_opened()) then return end
    local flow_panel, content_panel, menu_panel = self:get_panel()
    if self.auto_clear then content_panel.clear() end
    self:on_update(event)
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function FormRelative:on_update(event)
end

-------------------------------------------------------------------------------
---Event
---<br>Don't use this function! use Form:on_event(event)
---@param event EventModData
function FormRelative:event(event)
    if not (self:is_opened()) then return end
    self:on_event(event)
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function FormRelative:on_event(event)
end

-------------------------------------------------------------------------------
---Close
---<br>Don't use this function! use Form:on_close(event)
---@param event EventModData
function FormRelative:close(event)
    if not (self:is_opened()) then return end
    local flow_panel, content_panel, menu_panel = self:get_panel()
    flow_panel.destroy()
    self:on_close(event)
end

-------------------------------------------------------------------------------
---Close
---@param event EventModData
function FormRelative:on_close(event)
end
