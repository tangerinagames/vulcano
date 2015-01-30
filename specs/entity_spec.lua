local Vulcano = require('vulcano')
local Class = Vulcano.Class
local Entity = Vulcano.Entity
local Engine = Vulcano.Engine
local Component = Vulcano.Component

describe("Entity", function()

  local Position = Class("Position", Component)
  local Size = Class("Size", Component)
  local entity = nil

  before_each(function()
    entity = Entity()
    entity.engine = Engine()
  end)

  it("should exists", function()
    assert.is.truthy(Entity)
  end)

  it("should be a subclass of Object", function()
    assert.True(Entity:isSubclassOf(Vulcano.Class.Object))
  end)

  describe(":add()", function()

    it("should add components", function()
      entity:add(Position())
      assert.is.truthy(entity:get(Position))
    end)

    it("should add multiple components", function()
      entity:add(Position(), Size())
      assert.is.truthy(entity:get(Position))
      assert.is.truthy(entity:get(Size))
    end)

    it("should change the entity bitmask", function()
      assert.are.equals(0, entity.mask)

      entity:add(Position())
      assert.are.equals(Position():type().mask, entity.mask)

      entity:add(Size())
      assert.are.equals(Position():type().mask + Size():type().mask, entity.mask)
    end)

    it("should notify the engine about the new bitmask", function()
      spy.on(entity.engine, "registerOnSystems")
      entity:add(Position())
      assert.spy(entity.engine.registerOnSystems).was.called()
    end)

    it("should change the entity bitmask", function()
      assert.are.equals(0, entity.mask)

      entity:add(Position())
      assert.are.equals(Position():type().mask, entity.mask)

      entity:add(Size())
      assert.are.equals(Position():type().mask + Size():type().mask, entity.mask)
    end)

    it("should only accepts Component instances", function()
      local call = function()
        entity:add("foobar")
      end
      assert.has_error(call, "foobar is not a Component instance!")
    end)
 
  end)

  describe(":get()", function()

    it("should return a component", function()
      entity:add(Position())

      local position = entity:get(Position)
      assert.are.True(position:isInstanceOf(Position))
    end)

    it("should return multiple components", function()
      entity:add(Size())
      entity:add(Position())
      
      local position, size = entity:get(Position, Size)
      assert.are.True(size:isInstanceOf(Size))
      assert.are.True(position:isInstanceOf(Position))
    end)

     it("should only accepts Component subclasses", function()
      local call = function()
        entity:get("footype")
      end
      assert.has_error(call, "footype is not a Component subclass!")
    end)

  end)

  describe(":remove()", function()

    it("should remove a component", function()
      entity:add(Position())

      entity:remove(Position)
      assert.is.falsy(entity:get(Position))
    end)

    it("should remove multiple components", function()
      entity:add(Size())
      entity:add(Position())
      
      entity:remove(Position, Size)
      assert.is.falsy(entity:get(Position, Size))
    end)

    it("should notify the engine about the new bitmask", function()
      entity:add(Position())
      spy.on(entity.engine, "registerOnSystems")
      entity:remove(Position)
      assert.spy(entity.engine.registerOnSystems).was.called()
    end)

    it("should change the entity bitmask", function()
      entity:add(Position())
      assert.are.equals(Position():type().mask, entity.mask)

      entity:remove(Position)
      assert.are.equals(0, entity.mask)
    end)

    it("should only accepts Component subclasses", function()
      local call = function()
        entity:remove("footype")
      end
      assert.has_error(call, "footype is not a Component subclass!")
    end)

  end)

end)
