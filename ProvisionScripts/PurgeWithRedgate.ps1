Connect-SqlClone -ServerUrl 'http://win2012r2:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName WIN2012R2 -InstanceName DEV

$adCloneToDelete = Get-SqlClone -Name 'PruskiSucks_AdventureWorks2016' -Location $SqlServerInstance
$wwiCloneToDelete = Get-SqlClone -Name 'PruskiSucks_WorldWideImporters' -Location $SqlServerInstance
$soCloneToDelete = Get-SqlClone -Name 'PruskiSucks_StackOverflow2010' -Location $SqlServerInstance

Write-Output "Purging clones"

Remove-SqlClone -Clone $adCloneToDelete
Remove-SqlClone -Clone $wwiCloneToDelete
Remove-SqlClone -Clone $soCloneToDelete

Write-Output "All gone"
