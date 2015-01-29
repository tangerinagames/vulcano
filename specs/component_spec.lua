local Vulcano = require('vulcano')
local Class = require('vulcano').Class
local Component = require('vulcano').Component
local ComponentType = require('vulcano').ComponentType

describe("Component", function()

  local Position = Class("Position", Component)
  local Size = Class("Size", Component)
  local Angle = Class("Angle", Component)

  it("should exists", function()
    assert.truthy(Component)
  end)

  it("should be a subclass of Object", function()
    assert.True(Component:isSubclassOf(Vulcano.Class.Object))
  end)

   it("should return a type for each component", function()
    assert.are_not.equals(Position():type(), Size():type())
  end)

end)
