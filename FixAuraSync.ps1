# FixAuraSync Script
# Copyright (C) 2020 Stephen Bonar
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

<#PSScriptInfo

.VERSION 1.0

.GUID 9a9cee5e-c1d1-46bf-8c8f-bd63dd16e51a

.AUTHOR Stephen Bonar

.COMPANYNAME

.COPYRIGHT Copyright (C) 2020 Stephen Bonar

.TAGS

.LICENSEURI https://www.gnu.org/licenses/gpl-3.0.html

.PROJECTURI https://github.com/stephenbonar/FixAuraSync

.ICONURI

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<#
.SYNOPSIS
Fixes ASUS Aura Sync when it does not properly detect lighting devices

.DESCRIPTION 
Attempts to fix the ASUS Aura Sync when it is not properly detecting lighting
devices by stopping related services, removing the LastProfile.xml file, and
then restarting the services

.PARAMETER LightingServicePath
Specifies the path to the ASUS LightingService installation directory. If this
parameter is not specified, the default installation path is used
#>
[CmdletBinding()]
Param($LightingServicePath = 'C:\Program Files (x86)\LightingService')

#Requires -RunAsAdministrator

$services = @('ARMOURY CRATE Service', 'LightingService')
$processes = @('ArmouryCrate')
$lightingServiceProfilePath = "$($LightingServicePath)\LastProfile.xml"

$lightingServicePathError = @'
LightingService installation path not found, use the -LightingServicePath 
parameter to specify a different path.
'@

if (-not (Test-Path $LightingServicePath))
{
    throw $lightingServicePathError
}

"Stopping the following services: $services"
Stop-Service $services

if ($processObjects = Get-Process $processes -ErrorAction SilentlyContinue)
{
    "Stopping the following processes: $processes"
    Stop-Process $processObjects
}

"Removing $lightingServiceProfilePath"
Start-Sleep 5
Remove-Item $lightingServiceProfilePath

"Restarting services..."
Start-Service $services
"Done. Please start ArmouryCreate and see if this resolved the issue."
