Add-Type –TypeDefinition @"
    using System;
    using System.Speech.Synthesis;
    public class Voice {
        public static void Speak(string text) {
            SpeechSynthesizer synth = new SpeechSynthesizer();
            synth.Speak(text);
        }
    }
"@
$messages = @("Hello there!", "Why are you using this computer?", "Can you hear me?", "Stop looking at me.", "I'm watching you.")
while ($true) {
    Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 30)
    [Voice]::Speak($messages | Get-Random)
}
