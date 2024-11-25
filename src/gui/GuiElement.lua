-------------------------------------------------------------------------------
---Description of the module.
---@class GuiElement : newclass
---@field classname string
---@field name table
---@field is_caption boolean
---@field options table
---@field post_action table
GuiElement = newclass(function(base,...)
  base.name = {...}
  base.classname = "HMGuiElement"
  base.options = {}
  base.is_caption = true
  base.post_action = {}
end)
GuiElement.classname = "HMGuiElement"
GuiElement.color_button_default = "gray"
GuiElement.color_button_default_product = "blue"
GuiElement.color_button_default_ingredient = "yellow"
GuiElement.color_button_none = "blue"
GuiElement.color_button_edit = "green"
GuiElement.color_button_add = "yellow"
GuiElement.color_button_rest = "red"

-------------------------------------------------------------------------------
---Set style
---@return GuiElement
function GuiElement:style(...)
  if ... ~= nil then
    self.options.style = table.concat({...},"_")
  end
  return self
end

-------------------------------------------------------------------------------
---Set style
---@param width number
---@param height? number
---@return GuiElement
function GuiElement:size(width, height)
  if width ~= nil then
    self.post_action["apply_size"] = {width = width, height = height}
  end
  return self
end

-------------------------------------------------------------------------------
---Set caption
---@param caption string
---@return GuiElement
function GuiElement:caption(caption)
  self.m_caption = caption
  return self
end

-------------------------------------------------------------------------------
---Set tooltip
---@param tooltip table
---@return GuiElement
function GuiElement:tooltip(tooltip)
  if tooltip ~= nil and tooltip.classname == "HLGuiTooltip" then
    self.options.tooltip = tooltip:create()
  else
    self.options.tooltip = tooltip
  end
  return self
end

-------------------------------------------------------------------------------
---Set ignored by interaction
---@return GuiElement
function GuiElement:ignored_by_interaction()
  self.options.ignored_by_interaction = true
  return self
end

