bit = require("bit")

local PACKAGE = ...
local components = { 'Class', 'Component', 'ComponentType', 'Engine', 'Entity' }
local Vulcano = {}

for _, component in pairs(components) do
 Vulcano[component] = require(PACKAGE .. "." .. component:lower())
end

return Vulcano
