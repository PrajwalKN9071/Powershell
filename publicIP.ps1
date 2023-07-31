#Public IP creation

$PublicIPAdressName="app-IP"
$Resourcegroup="powershell-grp"
$Location="East US"


$PublicIPAdress=New-AzPublicIpAddress -Name $PublicIPAdressName -ResourceGroupName $Resourcegroup -Location $Location `
-Sku Standard -AllocationMethod Static

$NetworkInterfaceName="app-network"

$NetworkInterface=Get-AzNetworkInterface -Name $NetworkInterfaceName -ResourceGroupName $Resourcegroup

$IpConfig= Get-AzNetworkInterfaceIpConfig -NetworkInterface $NetworkInterface

$NetworkInterface|Set-AzNetworkInterfaceIpConfig -PublicIpAddress $PublicIPAdress `
-Name $IpConfig.Name

$NetworkInterface|Set-AzNetworkInterface