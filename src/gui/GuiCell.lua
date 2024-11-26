-------------------------------------------------------------------------------
---Class to help to build GuiSlider
---@class GuiCell : GuiElement
GuiCell = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiCell"
end)

-------------------------------------------------------------------------------
---Set element
---@param element table
---@return GuiCell
function GuiCell:element(element)
  self.element = element
  return self
end

-------------------------------------------------------------------------------
---Set index
---@param index number
---@return GuiCell
function GuiCell:index(index)
  self.m_index = index
  return self
end

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiCell
function GuiCell:color(color)
  self.m_color = color
  return self
end

-------------------------------------------------------------------------------
---Create cell
---@param parent LuaGuiElement --container for element
---@return LuaGuiElement
function GuiCell:create(parent)
end