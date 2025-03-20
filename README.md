# AutoHotkey Generic Task Automation Script

## Overview
This is a flexible **AutoHotkey (AHK) script** designed to automate repetitive tasks by searching for a target image on the screen, interacting with it, and managing loops based on user-defined parameters. It’s highly customizable, allowing users to specify the number of tasks to perform and the image to search for, making it applicable to a wide range of use cases, from automation workflows to simple GUI interactions.

## Features
- **Setup Prompt**: Users can define the number of tasks and provide the image file path before the script starts.
- **Image Search**: Utilizes AutoHotkey's `ImageSearch` to locate the target image on the screen.
- **Mouse Management**: Moves the cursor intelligently to avoid overlapping the target image and causing false negatives.
- **Dynamic Scrolling**: Scrolls the screen incrementally to locate elements that might not be visible initially.
- **Custom Task Limit**: Stops the script automatically once the specified number of tasks has been completed.
- **Escape Key to Exit**: Allows users to gracefully exit the script at any time.

## How It Works
1. **Setup Phase**:
   - Input the image file path (e.g., `C:\Users\YourName\Pictures\snip.png`).
   - Specify how many times you want the task to be performed.
2. **Search Phase**:
   - The script dynamically searches for the target image on the screen using `ImageSearch`.
   - If the image is found:
     - It clicks the image.
     - Moves the cursor away from the image to prevent interference.
     - Increments the task counter.
   - If the image isn’t found:
     - It scrolls the page down and continues searching.
3. **Completion**:
   - The script stops automatically when the specified number of tasks is completed or can be exited manually with the **Escape key**.

## Requirements
- **AutoHotkey (AHK)**: Download and install AutoHotkey from [here](https://www.autohotkey.com/).
- **Target Image**: Prepare the image file you want to search for on the screen and ensure it’s in the correct path.
- **Windows Environment**: Designed to work on Windows systems using AHK.

## How to Use
1. Save the script as a `.ahk` file (e.g., `TaskAutomation.ahk`).
2. Double-click the file to run it.
3. Enter the full path to the target image and the number of tasks to perform when prompted.
4. Watch as the script automates the task for the specified number of iterations.
5. Press `Esc` anytime to terminate the script.

## Customization
- **Image Path**: Dynamically input the image file path at runtime to fit your workflow.
- **Task Count**: Adjust the number of tasks during the setup phase via the input prompt.
- **Mouse Offset**: Change the cursor offset by modifying the `imageWidth` variable (default: 50 pixels):
  ```autohotkey
  imageWidth := 50
  ```
- **Scrolling Behavior**: Adjust scroll increments and delays by modifying the corresponding `Send` and `Sleep` commands:
  ```autohotkey
  Send, {WheelDown}
  Sleep, 200
  ```

## Example Use Case
Imagine a scenario where you need to repeatedly click on a button (represented by an image) in a web or desktop application:
- The script will locate the button’s image on the screen, click it, scroll down to find more buttons, and repeat the process until the user-specified task count is reached.

Here is an example image of a button that you would use for automation.  I found it better to not include the button edges as the screenshots could alter the resolution of the button, resulting in the image not being found in script.  This could be mitigated as well by adjusting the tolerance level (e.g., `*20` in ImageSearch params to be greater, `*50`, or smaller, `*10`, to match your use case), but the current value worked for my needs after testing various tolerance levels.


![Task Automation Example](https://github.com/dhardin/ScrollAndClick-AHK-Automation/blob/main/snip.png)

## Notes
- The accuracy of `ImageSearch` may vary depending on screen resolution and display scaling (100% scaling is recommended).
- Ensure the target image is a precise match to avoid false positives or negatives.
- The script relies on stable UI elements for consistent performance.

## License
This project is open-source and free to use. Feel free to modify it as needed for your purposes.
