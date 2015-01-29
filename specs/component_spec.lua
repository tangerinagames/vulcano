local Vulcano = require('vulcano')

describe("Component", function()

  it("should exists", function()
    assert.truthy(Vulcano.Component)
  end)

  it("should be a subclass of Object", function()
    assert.True(Vulcano.Component:isSubclassOf(Vulcano.Class.Object))
  end)

end)
