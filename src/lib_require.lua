require "core.class"
require "core.Format"
require "core.logging"
require "core.Object"
require "core.tableExtends"
require "core.util"
require "gui.Gui"

Cache = require "data.Cache"
User = require "data.User"

Area = require "models.Area"
Chunk = require "models.Chunk"
EntityPrototype = require "models.EntityPrototype"
Player = require "models.Player"
Resource = require "models.Resource"

require "controllers.Dispatcher"
require "views.Form"
require "views.AdminPanel"

Form.views["HLAdmin"] = AdminPanel("HLAdmin")
