local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")
local Component = require(PACKAGE .. ".component")

local Entity = Class("Entity")

function Entity:initialize()
  self.mask = 0
  self.components = {}
end

function Entity:add(...)
  local callback = function(component)
    self.mask = self.mask + component:type().mask
    self.components[component.class.name] = component
  end
  iterateWithCheck(Class.Object.isInstanceOf, " is not a Component instance!", callback, ...)
end

function Entity:get(...)
  local components = {}
  local callback = function(class)
    table.insert(components, self.components[class.name])
  end
  iterateWithCheck(Class.Object.isSubclassOf, " is not a Component subclass!", callback, ...)
  return unpack(components)
end

function Entity:remove(...)
  local callback = function(class)
    self.mask = self.mask - Component.typeOf(class).mask
    self.components[class.name] = nil
  end
  iterateWithCheck(Class.Object.isSubclassOf, " is not a Component subclass!", callback, ...)
end

function iterateWithCheck(check, message, callback, ...)
  local list = table.pack(...)
  for i = 1, list.n do
    local item = list[i]
    if not check(item, Component) then
      error(tostring(item) .. message)
    end
    callback(item)
  end
end

return Entity
