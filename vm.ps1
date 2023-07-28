#Creating VM
$Resourcegroup="powershell-grp"
$Location="East US"

$VnetName="app-vnet"
$VnetAddressSpace="10.0.0.0/16"

$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"


#Create subnet
$SubnetA=New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressSpace 

#Create Vnet
$app_vnet=New-AzVirtualNetwork -Name $VnetName -ResourceGroupName $Resourcegroup -Location $Location `
-AddressPrefix $VnetAddressSpace -Subnet $SubnetA 