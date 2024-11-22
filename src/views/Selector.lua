-------------------------------------------------------------------------------
---Class to build panel
---@class Selector : Form
Selector = newclass(Form, function(base, classname)
    Form.init(base, classname)
    base.inner_frame = defines.mod.styles.frame.inside_deep
    base.auto_clear = true
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
    local table = GuiElement.add(content_panel, GuiTable("table"):column(6))
    for _, element in pairs(data.categories) do
        local color = nil
        if element.name == data.category_selected then
            color = "yellow"
        end
        GuiElement.add(table, GuiButtonSelectSpriteXxl(self.classname, "change-category"):sprite(element.type, element.name):tooltip(element.localised_name):color(color))
    end
end

-------------------------------------------------------------------------------
---Update elements
---@param data any
function Selector:update_elements(data)
    local content_panel = self:get_frame_panel("elements")
    content_panel.style.vertically_stretchable = true
    local content_scroll = GuiElement.add(content_panel, GuiScroll("scroll"))
    local table = GuiElement.add(content_scroll, GuiTable("table"):column(10))
    for _, element in pairs(data.elements) do
        local button = GuiElement.add(table, GuiButtonSelectSprite(self.classname, "selected-element", "bypass"):choose(data.element_type, element.name))
        button.locked = true
        button.style.margin = 1
    end
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function Selector:on_event(event)
    if event.action == "change-category" then
        local category_selected = event.item1
        data.category_selected = category_selected
        Dispatcher:send(defines.mod.events.on_gui_update, nil, self.classname)
    end

    if event.action == "selected-element" then
        local element_value = event.element.elem_value
        local selected_element = nil
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
end

-------------------------------------------------------------------------------
---Update data
---@param data any
---@return any
function Selector:get_data(data)
    local group_item_elements = {"item", "entity", "recipe"}
    if table.contains(group_item_elements, data.element_type) then
        data.categories = {}
        local elements = {}
        local categories = {}
        for _, element in pairs(prototypes[data.element_type]) do
            local category = element.group.name
            if elements[category] == nil then
                elements[category] = {}
                categories[category] = true
            end
            table.insert(elements[category], element)
        end

        for _, element in pairs(prototypes.item_group) do
            local category = element.name
            if categories[category] == true then
                table.insert(data.categories, element)
            end
        end
        if data.category_selected == nil then
            data.category_selected = data.categories[1].name
        end
        data.elements = elements[data.category_selected]
    else
        local elements = {}
        local attribute = string.gsub(data.element_type, "-", "_")
        for _, element in pairs(prototypes[attribute]) do
            table.insert(elements, element)
        end
        data.category_selected = nil
        data.elements = elements
    end
    return data
end

