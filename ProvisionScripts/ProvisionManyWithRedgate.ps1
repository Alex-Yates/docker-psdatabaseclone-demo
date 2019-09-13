param (
    $totalClones = 10
)

#Connecting to SQL Clone
Connect-SqlClone -ServerUrl 'http://win2012r2:14145'
$SqlServerInstance = Get-SqlCloneSqlServerInstance -MachineName WIN2012R2 -InstanceName DEV
$image = Get-SqlCloneImage -Name 'StackOverflow2010_Masked'

#Giving my clones a name
$ClonePrefix = 'PruskiReallySucksTimes'
 
#Building the clones
$elapsed = [System.Diagnostics.Stopwatch]::StartNew()
"Started at {0}" -f $(get-date)
 
"OK, going to create {0} clones" -f $Count
 
for ($i=0;$i -lt $totalClones;$i++)
{
    $image | New-SqlClone -Name $ClonePrefix$i -Location $sqlServerInstance | Wait-SqlCloneOperation
  "Created clone {0}" -f $i;  
};
 
"Total Elapsed Time: {0}" -f $($elapsed.Elapsed.ToString())