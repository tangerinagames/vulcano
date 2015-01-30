local PACKAGE = (...):match("^(.+)%.[^%.]+")
local Class = require(PACKAGE .. ".class")
local Entity = require(PACKAGE .. ".entity")

-- internal functions

local iterateWithCheck = function(check, class, message, callback, ...)
  local list = table.pack(...)
  for i = 1, list.n do
    local item = list[i]
    if not check(item, class) then
      error(tostring(item) .. message)
    end
    callback(item)
  end
end

-- class definition

local Engine = Class("Engine")

function Engine:initialize()
  self.entities = {}
end

function Engine:addEntity(...)
  local callback = function(entity)
    table.insert(self.entities, entity)
  end
  iterateWithCheck(Class.Object.isInstanceOf, Entity, " is not a Entity instance!", callback, ...)
end

function Engine:registerOnSystems(entity)

end

return Engine
