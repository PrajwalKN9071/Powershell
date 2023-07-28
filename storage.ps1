#Storage account


#creating a storage account
$AccountName="storage123456778787"
$AccountKind="StorageV2"
$AccountSKU="Standard_LRS"
$ResourceGroupName="powershell-grp"
$Location="North Europe"
#create rg
New-AzResourceGroup -Name $ResourceGroupName -Location $Location

#create storage account
$StorageAccount= New-AzStorageAccount -ResourceGroupName $ResourceGroupName -Name $AccountName `
-Location $Location -Kind $AccountKind -SkuName $AccountSKU

$StorageAccount.StorageAccountName

#Create blob or container inside storage account
$ContainerName = 'demo'
New-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context`
-Permission Blob

#create a pbject which consists of location of our file and name to be created for the blob
$BlobObject=@{
FileLocation="C:\Users\YJ624CM\Desktop\10-07-2023\Case creation\Case Number Updation Queries.sql"
ObjectName="query.txt"
}
#Uploading file to blob
Set-AzStorageBlobContent -Context $StorageAccount.Context -Container $ContainerName `
-File $BlobObject['FileLocation'] -Blob $BlobObject['ObjectName']