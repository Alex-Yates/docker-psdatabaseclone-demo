param (
    $totalClones = 10
)

#Connecting to SQL Clone
Connect-SqlClone -ServerUrl 'http://ec2amaz-hduull0:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName EC2AMAZ-HDUULL0 -InstanceName ''
$image = Get-SqlCloneImage -Name 'StackOverflow'

#Giving my clones a name
$ClonePrefix = 'PruskiSmells_'
 
#Building the clones
$elapsed = [System.Diagnostics.Stopwatch]::StartNew()
"Started at {0}" -f $(get-date)
 
"OK, going to create $totalClones clones" -f $Count
 
for ($i=0;$i -lt $totalClones;$i++)
{
    $image | New-SqlClone -Name $ClonePrefix$i -Location $sqlServerInstance | Wait-SqlCloneOperation
  "Created clone {0}" -f $i;  
};
 
"Total Elapsed Time: {0}" -f $($elapsed.Elapsed.ToString())