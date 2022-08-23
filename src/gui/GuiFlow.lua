-------------------------------------------------------------------------------
---Class to help to build flow
---@class GuiFlow : GuiElement
GuiFlow = newclass(GuiElement, function(base, ...)
  GuiElement.init(base, ...)
  base.classname = "HLGuiFlow"
  base.options.type = "flow"
  base.options.style = "helfima_lib_flow_default"
end)

-------------------------------------------------------------------------------
---@class GuiFlowH : GuiFlow
GuiFlowH = newclass(GuiFlow, function(base, ...)
  GuiFlow.init(base, ...)
  base.options.direction = defines.mod.direction.horizontal
  base.options.style = defines.mod.styles.flow.horizontal
end)

-------------------------------------------------------------------------------
---@class GuiFlowV : GuiFlow
GuiFlowV = newclass(GuiFlow, function(base, ...)
  GuiFlow.init(base, ...)
  base.options.direction = defines.mod.direction.vertical
  base.options.style = defines.mod.styles.flow.vertical
end)