-------------------------------------------------------------------------------
---Set overlay
---@param type string
---@param name? string
---@return GuiElement
function GuiElement:overlay(type, name)
  if type == nil then return self end
  if name == nil then
    self.m_overlay = string.format("helfima-lib-%s", type)
  elseif type ~= nil and name ~= nil then
    if type == "resource" then type = "item" end
    if Player.is_valid_sprite_path(string.format("%s/%s", type, name)) then
      self.m_overlay = string.format("%s/%s", type, name)
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "item", name)) then
      self.m_overlay = string.format("%s/%s", "item", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> item")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "entity", name)) then
      self.m_overlay = string.format("%s/%s", "entity", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> entity")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "fluid", name)) then
      self.m_overlay = string.format("%s/%s", "fluid", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> fluid")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "technology", name)) then
      self.m_overlay = string.format("%s/%s", "technology", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> technology")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "recipe", name)) then
      self.m_overlay = string.format("%s/%s", "recipe", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> recipe")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "item-group", name)) then
      self.m_overlay = string.format("%s/%s", "item-group", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> item-group")
    end
  end
  return self
end

-------------------------------------------------------------------------------
---Get sprite string
---@param type string
---@param name? string
---@return string
function GuiElement.getSprite(type, name)
  local sprite = ""
  if name == nil then
    sprite = string.format("helfima-lib-%s", type)
  elseif type ~= nil and name ~= nil then
    if type == "resource" then type = "entity" end
    if type == "rocket" then type = "item" end
    if Player.is_valid_sprite_path(string.format("%s/%s", type, name)) then
      sprite = string.format("%s/%s", type, name)
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "item", name)) then
      sprite = string.format("%s/%s", "item", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> item")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "entity", name)) then
      sprite = string.format("%s/%s", "entity", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> entity")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "fluid", name)) then
      sprite = string.format("%s/%s", "fluid", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> fluid")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "technology", name)) then
      sprite = string.format("%s/%s", "technology", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> technology")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "recipe", name)) then
      sprite = string.format("%s/%s", "recipe", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> recipe")
    elseif Player.is_valid_sprite_path(string.format("%s/%s", "item-group", name)) then
      sprite = string.format("%s/%s", "item-group", name)
      Logging:warn(GuiButton.classname, "wrong type", type, name, "-> item-group")
    end
  end
  return sprite
end

-------------------------------------------------------------------------------
---Get options
---@return table
function GuiElement:getOptions()
  self.options.name = table.concat(self.name,"=")
  if self.is_caption then
    self.options.caption = self.m_caption
  end
  return self.options
end

-------------------------------------------------------------------------------
---Get option when error
---@return table
function GuiElement:onErrorOptions()
  local options = self:getOptions()
  options.style = nil
  return options
end

-------------------------------------------------------------------------------
---Add a element
---@param parent LuaGuiElement --container for element
---@param gui_element GuiElement
---@return LuaGuiElement --the LuaGuiElement added
function GuiElement.add(parent, gui_element)
  local element = nil
  local ok , err = pcall(function()
    if gui_element.classname ~= "HLGuiCell" then
      local options = gui_element:getOptions()
      element = parent.add(options)
      GuiElement.add_post_action(element, gui_element)
    else
      element = gui_element:create(parent)
    end
  end)
  if not ok then
    element = parent.add(gui_element:onErrorOptions())
    element.tooltip = err
    log(err)
    log(debug.traceback())
  end
  return element
end

-------------------------------------------------------------------------------
---Add a post action on element
---@param parent LuaGuiElement --container for element
---@param gui_element GuiElement
function GuiElement.add_post_action(parent, gui_element)
  if gui_element.post_action == nil then return end
  for action_name, action in pairs(gui_element.post_action) do
    if action_name == "mask_quality" then
      GuiElement.mask_quality(parent, action.quality, action.size)
    end
    if action_name == "apply_elem_value" then
      if action ~= nil and action.name ~= nil then
        parent.elem_value = action
      end
    end
    if action_name == "apply_size" then
      if action ~= nil and action.width ~= nil then
        parent.style.width = action.width
        if action.height ~= nil then
          parent.style.height = action.height
        end
        parent.style.stretch_image_to_widget_size = true
      end
    end
    if action_name == "apply_style" then
      if action ~= nil then
        for key, value in pairs(action) do
          parent.style[key] = value
        end
      end
    end
  end
end

-------------------------------------------------------------------------------
---Get the number of textfield input
---@param element LuaGuiElement --textfield input
---@return number --number of textfield input
function GuiElement.getInputNumber(element)
  local count = 0
  if element ~= nil then
    local tempCount=tonumber(element.text)
    if type(tempCount) == "number" then count = tempCount end
  end
  return count
end

-------------------------------------------------------------------------------
---Get dropdown selection
---@param element LuaGuiElement
---@return string|table|nil
function GuiElement.get_dropdown_selection(element)
  if element.selected_index == 0 then return nil end
  if #element.items == 0 then return nil end
  return element.items[element.selected_index]
end

-------------------------------------------------------------------------------
---Set the text of textfield input
---@param element LuaGuiElement
---@param value string
function GuiElement.set_input_text(element, value)
  if element ~= nil and element.text ~= nil then
    element.text = value
  end
end

-------------------------------------------------------------------------------
---Find element
---@param element LuaGuiElement
---@param search string
---@return LuaGuiElement
function GuiElement.find_element(element, search)
  if element ~= nil then
    for _, children_name in pairs(element.children_names) do
      if string.find(children_name, search, 0, true) then
        return element[children_name]
      end
    end
  end
end

-------------------------------------------------------------------------------
---Add quality mmask
---@param parent LuaGuiElement
---@param quality string
---@param size number?
function GuiElement.mask_quality(parent, quality, size)
  if quality == nil or quality == "normal" then
    return
  end
  local sprite_name = GuiElement.getSprite("quality", quality)
  local container = GuiElement.add(parent, GuiFlow("quality-info"))
  local style_name = parent.style.name
  local mask_frame = GuiElement.add(container, GuiSprite("quality-info"):sprite(sprite_name))
  if string.find(style_name, "_sm") then
    container.style.top_padding = 8
    mask_frame.style.width = size or 8
    mask_frame.style.height = size or 8
  elseif string.find(style_name, "_m") then
    container.style.top_padding = 12
    mask_frame.style.width = size or 10
    mask_frame.style.height = size or 10
  else
    container.style.top_padding = 20
    mask_frame.style.width = size or 12
    mask_frame.style.height = size or 12
  end
  mask_frame.style.stretch_image_to_widget_size = true
  mask_frame.ignored_by_interaction = true
end

-------------------------------------------------------------------------------
---Add tags
---@param data table
function GuiElement:tags(data)
  self.options["tags"] = data
  return self
end