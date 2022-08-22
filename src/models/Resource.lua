-------------------------------------------------------------------------------
---@class Resource
local Resource = {
  ---single-line comment
  classname = "HLResource"
}

---get resource key
---@param resource ResourceData|LuaEntity
---@return string
function Resource.get_key(resource)
    return string.format("%s,%s", resource.position.x, resource.position.y)
end

---create resource
---@param resource LuaEntity
---@return ResourceData
function Resource.create(resource)
    ---@type ResourceData
    local new_resource = {
        name=resource.name,
        type=resource.type,
        position=resource.position,
        amount=resource.amount
    }
    return new_resource
end

---@param resource LuaEntity
---@return string
function Resource.get_product_type(resource)
    local type = "item"
    local product = Resource.get_product(resource)
    if product ~= nil then
        type = product.type
    end
    return type
end
---@param resource LuaEntity
---@return Product|nil
function Resource.get_product(resource)
    local products = resource.prototype.mineable_properties.products
    if products ~= nil then
        return products[1]
    end
    return nil
end

---@param resource LuaEntity
function Resource.get_icon(resource)
    local name = resource.name
    local type = "item"
    local product = Resource.get_product(resource)
    if product ~= nil then
        name = product.name
        type = product.type
    end
    local icon = {name=name, type=type}
    return icon
end

function Resource.get_icon_string(resource)
    local icon = Resource.get_icon(resource)
    return string.format("[%s=%s]", icon.type, icon.name)
end

return Resource