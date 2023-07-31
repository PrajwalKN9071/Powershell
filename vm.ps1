$Vmname="app-vm"
$VmSize= "Standard_DS2_v2"
$Location="East US"
$Resourcegroup="powershell-grp"

#Get-AzVMSize -Location 'East Asia'

$Credential =Get-Credential


$NetworkInterfaceName="app-network"
$NetworkInterface=Get-AzNetworkInterface -Name $NetworkInterfaceName -ResourceGroupName $ResourceGroup

$VmConfig=New-AzVMConfig -VMName $Vmname -VMSize $VmSize 

Set-AzVMOperatingSystem -VM $VmConfig -ComputerName $Vmname `
-Credential $Credential -Windows

Set-AzVMSourceImage -VM $VmConfig -PublisherName "MicrosoftWindowsServer" `
-Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest"

$Vm=Add-AzVMNetworkInterface -VM $VmConfig -Id $NetworkInterface.Id

Set-AzVMBootDiagnostic -Disable -VM $Vm

New-AzVM -ResourceGroupName $Resourcegroup -Location $Location -VM $Vm