Add-Type -TypeDefinition @"
    using System;
    using System.Windows.Forms;
    using System.Drawing;
    public class FullScreen {
        public static void Show() {
            Form form = new Form();
            form.BackColor = Color.Blue;
            form.WindowState = FormWindowState.Maximized;
            form.TopMost = true;
            form.FormBorderStyle = FormBorderStyle.None;
            Label lbl = new Label();
            lbl.Text = "A fatal system error has occurred. Restart required.";
            lbl.ForeColor = Color.White;
            lbl.Font = new Font("Arial", 20, FontStyle.Bold);
            lbl.AutoSize = true;
            lbl.Location = new Point(100, 100);
            form.Controls.Add(lbl);
            form.ShowDialog();
        }
    }
"@
[FullScreen]::Show()
