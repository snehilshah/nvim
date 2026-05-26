local function check()
    local ok, err = loadfile("lua/statusline.lua")
    if not ok then
        print("Error: " .. err)
        os.exit(1)
    end
    print("Syntax OK")
end
check()
