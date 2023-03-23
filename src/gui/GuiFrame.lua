-------------------------------------------------------------------------------
---Class to help to build frame
---@class GuiFrame : GuiElement
GuiFrame = newclass(GuiElement, function(base, ...)
    GuiElement.init(base, ...)
    base.classname = "HLGuiFrame"
    base.options.type = "frame"
    base.options.style = defines.mod.styles.frame.default
end)

-------------------------------------------------------------------------------
---Set style
---@param gui defines.relative_gui_type
---@param position defines.relative_gui_position
---@return GuiElement
function GuiFrame:anchor(gui, position)
    local gui_anchor = {
        gui = gui,
        position = position
    }
    self.options.anchor = gui_anchor
    return self
end

-------------------------------------------------------------------------------
---@class GuiFrameH
GuiFrameH = newclass(GuiFrame, function(base, ...)
    GuiFrame.init(base, ...)
    base.options.direction = defines.mod.direction.horizontal
end)

-------------------------------------------------------------------------------
---@class GuiFrameV
GuiFrameV = newclass(GuiFrame, function(base, ...)
    GuiFrame.init(base, ...)
    base.options.direction = defines.mod.direction.vertical
end)
