-- JSON Language Server
-- JSON schemas from SchemaStore.nvim
local schemastore = require("schemastore")

return {
    settings = {
        json = {
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = schemastore.json.schemas(),
            validate = { enable = true },
        },
    },
}
