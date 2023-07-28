#Storage account


#creating a storage account
$AccountName="storage123456778787"
$AccountKind="StorageV2"
$AccountSKU="Standard_LRS"
$ResourceGroupName="powershell-grp"
$Location="North Europe"
$ContainerName = 'demo'
#Resource group
if(Get-AzResourceGroup -Name $ResourceGroupName){
'Resource group is already exit'
}
else
{
#create rg
'Creating the resource group'
New-AzResourceGroup -Name $ResourceGroupName -Location $Location
}

#Storage account
if(Get-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName){
'Storage account is already available'
}
else
{
#create storage account
$StorageAccount= New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName `
-Location $Location -Kind $AccountKind -SkuName $AccountSKU
}


#Container

if(Get-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context){
'container is already available'
}
else
{

#Create blob or container inside storage account
'Creating the container'
New-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context`
-Permission Blob

}

#create a object which consists of location of our file and name to be created for the blob
$BlobObject=@{
FileLocation="C:\Users\YJ624CM\Desktop\10-07-2023\Case creation\Case Number Updation Queries.sql"
ObjectName="query.txt"
}
if(Get-AzStorageBlobContent -Container $ContainerName -Blob "chat.txt" -Context $StorageAccount.Context){
'File already exist'}

else
{
#Uploading file to blob
Set-AzStorageBlobContent -Context $StorageAccount.Context -Container $ContainerName `
-File $BlobObject['FileLocation'] -Blob $BlobObject['ObjectName']
}
