#Create network security group
$Resourcegroup="powershell-grp"
$Location="East US"
$NetworkSecurityGroupName="app-nsg"

$SecurityRule1=New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Description "Allow-RDP" `
-Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
-SourceAddressPrefix * -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 3389


$NetworkSecurityGroup=New-AzNetworkSecurityGroup -Name $NetworkSecurityGroupName -ResourceGroupName $Resourcegroup `
-Location $Location -SecurityRules $SecurityRule1


$VnetName="app-vnet"
$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"


$VirtualNetwork= Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $ResourceGroup


Set-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork `
-NetworkSecurityGroup $NetworkSecurityGroup -AddressPrefix $SubnetAddressSpace

$VirtualNetwork|Set-AzVirtualNetwork