Connect-SqlClone -ServerUrl 'http://ec2amaz-hduull0:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName EC2AMAZ-HDUULL0 -InstanceName ''

$adCloneToDelete = Get-SqlClone -Name 'AdventureWorks2017' -Location $SqlServerInstance
# $wwiCloneToDelete = Get-SqlClone -Name 'PruskiSucks_WorldWideImporters' -Location $SqlServerInstance
$soCloneToDelete = Get-SqlClone -Name 'StackOverflow2010' -Location $SqlServerInstance

Write-Output "Purging clones"

Remove-SqlClone -Clone $adCloneToDelete
# Remove-SqlClone -Clone $wwiCloneToDelete
Remove-SqlClone -Clone $soCloneToDelete

Write-Output "All gone"
