#Requires AutoHotkey v2.0

Run "ms-settings:easeofaccess-mousepointer"
Sleep 1000
Send "{Tab}{Tab}{Tab}{Tab}"
Send "{Right}"
Sleep 500
Send "{Tab}"
Send "{Right}"
Sleep 500
Send "!{F4}"