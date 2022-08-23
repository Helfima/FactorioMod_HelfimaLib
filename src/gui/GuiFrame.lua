-------------------------------------------------------------------------------
---Class to help to build frame
---@class GuiFrame : GuiElement
GuiFrame = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiFrame"
  base.options.type = "frame"
  base.options.style = defines.mod.styles.frame.default
end)

-------------------------------------------------------------------------------
---@class GuiFrameH
GuiFrameH = newclass(GuiFrame,function(base,...)
  GuiFrame.init(base,...)
  base.options.direction = defines.mod.direction.horizontal
end)

-------------------------------------------------------------------------------
---@class GuiFrameV
GuiFrameV = newclass(GuiFrame,function(base,...)
  GuiFrame.init(base,...)
  base.options.direction = defines.mod.direction.vertical
end)

