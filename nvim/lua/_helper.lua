--------------------------------------------
---- CUSTOM REQUIRE ------------------------
--------------------------------------------

-- Global variable to track current module context
_CURRENT_MODULE = _CURRENT_MODULE or CONFIG_ROOT .. ".init"

-- Custom relative require function
function req(rel_module)
    local old_module = _CURRENT_MODULE
    local current_dir = _CURRENT_MODULE:match("^(.*)%.") or ""
    local full_module = current_dir ~= "" and (current_dir .. "." .. rel_module) or rel_module
    _CURRENT_MODULE = full_module

    local ok, mod = pcall(require, full_module)
    _CURRENT_MODULE = old_module

    if not ok then
        error("Failed to require '" .. full_module .. "': " .. mod)
    end

    return mod
end

--------------------------------------------
---- SMART PLUGIN LOADER -------------------
--------------------------------------------

local _PLUGINS = _PLUGINS or {}

function plug_begin()
    vim.call("plug#begin")
end

function plug(name, cb, opts)
    local _req = nil

    if cb ~= nil then
        if type(cb) == "string" then
            _req = cb
            cb = function(info) req(info.req) end
        elseif type(cb) == "function" then

        else
            error("plug callback must be either string or function")
        end
    end

    _PLUGINS[name] = { cb = cb, opts = opts, req = _req, parent_mod = _CURRENT_MODULE }
end

function plug_setup(name)
    return function() require(name).setup() end
end

function plug_end()
    local _plug = vim.fn["plug#"]
    -- first, load all plugins
    for k, v in pairs(_PLUGINS) do
        if type(k) == "string" then
            _plug(k, v.opts or { ["do"] = function() end })
        elseif type(k) ~= "function" then
            error("first argument must be string or function")
        end
    end

    vim.call("plug#end")

    -- then call callbacks
    local old_cm = _CURRENT_MODULE
    for k, v in pairs(_PLUGINS) do
        if v.cb ~= nil then
            _CURRENT_MODULE = v.parent_mod
            if v.req == nil then
                v.cb()
            else
                v.cb(v)
            end
        elseif type(k) == "function" then
            k()
        end
    end
    _CURRENT_MODULE = old_cm

    _PLUGINS = {}
end

--------------------------------------------
---- FILE SYSTEM HELPERS -------------------
--------------------------------------------

function iterate_files(dir_path, callback, recursive)
    recursive = recursive or false

    -- Check if the directory exists
    local dir = vim.loop.fs_opendir(dir_path)
    if not dir then
        vim.notify("Directory not found: " .. dir_path, vim.log.levels.ERROR)
        return
    end

    -- Read directory entries
    local function scan_directory(path)
        local handle = vim.loop.fs_opendir(path)
        if not handle then return end

        while true do
            local entries = vim.loop.fs_readdir(handle)
            if not entries then break end

            for _, entry in ipairs(entries) do
                -- Skip current and parent directory entries
                if entry.name ~= '.' and entry.name ~= '..' then
                    local full_path = path .. '/' .. entry.name

                    if entry.type == 'file' then
                        callback(full_path, entry.name)
                    elseif entry.type == 'directory' and recursive then
                        scan_directory(full_path)
                    end
                end
            end
        end

        vim.loop.fs_closedir(handle)
    end

    scan_directory(dir_path)
end

function get_module_path(module_name)
    local path = package.searchpath(module_name, package.path)
    if path then
        return path:match("(.*[/\\])")
    end
    return nil
end
