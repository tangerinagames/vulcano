local Vulcano = require('vulcano')
local Entity = Vulcano.Entity

describe("Entity", function()
  randomize()

  it("should exists", function()
    assert.truthy(Entity)
  end)

  it("should be a subclass of Object", function()
    assert.True(Entity:isSubclassOf(Vulcano.Class.Object))
  end)

end)
