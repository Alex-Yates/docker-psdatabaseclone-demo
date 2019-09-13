Connect-SqlClone -ServerUrl 'http://win2012r2:14145'
$adImage = Get-SqlCloneImage -Name 'AdventureWorks2016'
$wwiImage = Get-SqlCloneImage -Name 'WorldWideImporters'
$soImage = Get-SqlCloneImage -Name 'StackOverflow2010_Masked'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName WIN2012R2 -InstanceName DEV

Write-Output "Building clones"

New-SqlClone -Name 'PruskiSucks_AdventureWorks2016' -Location $SqlServerInstance -Image $adImage
New-SqlClone -Name 'PruskiSucks_WorldWideImporters' -Location $SqlServerInstance -Image $wwiImage
New-SqlClone -Name 'PruskiSucks_StackOverflow2010' -Location $SqlServerInstance -Image $soImage

Write-Output "Cloning complete"
