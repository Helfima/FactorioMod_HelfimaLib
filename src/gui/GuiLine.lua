-------------------------------------------------------------------------------
---Class to help to build GuiLine
---@class GuiLine : GuiElement
GuiLine = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiLine"
  base.options.type = "line"
  base.options.style = "line"
end)

-------------------------------------------------------------------------------
---@class GuiLineH
GuiLineH = newclass(GuiLine,function(base,...)
  GuiLine.init(base,...)
  base.options.direction = defines.mod.direction.horizontal
end)

-------------------------------------------------------------------------------
---@class GuiLineV
GuiLineV = newclass(GuiLine,function(base,...)
  GuiLine.init(base,...)
  base.options.direction = defines.mod.direction.vertical
end)
