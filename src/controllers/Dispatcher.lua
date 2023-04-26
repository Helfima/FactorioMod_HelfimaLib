-------------------------------------------------------------------------------
---Event Dispatcher
---
---@class Dispatcher : Object
---@field handlers {[string]:{[string]:{class:Object, handlers:{[uint]:function}}}}
local module = newclass(Object, function(base, classname)
    Object.init(base, classname)
    base.handlers = {}
end)

-------------------------------------------------------------------------------
---Bind
---@param event_type string
---@param class Object
---@param class_handler function
function module:bind(event_type, class, class_handler)
    if self.handlers[event_type] == nil then self.handlers[event_type] = {} end
    if self.handlers[event_type][class.classname] == nil then
        self.handlers[event_type][class.classname] = { class = class, handlers = {} }
    end
    table.insert(self.handlers[event_type][class.classname].handlers, class_handler)
end

-------------------------------------------------------------------------------
---Unbind
---@param event_type string
---@param class Object
---@param class_handler function
function module:unbind(event_type, class, class_handler)
    if class == nil and class_handler == nil then
        self.handlers[event_type] = nil
    elseif class_handler == nil and self.handlers[event_type] then
        self.handlers[event_type][class.classname] = nil
    elseif self.handlers[event_type] and self.handlers[event_type][class.classname] then
        local remove_index = nil
        for index, handler in pairs(self.handlers[event_type][class.classname].handlers) do
            if class_handler == handler then remove_index = index end
        end
        if remove_index ~= nil then
            table.remove(self.handlers[event_type][class.classname].handlers, remove_index)
        end
    end
end

-------------------------------------------------------------------------------
---Send
---@param event_type string
---@param data table
---@param classname? string
function module:send(event_type, data, classname)
    local data = data or {}
    local ok, err = pcall(function()
        data.type = event_type
        if self.handlers[event_type] then
            for name, group in pairs(self.handlers[event_type]) do
                local valid = true
                if classname ~= nil and classname ~= name then
                    valid = false
                end
                if valid then
                    for _, handler in pairs(group.handlers) do
                        handler(group.class, data)
                    end
                end
            end
        end
    end)
    if not (ok) then
        Player.print(err)
        log(err)
    end
end

---@param event EventModData
function module:on_gui_action(event)
    event.classname, event.action, event.item1, event.item2, event.item3, event.item4 = string.match(event.element.name,
        defines.mod.events.pattern)
    if Form.views[event.classname] then
        if event.action == "CLOSE" then
            self:send(defines.mod.events.on_gui_close, event, event.classname)
        else
            local view = Form.views[event.classname]
            if view ~= nil and view.mod_menu == true and event.action == "OPEN" then
                if view:is_opened() then
                    self:send(defines.mod.events.on_gui_close, event, event.classname)
                else
                    self:send(defines.mod.events.on_gui_open, event, event.classname)
                    self:send(defines.mod.events.on_gui_event, event, event.classname)
                end
            elseif event.action == "OPEN" and event.continue ~= true then
                self:send(defines.mod.events.on_gui_open, event, event.classname)
                self:send(defines.mod.events.on_gui_event, event, event.classname)
            else
                self:send(defines.mod.events.on_gui_event, event, event.classname)
            end
        end
    end
    if FormRelative.views[event.classname] then
        self:send(defines.mod.events.on_gui_event, event, event.classname)
    end
end

---@param event EventModData
function module:on_gui_reset(event)
    if defines.mod.mod_name == nil then return end
    for _, locate in pairs(defines.mod.views.locate) do
        local lua_gui_element = Player.get_gui(locate)
        for _, children_name in pairs(lua_gui_element.children_names) do
            local lua_element = lua_gui_element[children_name]
            if lua_element:get_mod() == defines.mod.mod_name then
                lua_element.destroy()
            end
        end
    end
end

---@param event EventData.on_console_command
function module:on_command(event)
    if event.parameters == defines.mod.command.action.menu then
        Dispatcher:send(defines.mod.events.on_gui_mod_menu, event)
    end
    if event.parameters == defines.mod.command.action.reset_ui then
        Dispatcher:send(defines.mod.events.on_gui_reset, event, Dispatcher.classname)
    end
end

function module.on_init()
end

function module.on_load()
end

---comment
---@param data ConfigurationChangedData
function module.on_configuration_changed(data)
    if not data or not data.mod_changes then
        return
    end
    if data.mod_changes[defines.mod.mod_name] then
        --initialise au chargement d'une partie existante
        for _, player in pairs(game.players) do
            Player.set(player)
            Dispatcher:send(defines.mod.events.on_gui_mod_menu, data)
        end
    end
end

---@type Dispatcher
Dispatcher = module("HLDispatcher")
Dispatcher:bind(defines.mod.events.on_gui_action, Dispatcher, Dispatcher.on_gui_action)
Dispatcher:bind(defines.mod.events.on_gui_reset, Dispatcher, Dispatcher.on_gui_reset)
Dispatcher:bind(defines.mod.events.on_console_command, Dispatcher, Dispatcher.on_command)

