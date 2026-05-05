-- YAML Language Server
-- YAML schemas from SchemaStore.nvim
local schemastore = require("schemastore")

return {
    settings = {
        yaml = {
            schemaStore = {
                enable = false,
                url = "",
            },
            schemas = schemastore.yaml.schemas(),
            validate = true,
        },
    },
}
