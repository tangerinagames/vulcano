local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")
local ComponentType = require(PACKAGE .. ".componenttype")

local Component = Class("Component")
local types = {}

function Component:type()
  return Component.typeOf(self.class)
end

function Component.static.typeOf(class)
  if not Class.Object.isSubclassOf(class, Component) then
    error(tostring(item) .. " is not a Component subclass!")
  end
  types[class] = types[class] or ComponentType()
  return types[class]
end

return Component
