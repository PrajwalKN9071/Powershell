#Creating the network interface
$Resourcegroup="powershell-grp"
$Location="East US"

$VnetName="app-vnet"
$SubnetName="SubnetA"


$VirtualNetwork= Get-AzVirtualNetwork -Name $VnetName -ResourceGroupName $ResourceGroup

$Subnet= Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork

$NetworkInterfaceName="app-network"

$NetworkInterface=New-AzNetworkInterface -Name $NetworkInterfaceName -ResourceGroupName $ResourceGroup -Location $Location `
-Subnet $Subnet