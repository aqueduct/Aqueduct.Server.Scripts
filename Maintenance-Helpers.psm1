function Remove-FilesOlderThan
{
    Param(
        [Parameter(Mandatory=$true)]
        [String] 
        $folderPath,        
        [Int] 
        $days = 30,        
        [Switch] 
        $recurse
    )

    $items = Get-ChildItem $folderPath -Recurse:$recurse
    $now = Get-Date
    foreach($item in $items)
    {
        $age = ($now - $item.CreationTime).Days
        $deleted = 0;
        if ($age -gt $days -and $item.PsISContainer -ne $True)
        {
            $item.Delete()
            $deleted += 1
        }
    }
    Write-Host Deleted $deleted files from $folderPath
}

export-modulemember -function Remove-FilesOlderThan