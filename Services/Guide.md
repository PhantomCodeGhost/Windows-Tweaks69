> Here is how!
> 
> 1. Open Powershell
>    
>    * Press Win & X buttons on keyboard
>    * Then you will see the Terminal (Admin) or Powershell (Admin)
>    * Open it
> 2. Set the Execution Policy:
>    Run this command in an elevated PowerShell window (as Administrator):
>    ```powershell
>    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
>    ```
> 3. Drag and Drop the Script:
>    
>    * Open the folder where your `disableServices.ps1` script is located (e.g., the Desktop).
>    * Reopen Powershell as Administrator
>    * Drag the script file into the PowerShell window.
>    * This will automatically populate the full path of the script.
>    * Press **Enter** to execute the script.
> 4. (For Security) Revert the Execution Policy:
>    It's a good security practice to revert the policy after the program:
>    ```powershell
>    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
>    ```
