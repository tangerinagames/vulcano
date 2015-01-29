local Vulcano = require('vulcano')
local ComponentType = Vulcano.ComponentType

function printx(x)
  print("0x"..bit.tohex(x, 16) .. " = " .. x)
end

describe("ComponentType", function()
  randomize()

  it("should exists", function()
    assert.truthy(ComponentType)
  end)

  it("should be a subclass of Object", function()
    assert.True(ComponentType:isSubclassOf(Vulcano.Class.Object))
  end)

  it("should generate a unique ID for each instance", function()
    assert.are_not.equals(ComponentType().id, ComponentType().id)
  end)

   it("should generate a bitmask for each instance", function()
    assert.are_not.equals(ComponentType().mask, ComponentType().mask)
  end)

end)
