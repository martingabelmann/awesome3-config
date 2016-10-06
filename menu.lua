local awful = require("awful")
local beautiful = require("beautiful")
local naughty = require("naughty")

function askfor(question, func) 
	naughty.notify({
        title   = question,
        text    = "click for 'yes'",
        timeout = 5,
        run     = func
	})
end

mymainmenu = awful.menu({ 
    items = { 
        { "logout", function() askfor("Do you really want to logout?",  awesome.quit) end},
        
        { "poweroff", function() askfor(
            "Do you really want to shutdown?",  
            function() awful.util.pread(terminal .. " -x systemctl poweroff -i") end
            ) 
            end 
        },

        { "reboot", function() askfor(
            "Do you really want to reboot?",  
            function() awful.util.pread(terminal .. " -x systemctl reboot -i") end
            ) 
            end 
        },

        { "standby", function() askfor(
            "Do you really want to suspend?",  
            function() awful.util.pread(terminal .. " -x systemctl suspend") end
            ) 
            end 
        },
        
        { "lock screen", terminal .. " -x slock" },
        
        { "awesome", nil, theme.awesomearch_icon }
    }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })
