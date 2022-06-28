# Azure-VM-VMSS-runbook(new!!)
Azure RM Module is deprecating soon, I made new version that using AZ Module.

Also Used Managed Identity(System Identity) so that Giving Credential to Automation is more easier than before.

This runbook start/stop VM & VMSS based on your resource group.

You can see parameters named Azureresourcegroup and Action.

on Azureresourcegroup, you pass your rg name(ex: test-rg)
on Action, you pass what action you want to do(1. Start 2. Stop)

Hope you guys use it well

Thanks.
