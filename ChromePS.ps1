# Load the necessary assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms

# Create the main form
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Google GUI'
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = 'CenterScreen'

# Create a label
$label = New-Object System.Windows.Forms.Label
$label.Text = "Enter your command:"
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$form.Controls.Add($label)

# Create a text box for input
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

# Create a submit button
$submitButton = New-Object System.Windows.Forms.Button
$submitButton.Location = New-Object System.Drawing.Point(10,70)
$submitButton.Size = New-Object System.Drawing.Size(75,23)
$submitButton.Text = 'Submit'
$form.Controls.Add($submitButton)

# Action for submit button click
$submitButton.Add_Click({
    try {
        # Execute the command from the text box
        & "C:\Program Files\Google\Chrome\Application\chrome.exe" $textBox.Text
    } catch {
        [System.Windows.Forms.MessageBox]::Show("Error executing command: $_", "Error")
    }
    # Clear the text box after command execution
    $textBox.Text = ''
})

# Add Form Closing event handler


# Show the form
$form.ShowDialog()
