local Vulcano = require('vulcano')
local Class = Vulcano.Class
local Entity = Vulcano.Entity
local Component = Vulcano.Component

describe("Entity", function()

  local Position = Class("Position", Component)
  local Size = Class("Size", Component)

  it("should exists", function()
    assert.is.truthy(Entity)
  end)

  it("should be a subclass of Object", function()
    assert.True(Entity:isSubclassOf(Vulcano.Class.Object))
  end)

  describe(":add()", function()

    it("should add components", function()
      local entity = Entity()
      entity:add(Position())
      assert.is.truthy(entity:get(Position))
    end)

    it("should add multiple components", function()
      local entity = Entity()
      entity:add(Position(), Size())
      assert.is.truthy(entity:get(Position))
      assert.is.truthy(entity:get(Size))
    end)

    it("should change the entity bitmask", function()
      local entity = Entity()
      assert.are.equals(0, entity.mask)

      entity:add(Position())
      assert.are.equals(Position():type().mask, entity.mask)

      entity:add(Size())
      assert.are.equals(Position():type().mask + Size():type().mask, entity.mask)
    end)

    it("should only accepts Component instances", function()
      local call = function()
        local entity = Entity()
        entity:add("foobar")
      end
      assert.has_error(call, "foobar is not a Component instance!")
    end)
 
  end)

  describe(":get()", function()

    it("should return a component", function()
      local entity = Entity()
      entity:add(Position())

      local position = entity:get(Position)
      assert.are.True(position:isInstanceOf(Position))
    end)

    it("should return multiple components", function()
      local entity = Entity()
      entity:add(Size())
      entity:add(Position())
      
      local position, size = entity:get(Position, Size)
      assert.are.True(size:isInstanceOf(Size))
      assert.are.True(position:isInstanceOf(Position))
    end)

     it("should only accepts Component subclasses", function()
      local call = function()
        local entity = Entity()
        entity:get("footype")
      end
      assert.has_error(call, "footype is not a Component subclass!")
    end)

  end)

  describe(":remove()", function()

    it("should remove a component", function()
      local entity = Entity()
      entity:add(Position())

      entity:remove(Position)
      assert.is.falsy(entity:get(Position))
    end)

    it("should remove multiple components", function()
      local entity = Entity()
      entity:add(Size())
      entity:add(Position())
      
      entity:remove(Position, Size)
      assert.is.falsy(entity:get(Position, Size))
    end)

    it("should change the entity bitmask", function()
      local entity = Entity()
      entity:add(Position())
      assert.are.equals(Position():type().mask, entity.mask)

      entity:remove(Position)
      assert.are.equals(0, entity.mask)
    end)

    it("should only accepts Component subclasses", function()
      local call = function()
        local entity = Entity()
        entity:remove("footype")
      end
      assert.has_error(call, "footype is not a Component subclass!")
    end)

  end)

end)
