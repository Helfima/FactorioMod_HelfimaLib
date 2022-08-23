-------------------------------------------------------------------------------
---Class to help to build GuiCheckBox
---@class GuiCheckBox : GuiElement
GuiCheckBox = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiCheckBox"
  base.options.type = "checkbox"
end)

-------------------------------------------------------------------------------
---Set state
---@param state boolean
---@return GuiCheckBox
function GuiCheckBox:state(state)
  self.options.state = state
  return self
end