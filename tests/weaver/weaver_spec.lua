local Weaver = require("weaver")
local eq = assert.are.same

describe("weaver plugin", function()
  before_each(function()
    Weaver:_clear()
  end)

  it("return plugin config", function()
    eq(Weaver:cfg(), {
      height = 30,
      width = 90,
      use_filename_as_weaver_title = false,
    })
  end)

  it("change and return correct config", function()
    Weaver.setup({
      width = 90,
      height = 10,
      use_filename_as_weaver_title = true,
    })

    eq(Weaver:cfg(), {
      width = 90,
      height = 10,
      use_filename_as_weaver_title = true,
    })
  end)
end)
