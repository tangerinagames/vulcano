local PACKAGE = (...):match("^(.+)%.[^%.]+")
local class = require(PACKAGE .. ".class")

return class("Component")
