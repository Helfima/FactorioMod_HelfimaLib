# Create a Form

Create a new Form, the lib use a pseudo class system you extend the Form class

```lua
-------------------------------------------------------------------------------
---Class to build dialog
---@class ResourcesView : Form
ResourcesView = newclass(Form, function(base, classname)
    Form.init(base, classname)
    base.auto_clear = true
end)
```

Change UI size, we can presize the Frame
```lua
-------------------------------------------------------------------------------
---On Style
---@param styles table
---@param width_main number
---@param height_main number
function ResourcesView:on_style(styles, width_main, height_main)
    styles.flow_panel = {
        width = 500,
        minimal_height = 400,
        maximal_height = height_main-200,
    }
end
```

Initialize, here we define the title of Frame
```lua
-------------------------------------------------------------------------------
---On initialization
function ResourcesView:on_init()
    self.panel_caption = { "ResourcesScanner.visualize-title" }
    --self.parameterLast = string.format("%s_%s",self.classname,"last")
end
```

Add binding event, here that close the UI before when admin delete caches
```lua
-------------------------------------------------------------------------------
---For Bind Dispatcher Event
function ResourcesView:on_bind()
    Dispatcher:bind(defines.mod.events.on_before_delete_cache, self, self.on_before_delete_cache)
end

-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function ResourcesView:on_before_delete_cache(event)
    self:close(event)
end
```

Modify content on update event, here you build your UI
```lua
-------------------------------------------------------------------------------
---On Update
---@param event EventModData
function ResourcesView:on_update(event)
    --- your code ---
end
```

Execute action on event, here your add response of dispatcher event
```lua
-------------------------------------------------------------------------------
---On event
---@param event EventModData
function ResourcesView:on_event(event)

    if event.action == "your_action_name" then
        --- your code ---
        
        --- this refresh the UI
        Dispatcher:send(defines.mod.events.on_gui_update, nil, self.classname)
    end

end
```