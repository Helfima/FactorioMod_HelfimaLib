-------------------------------------------------------------------------------
---Class to help to build GuiButton
---@class GuiButton : GuiElement
---@field classname string
---@field options {}
GuiButton = newclass(GuiElement, function(base, ...)
    GuiElement.init(base, ...)
    base.classname = "HLGuiButton"
    base.options.type = "button"
    base.options.style = defines.mod.styles.button.default
end)

-------------------------------------------------------------------------------
---Set Sprite
---@param type string
---@param name string
---@param hovered string
---@return GuiButton
function GuiButton:sprite(type, name, hovered)
    self.options.type = "sprite-button"
    self.is_caption = false
    if type == "menu" then
        self.options.sprite = GuiElement.getSprite(name)
        if hovered then
            self.options.hovered_sprite = GuiElement.getSprite(hovered)
        end
    else
        self.options.sprite = GuiElement.getSprite(type, name)
        if hovered then
            self.options.hovered_sprite = GuiElement.getSprite(type, hovered)
        end
        table.insert(self.name, name)
    end
    return self
end

-------------------------------------------------------------------------------
---Set option
---@param name string
---@param value any
---@return GuiButton
function GuiButton:option(name, value)
    self.options[name] = value
    return self
end

-------------------------------------------------------------------------------
---Set index
---@param index number
---@return GuiButton
function GuiButton:index(index)
    self.m_index = index
    table.insert(self.name, index)
    return self
end

-------------------------------------------------------------------------------
---Set index
---@param value number
---@return GuiButton
function GuiButton:number(value)
    self.options.number = value
    return self
end

-------------------------------------------------------------------------------
---Set Choose button (choose-elem-button)
---@param type string #item, tile, entity, signal, fluid, recipe, decorative, item-group, achievement, equipment, technology
---@param name string
---@return GuiButton
function GuiButton:choose(type, name)
    self.options.type = "choose-elem-button"
    if type == nil then return self end
    self.options.elem_type = type
    self.options[type] = name
    return self
end

-------------------------------------------------------------------------------
---Get options
---@return table
function GuiButton:onErrorOptions()
    local options = self:getOptions()
    options.style = defines.mod.styles.button.default
    options.type = "button"
    if (type(options.caption) == "boolean") then
        Logging:error(self.classname, "addGuiButton - caption is a boolean")
    elseif self.m_caption ~= nil then
        options.caption = self.m_caption
    else
        options.caption = options.key
    end
    return options
end

-------------------------------------------------------------------------------
---@class GuiButtonSprite : GuiButton
GuiButtonSprite = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.icon
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSprite : GuiButton
GuiButtonSelectSprite = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.select_icon
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSprite
function GuiButtonSelectSprite:color(color)
    local style = defines.mod.styles.button.select_icon
    if color == "red" then style = defines.mod.styles.button.select_icon_red end
    if color == "yellow" then style = defines.mod.styles.button.select_icon_yellow end
    if color == "green" then style = defines.mod.styles.button.select_icon_green end
    if color == "flat" then style = defines.mod.styles.button.select_icon_flat end
    self.options.style = style
    return self
end

-------------------------------------------------------------------------------
---@class GuiButtonSpriteM : GuiButton
GuiButtonSpriteM = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.icon_m
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSpriteM : GuiButton
GuiButtonSelectSpriteM = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.select_icon_m
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSpriteM
function GuiButtonSelectSpriteM:color(color)
    local style = defines.mod.styles.button.select_icon_m
    if color == "red" then style = defines.mod.styles.button.select_icon_m_red end
    if color == "yellow" then style = defines.mod.styles.button.select_icon_m_yellow end
    if color == "green" then style = defines.mod.styles.button.select_icon_m_green end
    if color == "flat" then style = defines.mod.styles.button.select_icon_m_flat end
    self.options.style = style
    return self
end

-------------------------------------------------------------------------------
---@class GuiButtonSpriteSm : GuiButton
GuiButtonSpriteSm = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.icon_sm
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSpriteSm : GuiButton
GuiButtonSelectSpriteSm = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.select_icon_sm
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSpriteSm
function GuiButtonSelectSpriteSm:color(color)
    local style = defines.mod.styles.button.select_icon_sm
    if color == "red" then style = defines.mod.styles.button.select_icon_sm_red end
    if color == "yellow" then style = defines.mod.styles.button.select_icon_sm_yellow end
    if color == "green" then style = defines.mod.styles.button.select_icon_sm_green end
    if color == "flat" then style = defines.mod.styles.button.select_icon_sm_flat end
    self.options.style = style
    return self
end

-------------------------------------------------------------------------------
---@class GuiButtonSpriteXxl : GuiButton
GuiButtonSpriteXxl = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.icon_xxl
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSpriteXxl : GuiButton
GuiButtonSelectSpriteXxl = newclass(GuiButton, function(base, ...)
    GuiButton.init(base, ...)
    base.options.style = defines.mod.styles.button.select_icon_xxl
    base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSpriteXxl
function GuiButtonSelectSpriteXxl:color(color)
    local style = defines.mod.styles.button.select_icon_xxl
    if color == "red" then style = defines.mod.styles.button.select_icon_xxl_red end
    if color == "yellow" then style = defines.mod.styles.button.select_icon_xxl_yellow end
    if color == "green" then style = defines.mod.styles.button.select_icon_xxl_green end
    if color == "flat" then style = defines.mod.styles.button.select_icon_xxl_flat end
    self.options.style = style
    return self
end
