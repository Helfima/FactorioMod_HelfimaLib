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
function GuiLabel:word_wrap(wrap)
  self.options.word_wrap = wrap
  return self
end

-------------------------------------------------------------------------------
---Set wrap
---@param single_line boolean
---@return GuiLabel
function GuiLabel:single_line(single_line)
  self.post_action["apply_style"] = {single_line = single_line}
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

-------------------------------------------------------------------------------
---Set color
---@param font_color table
---@return GuiLabel
function GuiLabel:font_color(font_color)
  if self.post_action["apply_style"] == nil then
    self.post_action["apply_style"] = {}
  end
  self.post_action["apply_style"].font_color = font_color
  return self
end