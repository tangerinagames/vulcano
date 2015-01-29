bit = require("bit")

local PACKAGE = ...
local components = {'Class', 'Component', 'ComponentType'}
local Vulcano = {}

for i, component in pairs(components) do
 Vulcano[component] = require(PACKAGE .. "." .. component:lower())
end

return Vulcano
