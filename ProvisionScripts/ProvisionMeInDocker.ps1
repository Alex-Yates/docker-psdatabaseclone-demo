<#
  THIS SCRIPT DOES NOT YET WORK

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
    [string]$destinationSqlInstance = ".",    
    [string]$imageNetworkPath = "//DESKTOP-PO8SQUD/psdatabaseclonetestimages2",
    [string]$database = "testymctestface",
    [string]$cloneName = "testymctestface_clone2"
)

$ErrorActionPreference = "Stop"

# import required powershell modules
import-module dbatools
import-module psframework
import-module psdatabaseclone

# logging
Write-Verbose "destinationSqlInstance is: $destinationSqlInstance"
Write-Verbose "imageNetworkPath is: $imageNetworkPath"
Write-Verbose "database is: $database"


# create credential
$cred = Get-Credential  

# create clone
Write-Output "Creating clone $cloneName on $destinationSqlInstance"
New-PSDCClone -SqlInstance $destinationSqlInstance -CloneName $cloneName -Database $database -LatestImage -SqlCredential $cred

<#
# Detach the clone
Write-Output "Detatching database $cloneName on $destinationSqlInstance"
$sql = "master.dbo.sp_detach_db @dbname = N'$cloneName';"
Invoke-Sqlcmd -ServerInstance $destinationSqlInstance -Query $sql
#>

# spin up container with clone files location
Write-Output "Spinning up a container"
docker run -d -p 15799:1433 `
--env ACCEPT_EULA=Y --env SA_PASSWORD=Password1122 `
-v C:\sqlserver\clone:/opt/sqlserver `
--name testcontainer2 `
mcr.microsoft.com/mssql/server

<#
# reattach the database
Write-Output "Attaching cloned database inside container"
$fileStructure = New-Object System.Collections.Specialized.StringCollection
    $fileStructure.Add('/opt/sqlserver/testdatabase_clone_tsCzJ/data/testdatabase.mdf')
    $filestructure.Add('/opt/sqlserver/testdatabase_clone_tsCzJ/log/testdatabase_log.ldf')

Mount-DbaDatabase -SqlInstance "localhost,15789" `
    -Database $cloneName -SqlCredential $Cred `
        -FileStructure $fileStructure
#>