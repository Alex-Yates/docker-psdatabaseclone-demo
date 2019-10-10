Connect-SqlClone -ServerUrl 'http://ec2amaz-hduull0:14145'
$adImage = Get-SqlCloneImage -Name 'AdventureWorks2017'
# $wwiImage = Get-SqlCloneImage -Name 'WorldWideImporters'
$soImage = Get-SqlCloneImage -Name 'StackOverflow'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName EC2AMAZ-HDUULL0 -InstanceName ''

Write-Output "Building clones"

New-SqlClone -Name 'AdventureWorks2017' -Location $SqlServerInstance -Image $adImage
# New-SqlClone -Name 'WorldWideImporters' -Location $SqlServerInstance -Image $wwiImage
New-SqlClone -Name 'StackOverflow2010' -Location $SqlServerInstance -Image $soImage

Write-Output "Cloning complete"
