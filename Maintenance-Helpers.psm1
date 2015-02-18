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

    $items = Get-ChildItem "$folderPath" -Recurse:$recurse
    $now = Get-Date
    $deleted = 0;
    $failed = 0;

    Write-Host Found $items.Length files in $folderPath    
    
    foreach($item in $items)
    {
        $age = ($now - $item.CreationTime).Days
        if ($age -gt $days -and $item.PsISContainer -ne $true)
        {
            try
            {
                Remove-Item $item.FullName -Force -ErrorAction Stop
                $deleted += 1
            }
            catch 
            {
                $failed += 1;
            }
        }
    }
    Write-Host ----> Deleted $deleted files -ForegroundColor Green
    if ($failed -gt 0)
    { 
        Write-Host ----> Failed to delete $failed files -ForegroundColor Red
    }
}

export-modulemember -function Remove-FilesOlderThan