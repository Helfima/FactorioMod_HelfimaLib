require "__HelfimaLib__.core.class"
require "__HelfimaLib__.core.Format"
require "__HelfimaLib__.core.logging"
require "__HelfimaLib__.core.Object"
require "__HelfimaLib__.core.tableExtends"
require "__HelfimaLib__.core.util"
require "__HelfimaLib__.core.defines"
require "__HelfimaLib__.core.defines_builded"
require "__HelfimaLib__.gui.Gui"

Cache = require "__HelfimaLib__.data.Cache"
User = require "__HelfimaLib__.data.User"

Area = require "__HelfimaLib__.models.Area"
Chunk = require "__HelfimaLib__.models.Chunk"
EntityPrototype = require "__HelfimaLib__.models.EntityPrototype"
Player = require "__HelfimaLib__.models.Player"
Resource = require "__HelfimaLib__.models.Resource"

require "__HelfimaLib__.controllers.Dispatcher"
require "__HelfimaLib__.views.Form"
require "__HelfimaLib__.views.AdminPanel"

Form.views["HLAdmin"] = AdminPanel("HLAdmin")
