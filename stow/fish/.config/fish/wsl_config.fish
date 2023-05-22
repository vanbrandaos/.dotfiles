# Windows aliases
export DISPLAY=$(ip route|awk '/^default/{print $3}'):0.0

alias devdirs='postgres-up && cd ~/dev/servers/eclipse/tomcat
cmd.exe /c "wt.exe" -w 0 -d ~/dev/soma/soma-container/ --title java --suppressApplicationTitle\; split-pane -s .5 -d ~/dev/soma/soma-container/ --title js --suppressApplicationTitle move-focus left 
cmd.exe /c "wt.exe" -w 0 nt --startingDirectory, -d ~/dev/soma/soma-container --title soma-config --suppressApplicationTitle\; split-pane -s .3 -d ~/dev/soma/soma-container/built-config/soma-config move-focus left --title built-config --suppressApplicationTitle \; focus-tab -t 1
clear'

alias bye='powershell.exe /c "wsl --shutdown"
powershell.exe /c "taskkill /IMF WindowsTerminal.exe"'

alias testwsl='echo teste'