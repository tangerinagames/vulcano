local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")

local ComponentType = Class("ComponentType")
local NEXT_ID = 1
local NEXT_MASK = 1

function ComponentType:initialize()
  self.id = NEXT_ID
  NEXT_ID = NEXT_ID + 1

  self.mask = NEXT_MASK
  NEXT_MASK = NEXT_MASK * 2 -- same as left-shit per 1
end

return ComponentType
