local pow_chars =
{
  k = 10 ^ 3,
  K = 10 ^ 3,
  M = 10 ^ 6,
  G = 10 ^ 9,
  T = 10 ^ 12,
  P = 10 ^ 15,
  E = 10 ^ 18,
  Z = 10 ^ 21,
  Y = 10 ^ 24
}

string.parse_number = function(value)
  if value == nil or value == "" then error("invalid value!") end
  if tonumber(value) then return tonumber(value) end
  local magnitude = value:sub(-1)
  -- si pas de magnitude c'est un nombre
  if tonumber(magnitude) then return tonumber(value) end
  local multiplier = pow_chars[magnitude]
  local number = tonumber(value:sub(1, value:len() - 1))
  return number * multiplier
end

---Pcall on event function
---@param callback function
---@return function
function Event_pcall(callback)
  return function(...)
    local ok , err = pcall(function(...)
      callback(...)
    end)
    if not(ok) then
      Player.print(err)
      log(err)
    end
  end
end

-------------------------------------------------------------------------------
---Use to iterate over a table.
---Returns three values: the `next` function, the table `t`, and nil,
---so that the construction :
---
---    for k,v in spairs(t) do *body* end
---will iterate over all key-value pairs of table `t`.
---
---    for k,v in pairs(t, function(t,a,b) return t[b] > t[a] end) do *body* end
---will iterate over all key-value pairs of table `t` with sorting function.
---
---    for k,v in pairs(t, function(t,a,b) return t[b].level > t[a].level end) do *body* end
---will iterate over all key-value pairs of table `t` with sorting function.
---
---@param t table --table to traverse.
---@param order function ---sort function.
function spairs(t, order)
	---bypass
	if order == nil then return pairs(t) end
	---collect the keys
	local keys = {}
	for k in pairs(t) do keys[#keys+1] = k end

	---if order function given, sort by it by passing the table and keys a, b,
	---otherwise just sort the keys
	pcall(function()
		table.sort(keys, function(a,b) return order(t, a, b) end)
	end)

	---return the iterator function
	local i = 0
	return function()
		i = i + 1
		if keys[i] then
			return keys[i], t[keys[i]]
		end
	end
end

-------------------------------------------------------------------------------
---Return first element of table
---@param t table
---@return any
function first(t)
  for _,v in pairs(t) do
    return v
  end
end
-------------------------------------------------------------------------------
---formula
---@param operation string
---@return number
function formula(operation)
  if operation == nil or operation == "" then return 0 end
  local allowed = false
  for i=1, string.len(operation) do
  	if not(string.find(operation,"[0-9.()/*-+%%^]+",i)) then
  	 error({code=1})
  	end
  end
  return load("return " .. operation)()
end

-------------------------------------------------------------------------------
---binary to string
---@param x string
---@return number
function toBinStr(x)
  local ret=""
  while x~=1 and x~=0 do
    ret=tostring(x%2)..ret
    x=math.modf(x/2)
  end
  ret=tostring(x)..ret
  return ret
end


function compare_priority(a,b)
  if a == nil or b == nil then return false end
  for k,v in pairs(a) do
    if b[k] == nil then return false end
    if b[k].name ~= v.name or b[k].value ~= v.value then return false end
  end
  return true
end
