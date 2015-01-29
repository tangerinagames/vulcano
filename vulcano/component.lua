local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")
local ComponentType = require(PACKAGE .. ".componenttype")

local Component = Class("Component")

Component.static.types = {}

function Component:type()
  if not Component.types[self.class.name] then
    Component.types[self.class.name] = ComponentType()
  end
  return Component.types[self.class.name]
end

return Component
