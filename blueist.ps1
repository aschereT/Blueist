$list32 = @{2005='http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE';2008='https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe';2010='http://download.microsoft.com/download/C/6/D/C6D0FD4E-9E53-4897-9B91-836EBA2AACD3/vcredist_x86.exe';2012='http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe';2013='http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe';2015='https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x86.exe';2017='https://download.microsoft.com/download/e/6/6/e66c5871-7afe-4640-a454-786eabe8aae8/vc_redist.x86.exe';}
$list64 = @{2005='http://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.exe';2008='https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe';2010='https://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe';2012='http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe';2013='http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe';2015='https://download.microsoft.com/download/6/A/A/6AA4EDFF-645B-48C5-81CC-ED5963AEAD48/vc_redist.x64.exe';2017='https://download.microsoft.com/download/7/2/5/72572684-052f-4aa9-9170-9d40813a87be/vc_redist.x64.exe';
}

#Thanks to esha at:
#https://stackoverflow.com/questions/25407634/check-processor-architecture-and-proceed-with-if-statement
function Check-Arch {
    $os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match '(x64)'

    if ($os_type -eq "True")
    {
        return 64
    }
    else
    {
        $os_type = (Get-WmiObject -Class Win32_ComputerSystem).SystemType -match '(x86)'

        if ($os_type -eq "True")
        {
            return 32
        }
    }
    return 0
}

function Download-EXE ($name, $url) {
    Write-Host $url
    return
}

function main {
    $arch = Check-Arch
    if ($arch -eq 64) {
        foreach ($red in $list64.Keys) {
            Write-Host $list64.$red
            $file = Download-EXE('64' + $red, $list64.$red)
        }
    }
    elseif ($arch -eq 32) {
        foreach ($red in $list32.Keys) {
            $file = Download-EXE('32' + $red, $list32.$red)
        }
    }
    else {
        Write-Error -Message "Architecture not supported!"
    }
    
}

main