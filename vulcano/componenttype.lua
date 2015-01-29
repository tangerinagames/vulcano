local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")

local ComponentType = Class("ComponentType")

ComponentType.static.NEXT_ID = 1
ComponentType.static.NEXT_MASK = 1

function ComponentType:initialize()
  self.id = ComponentType.NEXT_ID
  ComponentType.static.NEXT_ID = ComponentType.NEXT_ID + 1

  self.mask = ComponentType.NEXT_MASK
  ComponentType.static.NEXT_MASK = ComponentType.NEXT_MASK * 2 -- same as left-shit per 1
end

return ComponentType
