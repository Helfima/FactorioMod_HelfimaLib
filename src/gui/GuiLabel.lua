-------------------------------------------------------------------------------
--- Class to help to build GuiLabel
---@class GuiLabel : GuiElement
GuiLabel = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiLabel"
  base.options.type = "label"
end)

-------------------------------------------------------------------------------
---Set wrap
---@param wrap boolean
---@return GuiLabel
function GuiLabel:wordWrap(wrap)
  self.options.word_wrap = wrap
  return self
end

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiLabel
function GuiLabel:color(color)
  local color = defines.mod.tags.color[color] or defines.mod.tags.color.orange
  self.m_caption = {"", color, self.m_caption, defines.mod.tags.color.close}
  return self
end