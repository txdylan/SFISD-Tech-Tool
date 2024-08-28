## Overview

This batch file includes a collection of tools designed to help manage computers and automate software installation. Each tool is tailored to perform specific tasks, making it easier to maintain and configure multiple systems efficiently.

## Contents

- **Tool 1: [Connect]**
  - **Description:** Will assist you in repairing or installing "Family Zone Cyber Safety Ltd."
  - **Usage:** "Do you need to repair Connect (y/n?:~$" You will type "y" or "n" depending on your needs. 
If "y" it will try and uninstall any current versions of Connect before installing the current version.
  
- **Tool 2: [Firmware]**
  - **Description:** Will help you update to the latest Dell Firmware. (DELL LATITUDE'S ONLY!!)
  - **Usage:** Tool will prompt you for a model number. Type only the model number and it will launch your firmware.
You can also type "ls" to get a list of supported models in this tool. 

- **Tool 3: [Intune]**
  - **Description:** Will give you a list of options to help repair a Intune's deployed device.
  - **Usage:** Type the desired command into the prompt.

- **Tool 4: [Install]**
  - **Description:** Will help you install any software it lists, directly from the web without having to look for installers.
  - **Usage:** Type the software you desire from the list above into the prompt to install it.
Use "update" to automatically update all existing software on your computer.

- **Tool 5: [SCCM]**
  - **Description:** Will give you a list of options to help repair a Microsoft System Center Configuration Manager deployed device.
  - **Usage:** Type the desired command into the prompt.

- **Commands:
  - ** Use "ver" on the first welcome screen to see the version and tool information.
  - ** Use "back" on any tool to go back a step.
  - ** Use "exit" to leave the application at anytime.

## Prerequisites

- **Operating System:**  
  - **Minimum:** Windows 10 22H2  
  - **Recommended:** Windows 11 23H2 or later
- **Permissions:** Ensure you have administrator privileges to run these tools.
- **Dependencies:**  
  The following dependencies must be installed for the batch file to function correctly:
  - `Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle`
  - `Microsoft.UI.Xaml.2.8.x64.appx`
  - `Microsoft.VCLibs.x64.14.00.Desktop.appx`

### Installing Dependencies

Follow these steps to download and install the required dependencies using PowerShell:

1. **Open PowerShell with Administrative Privileges**
   
   - Press `Win + X` and select **Windows PowerShell (Admin)** or **Terminal (Admin)**.
   - Click **Yes** if prompted by User Account Control.

2. **Run the Following Command**

   Copy and paste the entire block below into the PowerShell window and press **Enter**:

   ```powershell
   $ProgressPreference = 'SilentlyContinue'
   Write-Information "Downloading WinGet and its dependencies..."
   
   Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
   Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
   Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
   
   Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
   Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
   Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
   ```

   **Explanation of the Command:**
   
   - Sets the progress preference to silently continue to suppress progress messages.
   - Downloads the necessary packages:
     - **WinGet (Windows Package Manager)**
     - **Microsoft.UI.Xaml**
     - **Microsoft.VCLibs**
   - Installs the downloaded packages using `Add-AppxPackage`.

3. **Verify Installation**

   After the commands have executed successfully, you should see no errors in the PowerShell window. The dependencies are now installed, and you can proceed to use the batch file tools.

**Note:** Ensure you have a stable internet connection during this process, as the commands download packages from the internet.

## Installation

1. **Download:** Download the `SFISD Tech Tool (version).zip` 
2. **Extract** Extract the files to a USB Drive and ensure the `SFISD Tech Tool.lnk` file and the `script Data` folder are both saved in the same directory.
2. **Execute:** Double-click the `SFISD Tech Tool.lnk` or run it from the command prompt.

## Usage

- **Running the SFISD Tech Tool:**  
  Double-click the `SFISD Tech Tool.lnk` or run it via the command prompt with the following command:
  ```
  D:\Script Data\SFISD Tech Tool.bat
  ```

## Troubleshooting

- **Common Issues:**  
  - **Error:** "File can not be found"  
    - **Solution:** Make sure that the `SFISD Tech Tool.lnk` file and the `script Data` folder are both located on the `D:` drive.

  - **Disclaimer:**  
    - When downloading from GitHub, some files needed for the tool may be missing due to file size limitations. Please be patient while we work to resolve this issues.

- **Logs:**  
  Specify if the batch file generates logs and where they are located.

## License

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or distribute this software, either in source code form or as a compiled binary, for any purpose, commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this software dedicate any and all copyright interest in the software to the public domain. We make this dedication for the benefit of the public at large and to the detriment of our heirs and successors. We intend this dedication to be an overt act of relinquishment in perpetuity of all present and future rights to this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to https://unlicense.org.

## Contact

For further assistance or questions, please contact TXDYLAN at affiliates@txdylan.com.