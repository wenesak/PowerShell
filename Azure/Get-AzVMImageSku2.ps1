#requires -Module Az

# Please connect to Azure using Connect-AzAccount 

# Get the complete list of Azure service locations
Get-AzLocation

<#
Get-AzLocation | Where-Object -FilterScript {$_.Location -match 'india'}

Location    : southindia
DisplayName : South India
Providers   : {Microsoft.Batch, Microsoft.ClassicCompute, Microsoft.ClassicNetwork, Microsoft.ClassicStorage...}

Location    : centralindia
DisplayName : Central India
Providers   : {Microsoft.Automation, Microsoft.Batch, Microsoft.ClassicCompute, Microsoft.ClassicNetwork...}

Location    : westindia
DisplayName : West India
Providers   : {Microsoft.ClassicCompute, Microsoft.ClassicNetwork, Microsoft.ClassicStorage, Microsoft.Compute...}
#>

# Select Location
[string] $Location = 'South India'

# Get the complete list of VM Image publishers
Get-AzVMImagePublisher

<#
Get-AzVMImagePublisher -Location "South India" | Where-Object -FilterScript {$_.PublisherName -in ('MicrosoftWindowsServer','Canonical')}

PublisherName          Location   Id
-------------          --------   --
Canonical              SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical
MicrosoftWindowsServer SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/MicrosoftWindowsServer
#>

# Select Publisher
[string] $Publisher = 'Canonical'

# Get the list of offering from the publisher with in the location
Get-AzVMImageOffer -Location $Location -PublisherName $Publisher

<#
Get-AzVMImageOffer -Location $Location -PublisherName $Publisher | Format-List *

Offer        PublisherName Location   Id
-----        ------------- --------   --
UbuntuServer Canonical     SouthIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/VMImage/Offers/Ubun...
Ubuntu_Core  Canonical     SouthIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/VMImage/Offers/Ubun...
#>

# Select the offering
[string] $Offer = 'UbuntuServer'

# Get the list of image skus available in the given location from the given publisher with the given offerings
Get-AzVMImageSku -Location $Location -PublisherName $Publisher -Offer $Offer

<#
Get-AzVMImageSku -Location $Location -PublisherName $Publisher -Offer $Offer

Skus              Offer        PublisherName Location   Id
----              -----        ------------- --------   --
12.04.5-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.0-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.1-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.2-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.3-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.4-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.5-DAILY-LTS UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
14.04.5-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
16.04-DAILY-LTS   UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
16.04-LTS         UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
16.04.0-LTS       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
18.04-DAILY-LTS   UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
18.04-LTS         UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
18.10             UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
18.10-DAILY       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
19.04-DAILY       UbuntuServer Canonical     SouthIndia /Subscriptions/<subscription_id>/Providers/Microsoft.Compute/Locations/SouthIndia/Publishers/Canonical/ArtifactTypes/V...
#>

# For Windows Server
$Location   = 'Central India'
$Publisher  = 'MicrosoftWindowsServer'
$Offer      = 'WindowsServer'

Get-AzVMImageSku -Location $Location -PublisherName $Publisher -Offer $Offer

<#
Get-AzVMImageSku -Location $Location -PublisherName $Publisher -Offer $Offer

Skus                                           Offer         PublisherName          Location     Id
----                                           -----         -------------          --------     --
2008-R2-SP1                                    WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2008-R2-SP1-smalldisk                          WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2008-R2-SP1-zhcn                               WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2012-Datacenter                                WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2012-Datacenter-smalldisk                      WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2012-Datacenter-zhcn                           WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2012-R2-Datacenter                             WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2012-R2-Datacenter-smalldisk                   WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2012-R2-Datacenter-zhcn                        WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter                                WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter-Server-Core                    WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter-Server-Core-smalldisk          WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter-smalldisk                      WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter-with-Containers                WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter-with-RDSH                      WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2016-Datacenter-zhcn                           WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter                                WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-Core                           WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-Core-smalldisk                 WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-Core-with-Containers           WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-Core-with-Containers-smalldisk WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-smalldisk                      WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-with-Containers                WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-with-Containers-smalldisk      WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
2019-Datacenter-zhcn                           WindowsServer MicrosoftWindowsServer CentralIndia /Subscriptions/899041ff-5768-4e79-931b-a9e9e9bad5fd/Providers/Microsoft.Compute/Locations/Centra...
#>
