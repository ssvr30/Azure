#ResourceGroup

$rg = "SSVRVnet"
$Location = "EastUS"

$VNETName = "VSCode-VNet-PS"
$VNETAddressSpace = "10.0.0.0/23"

$subetAName = "Web"
$subnetAAddressPrefix = "10.0.0.0/24"

$subnetBName = "App"
$subnetBAddressSpace = "10.0.1.0/24"

#Create Subnet A
$subnets = New-AzVirtualNetworkSubnetConfig -Name $subetAName -AddressPrefix $subnetAAddressPrefix


#Build the VNet with the subnet range and location, also to add the Subnet A
$vnet = New-AzVirtualNetwork -Name $VNETName -ResourceGroupName $rg -Location $Location
-AddressPrefix $VNETAddressSpace -Subnet $subnets

# To add SubnetB to the Vnet
Add-AzVirtualNetworkSubnetConfig -VirtualNetwork $vnet -Name $subnetBName -AddressPrefix $subnetBAddressSpace

#Save set the virtualnetwork
Set-AzVirtualNetwork -VirtualNetwork $vnet


