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