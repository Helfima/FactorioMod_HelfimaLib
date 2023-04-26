# Event and Dispatcher

The Dispatcher read, parse and return event at all Form

A new GuiElement must be have a unique name, this accept a array of string
```lua
GuiElement(string param[])
```

When a event fired, the Dispatcher parse the name of `event.element`, the separator is '=' and split to call all binding Form.
Dispatcher add properties on the current event

Sample declaration of the GuiElement
```lua
GuiElement(self.classname, "my_action_name", "my_item_1", "my_item_2", "my_item_3", "my_item_4")
```

Result in the event
```
event.classname = "my_classname"
event.action = "my_action_name"
event.item1 = "my_item_1"
event.item2 = "my_item_2"
event.item3 = "my_item_3"
event.item4 = "my_item_4"
```

The form with the name `my_classname` recieve the event if it opened