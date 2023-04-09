require "__HelfimaLib__.core.class"
require "__HelfimaLib__.core.Format"
require "__HelfimaLib__.core.logging"
require "__HelfimaLib__.core.Object"
require "__HelfimaLib__.core.tableExtends"
require "__HelfimaLib__.core.util"
require "__HelfimaLib__.core.defines"
require "__HelfimaLib__.core.defines_builded"
require "__HelfimaLib__.gui.Gui"

---@type Cache
Cache = require "__HelfimaLib__.data.Cache"
---@type User
User = require "__HelfimaLib__.data.User"

---@type Position
Position = require "__HelfimaLib__.models.Position"
---@type Area
Area = require "__HelfimaLib__.models.Area"
---@type Chunk
Chunk = require "__HelfimaLib__.models.Chunk"
---@type EntityPrototype
EntityPrototype = require "__HelfimaLib__.models.EntityPrototype"
---@type Player
Player = require "__HelfimaLib__.models.Player"
---@type Resource
Resource = require "__HelfimaLib__.models.Resource"

require "__HelfimaLib__.controllers.Dispatcher"
require "__HelfimaLib__.views.Form"
require "__HelfimaLib__.views.FormRelative"
require "__HelfimaLib__.views.AdminPanel"

Form.views["HLAdmin"] = AdminPanel("HLAdmin")
