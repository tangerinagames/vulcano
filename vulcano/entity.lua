local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")

local Entity = Class("Entity")

function Entity:initialize()
  self.mask = 0
  self.component = {}
end

return Entity
