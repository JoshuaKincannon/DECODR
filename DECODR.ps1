#DECODR
#Written by: Joshua Kincannon
#MAKE SURE YOU ENTER YOUR OWN API KEY

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#SELECTING
$Magic = New-Object System.Management.Automation.Host.ChoiceDescription "&Magic","Description."
$Bake = New-Object System.Management.Automation.Host.ChoiceDescription "&Bake","Description."
$abort = New-Object System.Management.Automation.Host.ChoiceDescription "&Cancel","Description."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($Magic, $Bake, $abort)
$heading = ""
$mess = "Which would you like to use?"
$rslt = $host.ui.PromptForChoice($heading, $mess, $options, 1)
switch ($rslt) {
0{
	
#MAGIC 
Write-Host "Welcome to DECODR" -ForegroundColor Green
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Magic'
$testform.Size = New-Object System.Drawing.Size(400,300)
$testform.StartPosition = 'CenterScreen'
$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(85,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Ok'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)
$testform.CancelButton = $cb
$testform.Controls.Add($cb)
$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(270,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'close'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)
$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(20,40)
$lb.Size = New-Object System.Drawing.Size(240,20)
$lb.Text = 'Enter the encoded message:'
$testform.Controls.Add($lb)
$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(40,80)
$tb.Size = New-Object System.Drawing.Size(240,20)
$testform.Controls.Add($tb)
$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
{
$y = $tb.Text
}

$var = '{"input":'+'"' + $y + '"'+ "}" 
$key = "" #ENTER API KEY BETWEEN QUOTES
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("x-api-key", $key)
$headers.Add("Content-Type", "application/json")
$response = Invoke-RestMethod -Uri 'https://prod.apifor.io/cyberchef/magic' -Method POST -Headers $headers -ContentType 'application/json' -Body $var
$response 


}
1{
#ASKING FOR BAKE INPUT
Write-Host "Welcome to Cyberchef API" -ForegroundColor Green
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Bake'
$testform.Size = New-Object System.Drawing.Size(400,300)
$testform.StartPosition = 'CenterScreen'
$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(85,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Ok'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)
$testform.CancelButton = $cb
$testform.Controls.Add($cb)
$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(270,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'close'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)
$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(20,40)
$lb.Size = New-Object System.Drawing.Size(240,20)
$lb.Text = 'Enter input for bake:'
$testform.Controls.Add($lb)
$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(40,80)
$tb.Size = New-Object System.Drawing.Size(240,20)
$testform.Controls.Add($tb)
$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
{
$y = $tb.Text
}

#ASKING FOR RECIPE
$testform = New-Object System.Windows.Forms.Form
$testform.Text = 'Magic'
$testform.Size = New-Object System.Drawing.Size(400,300)
$testform.StartPosition = 'CenterScreen'
$okb = New-Object System.Windows.Forms.Button
$okb.Location = New-Object System.Drawing.Point(85,130)
$okb.Size = New-Object System.Drawing.Size(75,25)
$okb.Text = 'Ok'
$okb.DialogResult = [System.Windows.Forms.DialogResult]::OK
$testform.AcceptButton = $okb
$testform.Controls.Add($okb)
$testform.CancelButton = $cb
$testform.Controls.Add($cb)
$test = New-Object System.Windows.Forms.Button
$test.Location = New-Object System.Drawing.Point(270,130)
$test.Size = New-Object System.Drawing.Size(75,25)
$test.Text = 'close'
$test.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$testform.AcceptButton = $test
$testform.Controls.Add($test)
$lb = New-Object System.Windows.Forms.Label
$lb.Location = New-Object System.Drawing.Point(20,40)
$lb.Size = New-Object System.Drawing.Size(240,20)
$lb.Text = 'Enter recipe'
$testform.Controls.Add($lb)
$tb = New-Object System.Windows.Forms.TextBox
$tb.Location = New-Object System.Drawing.Point(40,80)
$tb.Size = New-Object System.Drawing.Size(240,20)
$testform.Controls.Add($tb)
$testform.Topmost = $true
$testform.Add_Shown({$tb.Select()})
$rs = $testform.ShowDialog()
if ($rs -eq [System.Windows.Forms.DialogResult]::OK)
{
$x = $tb.Text
}

$var1 = '{"input":'+'"' + $y + '"'+ ","+'"recipe":'+'"' + $x + '"'+ "}" 
$key = "" #ENTER API KEY BETWEEN QUOTES
$headers=@{}
$headers.Add("Accept", "application/json")
$headers.Add("x-api-key", $key)
$headers.Add("Content-Type", "application/json")
$response1 = Invoke-RestMethod -Uri 'https://prod.apifor.io/cyberchef/bake' -Method POST -Headers $headers -ContentType 'application/json' -Body $var1
$response1

}
2{
Write-Host "Goodbye" -ForegroundColor Red


}
}







