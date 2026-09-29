#Variables definition
$url1 = "http://www.examplemalwaredomain.com"
$url2 = "http://example.com"
$url3 = "http://poker.com"
$url4 = "http://examplebotnetdomain.com"
$url5 = "http://www.internetbadguys.com"
$url6 = "http://bit.ly/xdrdemo05"
$url7 = "http://bit.ly/xdrdemo03"
$url8 = "http://bit.ly/xdrdemo04"


$dlurl = "http://184.0.146.139/xdr/Work_kit.zip"
$dst = "C:\Users\Student\Desktop\XDR Files\Work_kit.zip"
#Write-Host "Invoke-WebRequest -Uri $dlurl -OutFile $dst"
Invoke-WebRequest -Uri "$dlurl" -OutFile "$dst"

$Destination = "\\podx-pc3\Users\Student\Desktop\Mal_Tools"
$Source= "C:\Users\Student\Desktop\XDR Files\Work_Kit.zip"
Copy-Item -Path $Source -Destination $Destination -Force

$Destination = "\\podx-pc2\Users\Student\Desktop\Mal_Tools"
Copy-Item -Path $Source -Destination $Destination -Force



Send-MailMessage -SmtpServer esa.xdrlab.loc -Port 25 -From bruno@xdrlab.loc -To student@xdrlab.loc -Subject "Bonjorno!" -Body "Good to have you on board! Check our new domain: https://example.com"


function Random-Number {
    Get-Random -Minimum $args[0] -Maximum $args[1];
}

Function Ready {
    $count = 0
    while($ie.ReadyState -ne 4)  {
        Start-Sleep -m 200;
        Write-Host "I'm ready : $count" + $ie.ReadyState
        $count++;
        If ($count -eq 100) {
            Get-Process | ? { $_.ProcessName -eq 'iexplore' } | Stop-Process
            Get-Process | ? { $_.ProcessName -eq 'werfault' } | Stop-Process
            [System.GC]::Collect() 
            return $false
            break
        }
    } return $true
}

Function IE {
    $navOpenInBackgroundTab = 0x1000; #Open the resource or file in a new background tab; the currently active window and/or tab remains open on top.
    $ie = New-Object -COMObject internetexplorer.application;
    $ie.visible = $true;
    return $ie
}

$ie = IE

While($true)
{
    $result = Random-Number 2 10
    Write-Host "sleep pendant $result"
    #Start-Sleep $result

    $result = Random-Number 0 8

    If ($result -ne "0") {
        #Internet Explorer
        $SleepTime = Random-Number 2 5
        Write-Host "Internet Explorer, nous allons vers l'url : $result"
        
    switch ($result) {
       "1"  {
            $ie.navigate($url1); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE } 
            break
            }
       "2"  {
            $ie.navigate($url2); #main tab link
            #$ie.navigate($url5,$navOpenInBackgroundTab); #secondary tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100}; 
            if(!(Ready $ie)) { $ie = IE }
            break
            }
       "3"   {
            $ie.navigate($url3); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE }
            break
             }
       "4" {
            $ie.navigate($url4); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE }
            break
            }
       "5" {
            $ie.navigate($url5); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE }
            break
            }
       "6" {
            $ie.navigate($url6); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE }
            break
            }
       "7" {
            $ie.navigate($url7); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE }
            break
            }
       "8" {
            $ie.navigate($url8); #main tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100};
            if(!(Ready $ie)) { $ie = IE }
            break
            }
   default {        
            $ie.navigate($url1); #main tab link
            if(!(Ready $ie)) { $ie = IE }
            #$ie.navigate($url2,$navOpenInBackgroundTab); #secondary tab link
            #$ie.navigate($url3,$navOpenInBackgroundTab); #secondary tab link
            #while($ie.ReadyState -ne 4) {start-sleep -m 100}; 
            break
            }
    }


        Write-Host "sleep during $SleepTime"
        Start-Sleep $SleepTime
    } else {
        $random = Random-Number 1 8

       switch ($random) {
       "1"  {
            Write-Host "URL1"
                $dlurl = "http://184.0.146.139/xdr/Work_kit.zip" 
            } 
       "2"  {
            Write-Host "URL2"
            $dlurl = "https://bit.ly/xdrdemo05"
            }
       "3" {
            Write-Host "URL3"
            $dlurl = "http://bit.ly/xdrdemo04"
            } 
       "4" {
            Write-Host "URL4"
                $dlurl = "http://184.0.146.139/xdr/Work_kit.zip" 
            } 
       "5" {
            Write-Host "URL5"
            $dlurl = "http://bit.ly/xdrdemo03"
            } 
       "6" {
            Write-Host "URL6"
            $dlurl = "https://ssl-proxy.opendns /download/eicar.com"
            }
       "7" {
            Write-Host "URL7"
            $durl = "http://proxy.opendnstest.com/download/AMP_TEST_FILE.txt"
            }
       default { 
            Write-Host "Default"nnnnnnnnnn
            $dlurl = "https://bit.ly/xdrdemo02"
            }
        }
        $dst = "C:\Windows\Temp\TEST"
		[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Write-Host "Invoke-WebRequest -Uri $dlurl -OutFile $dst"
        Invoke-WebRequest -Uri "$dlurl" -OutFile "$dst"
        Remove-Item "$dst"
        Start-Sleep 4
    }
}
