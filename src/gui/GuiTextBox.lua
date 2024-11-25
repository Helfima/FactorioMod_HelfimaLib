-------------------------------------------------------------------------------
---Class to help to build GuiTextBox
---@class GuiTextBox : GuiElement
GuiTextBox = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiTextBox"
  base.options.type = "text-box"
  base.options.style = "textbox"
end)

-------------------------------------------------------------------------------
---Set text
---@param text string
---@return GuiTextBox
function GuiTextBox:text(text)
  self.options.text = text
  return self
end

-------------------------------------------------------------------------------
---Set wrap
---@param wrap boolean
---@return GuiTextBox
function GuiTextBox:word_wrap(wrap)
  self.options.word_wrap = wrap
  return self
end

-------------------------------------------------------------------------------
---Set read_only
---@param read_only boolean
---@return GuiTextBox
function GuiTextBox:read_only(read_only)
  self.options.read_only = read_only
  return self
end