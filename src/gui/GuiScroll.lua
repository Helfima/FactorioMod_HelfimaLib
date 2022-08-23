-------------------------------------------------------------------------------
---Class to help to build GuiScroll
---@class GuiScroll : GuiElement
GuiScroll = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiScroll"
  base.options.type = "scroll-pane"
  base.options.style = "inner_frame_scroll_pane"
end)

-------------------------------------------------------------------------------
---Set policy
---@param policy string
---@return GuiScroll
function GuiScroll:policy(policy)
  self.options.horizontal_scroll_policy = "auto"
  if policy == true then
    self.options.vertical_scroll_policy = "auto"
  end
  return self
end