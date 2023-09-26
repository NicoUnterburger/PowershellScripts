function initializeGUI([string]$title) {
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")                                      # lädt alle nötigen Elemte für die GUI
    [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    $objForm = New-Object System.Windows.Forms.Form
    $objForm.Text = $title
    $objForm.Size = New-Object System.Drawing.Size(360,285)
    $objForm.StartPosition = "CenterScreen"
    $objForm.Backcolor = "white"
    return($objForm)
}

$title = "Powershell GUI APP"

$objForm = initializeGUI($title)
[void] $objForm.ShowDialog()
