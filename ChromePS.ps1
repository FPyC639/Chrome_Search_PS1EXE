# Load the necessary assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Google GUI'
$form.Size = New-Object System.Drawing.Size(600,600)  # Increased form width to fit controls
$form.StartPosition = 'CenterScreen'

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Enter your command:"
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($label)

# Create a text box for input for Chrome
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

# Create a text box for input for msedge
$textBoxE = New-Object System.Windows.Forms.TextBox
$textBoxE.Location = New-Object System.Drawing.Point(10,170)
$textBoxE.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBoxE)

# Create another text box for Bing search input
$textBox1E = New-Object System.Windows.Forms.TextBox
$textBox1E.Location = New-Object System.Drawing.Point(310,170)
$textBox1E.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox1E)

# Create another text box for Bing search input
$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(310,40)
$textBox1.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox1)


#Create a submit button for msedge

$submitButtonE = New-Object System.Windows.Forms.Button
$submitButtonE.Location = New-Object System.Drawing.Point(10,200)
$submitButtonE.Size = New-Object System.Drawing.Size(75,50)
$submitButtonE.Text = 'Open Edge'
$form.Controls.Add($submitButtonE)

# Create a submit button for Chrome
$submitButton = New-Object System.Windows.Forms.Button
$submitButton.Location = New-Object System.Drawing.Point(10,70)
$submitButton.Size = New-Object System.Drawing.Size(75,50)
$submitButton.Text = 'Open Chrome'
$form.Controls.Add($submitButton)

# Create another submit button for Bing search in msedge
$submitButton1E = New-Object System.Windows.Forms.Button
$submitButton1E.Location = New-Object System.Drawing.Point(310,200)
$submitButton1E.Size = New-Object System.Drawing.Size(100,50)
$submitButton1E.Text = 'Search Bing in Edge'
$form.Controls.Add($submitButton1E)


# Create another submit button for Bing search in Chrome
$submitButton1 = New-Object System.Windows.Forms.Button
$submitButton1.Location = New-Object System.Drawing.Point(310,70)
$submitButton1.Size = New-Object System.Drawing.Size(100,50)
$submitButton1.Text = 'Search Bing in Chrome'
$form.Controls.Add($submitButton1)

# Action for msedge button click
$submitButtonE.Add_Click({
    try{
        Start-Process "msedge.exe" $textBoxE.Text
    } catch{
        [System.Windows.Forms.MessageBox]::Show("Error executing command: $_", "Error")
    }
    # Clear the text box after command execution
    $textBoxE.Text = ''
})

# Action for Chrome button click
$submitButton.Add_Click({
    try {
        # Execute the command from the text box to open Chrome
        Start-Process "chrome.exe" $textBox.Text
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error executing command: $_", "Error")
    }
    # Clear the text box after command execution
    $textBox.Text = ''
})

# Action for Bing Search button Click using Edge
$submitButton1E.Add_Click({
    try {
        $query = $textBox1E.Text
        # Execute the command from the text box to perform Bing search
        Start-Process "msedge.exe" "https://www.bing.com/search?q=`"$query`""
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error executing command: $_", "Error")
    }
    # Clear the text box after command execution
    $textBox1E.Text = ''
})

# Action for Bing Search button click using Chrome
$submitButton1.Add_Click({
    try {
        $query = $textBox1.Text
        # Execute the command from the text box to perform Bing search
        Start-Process "chrome.exe" "https://www.bing.com/search?q=`"$query`""
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error executing command: $_", "Error")
    }
    # Clear the text box after command execution
    $textBox1.Text = ''
})

# Show the form
$form.ShowDialog()
