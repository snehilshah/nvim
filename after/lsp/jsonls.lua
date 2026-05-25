-- JSON Language Server
-- JSON schemas from SchemaStore.nvim; loaded lazily on LSP init.
return {
    before_init = function(_, config)
        config.settings.json.schemas = require("schemastore").json.schemas()
    end,
    settings = {
        json = {
            schemaStore = { enable = false, url = "" },
            validate = { enable = true },
        },
    },
}
