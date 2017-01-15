
. .XmlDocTransform.ps1

$src = "$PSScriptRoot\web.config"
$xdt = "$PSScriptRoot\Web.Release.config"
$dst = "$PSScriptRoot\Web1.config"

ApplyConfigTransformation $src $xdt $dst
