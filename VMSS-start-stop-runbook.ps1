workflow VMSS-start-stop-runbook
{
		Param
	(
		[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()]
		[String]
		$AzureResourceGroup,
		[Parameter(Mandatory=$true)][ValidateSet("Start","Stop")]
		[String]
		$Action
	)
	Connect-AzAccount -Identity -Environment AzureCloud
	if($Action -eq "Stop")
	{
		Write-Output "Stopping VMSS in '$($AzureResourceGroup)' resource group";
		foreach -parallel($name in (Get-AzVmss -ResourceGroupName $AzureResourceGroup).Name)
		{
			Stop-AzVmss -ResourceGroupName $AzureResourceGroup -VMScaleSetName $name -Force -Verbose
		}
	}
	else
	{
		Write-Output "Starting VMSS in '$($AzureResourceGroup)' resource group";
		foreach -parallel($name in (Get-AzVmss -ResourceGroupName $AzureResourceGroup).Name)
		{
			Start-AzVmss -ResourceGroupName $AzureResourceGroup -VMScaleSetName $name -Verbose
		}
	}
}