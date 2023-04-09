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
---Set anchor
---@param gui defines.relative_gui_type
---@param position defines.relative_gui_position
---@return GuiElement
function GuiFlow:anchor(gui, position)
    local gui_anchor = {
        gui = gui,
        position = position
    }
    self.options.anchor = gui_anchor
    return self
end

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
