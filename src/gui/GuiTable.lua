-------------------------------------------------------------------------------
---Class to help to build GuiTable
---@class GuiTable : GuiElement
GuiTable = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HLGuiTable"
  base.options.type = "table"
  base.options.style = "helfima_lib_table_default"
end)

-------------------------------------------------------------------------------
---Set column
---@param column_count number
---@return GuiTable
function GuiTable:column(column_count)
  self.options.column_count = column_count
  return self
end

-------------------------------------------------------------------------------
---Set column widths
---@param column_widths table
---@return GuiTable
function GuiTable:column_widths(column_widths)
  self.post_action["apply_style"] = {column_widths = column_widths}
  return self
end