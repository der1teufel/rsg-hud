local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/RexShack/rsg-versioncheckers/main/'..GetCurrentResourceName()..'/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return
        end

        versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        versionCheckPrint('success', ('Latest Version: %s'):format(text))

        if text == currentVersion then
            versionCheckPrint('success', 'Du hast die neuste Version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