-------------------------------------------------------------------------------
---On click button
---@param event EventData.on_gui_click
---Filter allowed element in defines.mod.events.clickable_type
---<br>Bypass: add bypass in element.name
function Dispatcher.on_gui_click_button(event)
    if event ~= nil and event.player_index ~= nil then
        Player.load(event)
        if event.element ~= nil and event.element:get_mod() == defines.mod.mod_name and
            (defines.mod.events.clickable_type[event.element.type] == true or string.find(event.element.name, "bypass")) then
            Dispatcher:send(defines.mod.events.on_gui_action, event, Dispatcher.classname)
        end
    end
end

-------------------------------------------------------------------------------
---On text changed
---@param event EventData.on_gui_text_changed
function Dispatcher.on_gui_text_changed(event)
    if event ~= nil and event.player_index ~= nil and event.element ~= nil then
        Player.load(event)
        if string.find(event.element.name, "onchange") then
            Dispatcher:send(defines.mod.events.on_gui_action, event, Dispatcher.classname)
        end
        if string.find(event.element.name, "onqueue") then
            Dispatcher:send(defines.mod.events.on_gui_queue, event, Dispatcher.classname)
        end
    end
end

-------------------------------------------------------------------------------
---On click event
---@param event EventData.on_gui_click
function Dispatcher.on_gui_click(event)
    if event ~= nil and event.player_index ~= nil then
        Player.load(event)
        Dispatcher:send(defines.mod.events.on_gui_action, event, Dispatcher.classname)
    end
end

---@param event EventData.on_player_created
function Dispatcher.on_player_created(event)
    if event ~= nil and event.player_index ~= nil then
        Player.load(event)
        Dispatcher:send(defines.mod.events.on_gui_mod_menu, event)
    end
end

---@param event EventData.on_player_joined_game
function Dispatcher.on_player_joined_game(event)
    if event ~= nil and event.player_index ~= nil then
        Player.load(event)
        Dispatcher:send(defines.mod.events.on_gui_mod_menu, event)
    end
end

---@param event EventData.on_console_command
function Dispatcher.on_console_command(event)
    if event ~= nil and event.player_index ~= nil then
        if event.command == defines.mod.tag then
            Player.load(event)
            Dispatcher:send(defines.mod.events.on_console_command, event, Dispatcher.classname)
        end
    end
end

function Dispatcher.on_gui_opened(event)
    if event ~= nil and event.player_index ~= nil then
        Player.load(event)
        local ok, err = pcall(function()
            for _, relative_form in pairs(FormRelative.views) do
                if relative_form:check_valid(event) then
                    -- prevent close
                    Dispatcher:send(defines.mod.events.on_gui_close, event, relative_form.classname)
                    Dispatcher:send(defines.mod.events.on_gui_open, event, relative_form.classname)
                    Dispatcher:send(defines.mod.events.on_gui_event, event, relative_form.classname)
                end
            end
        end)
        if not (ok) then
            Player.print(err)
            log(err)
        end
    end
end

function Dispatcher.on_gui_closed(event)
    if event ~= nil and event.player_index ~= nil then
        Player.load(event)
        local ok, err = pcall(function()
            for _, relative_form in pairs(FormRelative.views) do
                if relative_form:check_valid(event) then
                    Dispatcher:send(defines.mod.events.on_gui_close, event, relative_form.classname)
                end
            end
        end)
        if not (ok) then
            Player.print(err)
            log(err)
        end
    end
end

Dispatcher.events =
{
    [defines.events.on_gui_click] = Dispatcher.on_gui_click_button,
    [defines.events.on_gui_text_changed] = Dispatcher.on_gui_text_changed,

    [defines.events.on_gui_confirmed] = Dispatcher.on_gui_click,
    [defines.events.on_gui_value_changed] = Dispatcher.on_gui_click,
    [defines.events.on_gui_selection_state_changed] = Dispatcher.on_gui_click,
    [defines.events.on_gui_switch_state_changed] = Dispatcher.on_gui_click,
    [defines.events.on_gui_elem_changed] = Dispatcher.on_gui_click,
    [defines.events.on_gui_checked_state_changed] = Dispatcher.on_gui_click,
    [defines.events.on_gui_selected_tab_changed] = Dispatcher.on_gui_click,

    [defines.events.on_player_created] = Dispatcher.on_player_created,
    [defines.events.on_player_joined_game] = Dispatcher.on_player_joined_game,
    [defines.events.on_console_command] = Dispatcher.on_console_command,

    [defines.events.on_gui_opened] = Dispatcher.on_gui_opened,
    [defines.events.on_gui_closed] = Dispatcher.on_gui_closed,

    -- [defines.events.on_runtime_mod_setting_changed] = Dispatcher.on_runtime_mod_setting_changed,
    -- [defines.events.on_string_translated] = Dispatcher.on_string_translated,
    -- [defines.events.on_lua_shortcut] = Dispatcher.on_lua_shortcut,
}
