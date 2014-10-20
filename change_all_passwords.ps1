Import-Module ActiveDirectory

# Set the default password
# In the future, we'll want to generate a random password for each user, so this code will change
$password = ConvertTo-SecureString -AsPlainText “AwesomeP@ssw0rd” -Force 
 
# Get the list of accounts from the file on file
# List the user names one per line
$users = Get-Content -Path c:\MyScripts\UserList.txt


# This function will change all the passwords in a list of $users
# The code in this function is from http://anandthearchitect.com/2014/02/27/active-directory-bulk-user-password-reset-by-powershell/
function ResetPasswords ($users)
{
       ForEach ($user in $users) 
    {
        # Set the default password for the current account
        Get-ADUser $user | Set-ADAccountPassword -NewPassword $password -Reset
    
        #If you need to set the property “Change password at next logon”, 
        #leave the next alone. If not, comment the next line
        Get-ADUser $user | Set-AdUser -ChangePasswordAtLogon $true
    
        Write-Host “Password has been reset for the user: $user”
    }
}

# This funciton will retrieve
function GetUserList ()
{
    
}