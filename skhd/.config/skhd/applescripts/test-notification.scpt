tell application "System Events"
    display notification "Test notification for clearing script" with title "Test Notification" subtitle "This should be cleared by hyper-c" sound name "default"
end tell

-- Alternative method using terminal-notifier if available
try
    do shell script "terminal-notifier -message 'Test notification for clearing script' -title 'Test Notification' -subtitle 'This should be cleared by hyper-c' -timeout 0"
end try