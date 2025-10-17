tell application "System Events"
    -- First try to open Notification Center and clear all notifications
    try
        -- Click notification center icon in menu bar
        tell process "SystemUIServer"
            click menu bar item "Notification Center" of menu bar 1
        end tell
        delay 1
        
        -- Look for the notification center window and clear all notifications
        tell process "NotificationCenter"
            if exists window "Notification Center" then
                tell window "Notification Center"
                    -- Try to find Clear All button
                    try
                        click button "Clear All"
                        delay 0.5
                    end try
                    
                    -- Try to find and click individual notification close buttons
                    try
                        repeat with i from 1 to 20
                            try
                                set notificationGroup to group i of scroll area 1
                                if exists notificationGroup then
                                    -- Try to find close button in this notification
                                    try
                                        click button "Close" of notificationGroup
                                        delay 0.2
                                    end try
                                    -- Try alternative close button locations
                                    try
                                        click button 1 of notificationGroup
                                        delay 0.2
                                    end try
                                end if
                            on error
                                exit repeat
                            end try
                        end repeat
                    end try
                end tell
            end if
        end tell
        
        -- Close notification center
        tell process "SystemUIServer"
            click menu bar item "Notification Center" of menu bar 1
        end tell
        
    on error
        -- Fallback: Try alternative approach
        try
            tell process "NotificationCenter"
                if exists then
                    repeat
                        try
                            set theWindow to group 1 of UI element 1 of scroll area 1 of window "Notification Center"
                        on error
                            exit repeat
                        end try
                        
                        try
                            set theActions to actions of theWindow
                            
                            repeat with theAction in theActions
                                if description of theAction is "Clear All" then
                                    tell theWindow
                                        perform theAction
                                    end tell
                                    exit repeat
                                end if
                            end repeat
                            
                            repeat with theAction in theActions
                                if description of theAction is "Close" then
                                    tell theWindow
                                        perform theAction
                                    end tell
                                    exit repeat
                                end if
                            end repeat
                            
                        end try
                    end repeat
                end if
            end tell
        end try
    end try
end tell