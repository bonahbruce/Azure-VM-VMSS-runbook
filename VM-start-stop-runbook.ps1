workflow VM-start-stop-runbook
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
		Write-Output "Stopping VM in '$($AzureResourceGroup)' resource group";
		foreach -parallel($name in (Get-AzVm -ResourceGroupName $AzureResourceGroup).Name)
		{
			Stop-AzVm -ResourceGroupName $AzureResourceGroup -Name $name -Force -Verbose
		}
	}
	else
	{
		Write-Output "Starting VM in '$($AzureResourceGroup)' resource group";
		foreach -parallel($name in (Get-AzVm -ResourceGroupName $AzureResourceGroup).Name)
		{
			Start-AzVm -ResourceGroupName $AzureResourceGroup -Name $name -Verbose
		}
	}
}