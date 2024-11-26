-------------------------------------------------------------------------------
---Class to help to build GuiButton
---@class GuiTree : GuiCell
GuiTree = newclass(GuiCell, function(base, ...)
    GuiCell.init(base, ...)
    base.font_link = {}
end)

local is_expanded = false

function GuiTree:bind()
    is_expanded = false
    local options = self:getOptions()
    self.classname = options.name
    Dispatcher.views[options.name] = self
    Dispatcher:unbind(defines.mod.events.on_gui_event, self)
    Dispatcher:bind(defines.mod.events.on_gui_event, self, self.event)
end

-------------------------------------------------------------------------------
---On event
---@param event EventModData
function GuiTree:event(event)
    if event.action == "create-tree" then
        local element = event.element
        local content = element.parent
        if is_expanded then
            for _, child in pairs(content.children) do
                if child.name == "" then
                    child.destroy()
                end
            end
            is_expanded = false
        else
            self:create_tree(content, self.data_source, false)
            is_expanded = true
        end
    end
    
    if event.action == "expand-branch" then
        local element = event.element
        local content = element.parent.parent
        local parent_next = content.next
        if #parent_next.children > 0 then
            for _, child in pairs(parent_next.children) do
                child.destroy()
            end
            parent_next.visible = false
        else
            local list = element.tags.value
            parent_next.visible = true
            self:create_tree(parent_next, list)
        end
    end

    if event.action == "expand-continue" then
        local element = event.element
        local content = element.parent.parent
        local parent_next = content.parent.parent
        local list = element.tags.list
        content.parent.destroy()
        self:create_tree(parent_next, list)
    end
end

-------------------------------------------------------------------------------
---Set color
---@param font_color table
---@param hovered_font_color? table
---@return GuiTree
function GuiTree:font_color(font_color, hovered_font_color)
    self.font_link.font_color = font_color
    self.font_link.hovered_font_color = hovered_font_color
    return self
end

-------------------------------------------------------------------------------
---Set color
---@param source table
---@return GuiTree
function GuiTree:source(source)
    self.data_source = source
    return self
end

-------------------------------------------------------------------------------
---Create cell
---@param parent LuaGuiElement --container for element
---@return GuiTree
function GuiTree:create(parent)
    self:bind()
    local root_branch = GuiElement.add(parent, GuiFlowV())
    root_branch.style.vertically_stretchable = false
    GuiElement.add(root_branch, GuiLink(self.classname, "create-tree"):caption(self.m_caption):font_color(self.font_link.font_color, self.font_link.hovered_font_color))
    return self
end

local color_name = "blue"
local color_index = 1
local bar_thickness = 2

-------------------------------------------------------------------------------
---Create Tree
---@param parent LuaGuiElement
---@param list table
---@param expand? boolean
function GuiTree:create_tree(parent, list, expand)
    local data_info = table.data_info(list)
    local index = 1
    local size = table.size(list)
    for k, info in pairs(data_info) do
        local tree_branch = GuiElement.add(parent, GuiFlowH())
        -- vertical bar
        local vbar = GuiElement.add(tree_branch, GuiFrameV("vbar"):style("helfima_lib_frame_colored", color_name, color_index))
        vbar.style.width = bar_thickness
        vbar.style.left_margin = 15
        if index == size then
            vbar.style.height = 12
        else
            vbar.style.vertically_stretchable = true
            vbar.style.bottom_margin = 0
        end
        -- content
        local content = GuiElement.add(tree_branch, GuiFlowV("content"))
        -- header
        local header = GuiElement.add(content, GuiFlowH("header"))
        local hbar = GuiElement.add(header, GuiFrameV("hbar"):style("helfima_lib_frame_colored", color_name, color_index))
        hbar.style.width = 5
        hbar.style.height = bar_thickness
        hbar.style.top_margin = 10
        hbar.style.right_margin = 5
        if info.type == "table" then
            if index >= 25 then
                local caption = { "", defines.mod.tags.font.default_bold, defines.mod.tags.color.green_light, "... (expand)", defines.mod.tags.color.close, defines.mod.tags.font.close }
                local label = GuiElement.add(header, GuiLabel(self.classname, "expand-continue", "bypass"):caption(caption))
                label.tags = {list=table.slice(list, 25)}
            else
                local caption = { "", defines.mod.tags.font.default_bold, defines.mod.tags.color.green_light, k, defines.mod.tags.color.close, defines.mod.tags.font.close, " [", table.size(info.value), "]", " (", info.type, ")" }
                if expand then
                    GuiElement.add(header, GuiLabel("global-end"):caption(caption))
                else
                    local label = GuiElement.add(header, GuiLabel(self.classname, "expand-branch", "bypass"):caption(caption))
                    label.tags = info
                end
            end
        else
            local caption = { "", defines.mod.tags.font.default_bold, defines.mod.tags.color.gold, k, defines.mod.tags.color.close, defines.mod.tags.font.close, "=", defines.mod.tags.font.default_bold, info.value, defines.mod.tags.font.close, " (", info.type, ")" }
            local label = GuiElement.add(header, GuiLabel("global-end"):caption(caption))
        end
        -- next
        local next = GuiElement.add(content, GuiFlowV("next"))

        if expand and info.type == "table" then
            self:create_tree(next, info.value, false)
        else
            next.visible = false
        end
        index = index + 1
        if index > 25 then
            break
        end
    end
end