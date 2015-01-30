local Vulcano = require('vulcano')
local Class = Vulcano.Class
local Engine = Vulcano.Engine
local Entity = Vulcano.Entity

describe("Engine", function()

  it("should exists", function()
    assert.is.truthy(Engine)
  end)

  it("should be a subclass of Object", function()
    assert.True(Engine:isSubclassOf(Vulcano.Class.Object))
  end)

  describe(":addEntity()", function()

    it("should add entities", function()
      local engine = Engine()
      engine:addEntity(Entity())
      assert.is.equals(1, #engine.entities)
    end)

    it("should add multiple entities", function()
      local engine = Engine()
      engine:addEntity(Entity(), Entity())
      assert.is.equals(2, #engine.entities)
    end)

    it("should only accepts Component instances", function()
      local call = function()
        local engine = Engine()
        engine:addEntity("foobar")
      end
      assert.has_error(call, "foobar is not a Entity instance!")
    end)
 
  end)

end)
