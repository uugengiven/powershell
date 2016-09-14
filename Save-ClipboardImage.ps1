Add-Type -AssemblyName system.drawing
Add-Type -AssemblyName system.windows.forms

$jpegCodec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | 
            Where-Object { $_.FormatDescription -eq "JPEG" }
			
$encodingParams = New-Object Drawing.Imaging.EncoderParameters  
$encodingParams.Param[0] = New-Object Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]100)  


$baseDirectory = "$pwd\myimages" #your directory

$fileName = "$baseDirectory\something.jpg" #come up with something better here, maybe an auto number using test-path?

$image = [Windows.Forms.Clipboard]::GetImage()
$image.save($fileName, $jpegCodec, $encodingParams)
