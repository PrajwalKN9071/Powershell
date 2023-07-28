#Resource Group
$Resource_group_name = "Rg1"
$Location_name ="westus"
Remove-AzResourceGroup -Name $Resource_group_name


$Resourcegroup=New-AzResourceGroup -Name $Resource_group_name -Location $Location_name
'Provisioning state'+$Resourcegroup.ProvisioningState

$Resourcegroup

$Newlycreatedrg=Get-AzResourceGroup -Name $Resource_group_name

$Newlycreatedrg.ResourceGroupName



$Allrg=Get-AzResourceGroup

foreach($group in $Allrg){
$rgnames=$rgnames+" "+ $group.ResourceGroupName
}






