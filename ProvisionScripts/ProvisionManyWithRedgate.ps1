params(
    $totalClones = 10
)

$image = Get-SqlCloneImage -Name 'StackOverflow2010_Masked'
 
$ClonePrefix = 'PruskiReallySucksTimes'
 
$elapsed = [System.Diagnostics.Stopwatch]::StartNew()
"Started at {0}" -f $(get-date)
 
"OK, going to create {0} clones" -f $Count
 
for ($i=0;$i -lt $totalClones;$i++)
{
    $image | New-SqlClone -Name $ClonePrefix$i -Location $sqlServerInstance | Wait-SqlCloneOperation
  "Created clone {0}" -f $i;  
};
 
"Total Elapsed Time: {0}" -f $($elapsed.Elapsed.ToString())