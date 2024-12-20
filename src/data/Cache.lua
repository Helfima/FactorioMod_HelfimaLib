-------------------------------------------------------------------------------
---@class Cache
local Cache = {
  ---single-line comment
  classname = "HLCache"
}

-------------------------------------------------------------------------------
---Return Cache
---@return table
function Cache.get()
  if storage.caches == nil then storage.caches = {} end
  return storage.caches
end

-------------------------------------------------------------------------------
---Return data Cache
---@param classname string
---@param name string|number
---@return any
function Cache.get_data(classname, name)
  local data = Cache.get()
  if classname == nil and name == nil then return data end
  if data[classname] == nil or data[classname][name] == nil then return nil end
  return data[classname][name]
end

-------------------------------------------------------------------------------
---Set data Cache
---@param classname string
---@param name string
---@param value any
---@return any
function Cache.set_data(classname, name, value)
  local data = Cache.get()
  if data[classname] == nil then data[classname] = {} end
  data[classname][name] = value
  return value
end

-------------------------------------------------------------------------------
---Has data
---@param classname string
---@param name string
---@return boolean
function Cache.has_data(classname, name)
  local data = Cache.get()
  return data[classname] ~= nil and data[classname][name] ~= nil
end

-------------------------------------------------------------------------------
---Is empty
---@param classname string
---@param name string
---@return boolean
function Cache.is_empty(classname, name)
  local data = Cache.get()
  if data[classname] ~= nil and data[classname][name] ~= nil then
    if type(data[classname][name]) == "string" then
      return data[classname][name] == ""
    else
      return table.size(data[classname][name]) == 0
    end
  end
  return true
end

-------------------------------------------------------------------------------
---Reset data
---@param classname string
---@param name string
function Cache.reset(classname, name)
  local data = Cache.get()
  if classname == nil and name == nil then
    storage.caches = {}
  elseif data[classname] ~= nil and name == nil then
    data[classname] = nil
  elseif data[classname] ~= nil then
    data[classname][name] = nil
  end
end

return Cache
