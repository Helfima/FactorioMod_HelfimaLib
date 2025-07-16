-------------------------------------------------------------------------------
---Class to build panel
---@class Selector : Form
Selector = newclass(Form, function(base, classname)
    Form.init(base, classname)
    base.inner_frame = defines.mod.styles.frame.inside_deep
    base.auto_clear = false
    base.mod_menu = false
    base.content_padding = 0
end)

-------------------------------------------------------------------------------
---On initialization
function Selector:on_init()
    self.panel_caption = { "helfima-lib.selector" }
end

-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function Selector:on_style(styles, width_main, height_main)
    styles.flow_panel = {
        minimal_width = 400,
        height = 800
    }
end

local data = {element_type = "item", categories={},elements={}}

-------------------------------------------------------------------------------
---On before open
---@param event EventModData
function Selector:on_open_before(event)
    data.sender = event.sender
    data.element_type = event.element_type
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function Selector:on_update(event)
    self:update_filter(event)
    self:on_update_data(event)
end

-------------------------------------------------------------------------------
---Update filter
---@param event EventModData
function Selector:update_filter(event)
    local content_panel = self:get_frame_panel("filter", defines.mod.styles.frame.inside_deep, defines.mod.direction.horizontal)
    content_panel.style.padding = {4,10,4,10}
    GuiElement.add(content_panel, GuiLabel("filter-label"):caption("Filter:"))
    local textfield = GuiElement.add(content_panel, GuiTextField(self.classname, "change-filter", "onchange"))
    textfield.style.width = 200
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function Selector:on_update_data(event)
    data = self:get_data(data)
    self:update_categories(data)
    self:update_elements(data)
end

-------------------------------------------------------------------------------
---Update categories
---@param data any
function Selector:update_categories(data)
    if data.categories == nil then return end
    local content_panel = self:get_frame_panel("categories", defines.mod.styles.frame.inside_deep)
    content_panel.style.padding = {4,10,4,10}
    content_panel.clear();
    local table = GuiElement.add(content_panel, GuiTable("table"):column(6))
    if data.categories ~= nil then
        for _, element in pairs(data.categories) do
            local color = nil
            if element.name == data.category_selected then
                color = "yellow"
            end
            GuiElement.add(table, GuiButtonSelectSpriteXxl(self.classname, "change-category"):sprite(element.type, element.name):tooltip(element.localised_name):color(color))
        end
    end
end

-------------------------------------------------------------------------------
---Update elements
---@param data any
function Selector:update_elements(data)
    local content_panel = self:get_frame_panel("elements")
    content_panel.style.vertically_stretchable = true
    content_panel.clear();
    local content_scroll = GuiElement.add(content_panel, GuiScroll("scroll"))
    local table = GuiElement.add(content_scroll, GuiTable("table"):column(10))
    if data.elements ~= nil then
        for _, element in pairs(data.elements) do
            local element_type = data.element_type
            if element_type == "surface" then
                local button = GuiElement.add(table, GuiButton(self.classname, "selected-element", "bypass", element_type, element.name):caption(element.name))
            elseif element_type == "quality" then
                local style = defines.mod.styles.button.select_icon
                local button = GuiElement.add(table, GuiButton(self.classname, "selected-element", "bypass", element_type, element.name):sprite("quality", element.name):style(style):tooltip(element.localised_name))
            else
                local button = GuiElement.add(table, GuiButtonSelectSprite(self.classname, "selected-element", "bypass"):choose(element_type, element.name))
                button.locked = true
                button.style.margin = 1
            end
        end
    end
    --GuiElement.add(content_panel, GuiButtonSelectSprite(self.classname, "test-element", "bypass"):choose("signal", nil))
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function Selector:on_event(event)
    if event.action == "change-filter" then
        local filter = event.element.text
        data.filter = filter
        self:on_update_data(event)
    end

    if event.action == "change-category" then
        local category_selected = event.item1
        data.category_selected = category_selected
        self:on_update_data(event)
    end

    if event.action == "selected-element" then
        local element_value = nil
        local selected_element = nil
        if event.element.type == "button" then
            element_value = event.element.caption
        elseif event.element.type == "sprite-button" then
            local tags = event.element.tags
            element_value = tags.name
        else
            element_value = event.element.elem_value 
        end
        if element_value ~= nil then
            selected_element = {type=data.element_type, name=element_value}
        end
        local event_data = {
            action = "selector-return",
            sender = self.classname,
            selected_element=selected_element
        }
        Dispatcher:send(defines.mod.events.on_gui_event, event_data, data.sender)
        self:close(event)
    end
    if event.action == "test-element" then
        local element_value = event.element.elem_value
    end
end

-------------------------------------------------------------------------------
---Update data
---@param data any
---@return any
function Selector:get_data(data)
    local group_item_elements = {"item", "entity", "recipe", "signal"}
    if table.contains(group_item_elements, data.element_type) then
        data.categories = {}
        local elements = {}
        local categories = {}
        local attribute = string.gsub(data.element_type, "-", "_")
        if data.element_type == "signal" then
           attribute = "virtual_signal" 
        end
        for _, element in pairs(prototypes[attribute]) do
            if data.filter == nil or string.find(element.name, data.filter, 0, true) then
                local category = element.group.name
                if elements[category] == nil then
                    elements[category] = {}
                    categories[category] = true
                end
                table.insert(elements[category], element)
            end
        end

        for _, element in pairs(prototypes.item_group) do
            local category = element.name
            if categories[category] == true then
                table.insert(data.categories, element)
            end
        end
        if data.category_selected == nil or categories[data.category_selected] == nil then
            data.category_selected = data.categories[1].name
        end
        data.elements = elements[data.category_selected]
    else
        local elements = {}
        local attribute = string.gsub(data.element_type, "-", "_")
        for _, element in pairs(prototypes[attribute]) do
            if data.filter == nil or string.find(element.name, data.filter, 0, true) then
                table.insert(elements, element)
            end
        end
        data.categories = nil
        data.category_selected = nil
        data.elements = elements
    end
    return data
end

