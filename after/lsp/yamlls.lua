-- YAML Language Server
-- YAML schemas from SchemaStore.nvim; loaded lazily on LSP init.
return {
    before_init = function(_, config)
        config.settings.yaml.schemas = require("schemastore").yaml.schemas()
    end,
    settings = {
        yaml = {
            schemaStore = { enable = false, url = "" },
            validate = true,
        },
    },
}
