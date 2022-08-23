-------------------------------------------------------------------------------
---Class to help to build GuiTab
---@class GuiTabPane : GuiElement
GuiTabPane = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiTabPane"
  base.options.type = "tabbed-pane"
end)

-------------------------------------------------------------------------------
---@class GuiTab
GuiTab = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiTab"
  base.options.type = "tab"
end)

