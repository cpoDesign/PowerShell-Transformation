function ApplyConfigTransformation($src,$xdt,$dst)
{
    $dllPath = "$PSScriptRoot\Microsoft.Web.XmlTransform.dll"
    Add-Type -Path $dllPath
    
    try 
    {
        Write-Host $src
        $doc = New-Object Microsoft.Web.XmlTransform.XmlTransformableDocument
        $doc.PreserveWhiteSpace = $true
        Write-Host 'Loading $src'
        $doc.Load($src)

        Write-Host 'Using xml transformation'
        $trn = New-Object Microsoft.Web.XmlTransform.XmlTransformation($xdt)
    
        Write-Host '$trn.Apply called'
        if ($trn.Apply($doc))
        {
            $doc.Save($dst)
            Write-Output "Output file: $dst"
        }
        else
        {
            throw "Transformation failed"
        }
    }
    catch
    {
        Write-Output $Error[0].Exception
    } 
}