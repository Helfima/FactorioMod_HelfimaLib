# HelfimaLib

This is a library to create quickly a UI in Factorio. you can fin the sample [here](https://mods.factorio.com/mod/HelfimaLibSample)

# Mod using this libbrary

* [Resources Scanner](https://mods.factorio.com/mod/ResourcesScanner)
* [Quick Logistic Settings](https://mods.factorio.com/mod/QuickLogisticSettings)

# How use

Create a new Form, the lib use a pseudo class system you extend the Form class

    ``-------------------------------------------------------------------------------``
    `---Class to build rule edition dialog`
    ---@class ResourcesView : Form
    ResourcesView = newclass(Form, function(base, classname)
        Form.init(base, classname)
        base.auto_clear = true
    end)
