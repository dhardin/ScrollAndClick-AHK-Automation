F1::
    ; Setup prompt for task repetitions and image path
    InputBox, imagePath, Setup, Enter the full path to the image file (e.g., C:\Users\YourName\Pictures\snip.png):
    if (imagePath = "") ; If the user cancels or enters nothing, exit
        return

    if !FileExist(imagePath)
    {
        MsgBox, The image file does not exist: %imagePath%
        return
    }

    InputBox, taskLimit, Setup, Enter the number of times to perform the task:
    if (taskLimit = "") ; If the user cancels or enters nothing, exit
        return

    ; Initialize variables
    loopCounter := 0         ; To prevent infinite loops
    completedTasks := 0      ; Keep track of completed tasks
    maxScrollAttempts := 100 ; Set a limit for the number of scroll attempts
    imageWidth := 50         ; Approximate width of the image in pixels

    Loop
    {
        ; Exit loop if the Escape key is pressed
        if GetKeyState("Esc", "P")
            break

        ; Scroll down slightly to reveal more content
        Send, {WheelDown}
        Sleep, 200 ; Short delay to ensure scrolling is smooth

        ; Perform ImageSearch using the user-provided image path
        ImageSearch FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *20 %imagePath%
        if !ErrorLevel
        {
            ; Click the image
            MouseClick, Left, %FoundX%, %FoundY%

            ; Move the mouse to the left to avoid overlapping the image
            MouseGetPos, CursorX, CursorY
            NewCursorX := Max(CursorX - imageWidth, 0) ; Ensure the new position doesn't go off-screen
            MouseMove, %NewCursorX%, %CursorY%, 1

            ; Wait for UI updates
            Sleep, 8000

            ; Increment completed tasks and check limit
            completedTasks++
            if (completedTasks >= taskLimit)
            {
                MsgBox, % "Completed " completedTasks " tasks. Exiting."
                break ; Exit the loop once the specified number of tasks is reached
            }
        }
        else
        {
            loopCounter++
            if loopCounter >= maxScrollAttempts
            {
                ; If the bottom is reached, restart scrolling from the top
                MsgBox, Reached the bottom. Restarting search from the top.
                Send, ^{Home} ; Scroll back to the top of the page
                loopCounter := 0 ; Reset the scroll counter
            }
        }

        Sleep, 100 ; Short delay to avoid excessive looping
    }
return
