<#
  This script provisions the source image. Expect it to take approximately as long as a backup restore.
  Under most circumstances your source image will be created as follows:
  1. Restore the latest production backup into a staging area, within your production domain/security perimeter (since it contains prod data)
  2. Run an appropriate data masking/anonymisation process such that the data is safe, legal and ethical to share with developers.
  3. Run this script to restore the masked copy of the database to a fileshare within the dev domain, that developers have access to.
  4. Purge old images, otherwise you'll very quickly use up all the space on your fileshare.  
  You should probably schedule this to run on a scheduled basis. For example, overnight on the last night of your sprint.
  This will force your developers to treat their local dev databases as temporary work environments and to commit all their work to source control.
  This will also promote the good practices such as re-reprovisioning their dev environments at the start of each new sprint/new piece of work.
#>

param ( 
    [string]$imageNetworkPath = "\\Windows10OrWindowsServer2016Box\C$\clones",
    [string]$maxImageAgeInDays = "21"
)

$ErrorActionPreference = "Stop"

# import required powershell modules
import-module dbatools
import-module psframework
import-module psdatabaseclone

# logging
Write-Verbose "imageNetworkPath is: $imageNetworkPath"
Write-Verbose "maxImageAgeInDays is: $maxImageAgeInDays"

# deleting old images
Write-Warning "Purging old images feature is not yet implemented. Please clean up images older than $maxImageAgeInDays days old manually."