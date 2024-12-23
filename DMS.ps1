<#

.Synopsis

	This is a DNS Management Tool.

.DESCRIPTION

	This tool can be used to create, modify and delete any A record or CNAME record.

.EXAMPLE

	**Kindly Choose from any one of the options given below** :

1. A record Operations

2. CName record operations

3. Quit

Please enter your choice !: 1

**You choose A Record Operations' from the Operation menu.**

**Kindly Choose from any one of the options given below.**

	1. Creation

	2. Modification

	3. Deletion

	4. Quit

Choose the Operation: 1

Kindly choose a zone from the below choices :

	1.Zone1

	2.ccdev.Zone1

Zone: 1

Kindly provide the FQDN of the hostname : example.praj2.Zone1

Kindly provide the IPv4 Address : 10.2.22.22

FQDN input provided be you : example.praj2.Zone1

IP input provided by you: 10.2.22.22

NSLookup successful for CNAME check!

Given Hostname: example.praj2.Zone1 is not mapped with any CNAME.

NSLookup successful for duplicate record !

example.praj2.Zone1 is not mapped with any IP Given Hostname Creating a New A record now.

A-Record creation successful !

Name			Type 	TTL	Section		IPAddress

example.praj2.Zone1	A	3600		Answer		10.2.22.22


.INPUTS

2 Inputs:

	1) FOON of Hostnames

	2) IPv4 Address

.OUTPUTS

Event Viewer logs

.NOTES

	Version:1.0
	Author:Prashant Raj
	Creation Date: 20/11/2024
	Purpose/Change: No change since last build
#>


#########################
######## Functions ######
#########################

#Defining a fuction to create logs

function Create-Log{

[cmdletbinding()]

param($GUID,

        [string]$0p,

        [string] $user,

        [string] $Ticket,

        [string]$Hostn,

        [string]$IP,

        $Current_IP,

        [string]$Alias,

        $Current_target_record,

        [string]$CNAME,

        $NameHost,

        [int]$Event_10,

        [int]$Category,

        [string] $Message)

I

<#

*Parameters Value referenece*

Category 1 = A record

Category 2 = CNAME record

Event ID 3001 = Record Creation

Event ID 3002 = Record Modification

EventID 3003 =  Record Deletion
#>

if($0p -eq "Program"){

Write-EventLog -LogName "Custom Applications" -Source "DNS Management Tool" EventID $Event_ID -EntryType Information Message "Message 'nSession ID: $Global:GUID" -Category $Category -RawData 10,20

}elseif ($0p -eq "Duplicate"){ Write-EventLog -LogName "Custom Applications" -Source "DNS Management Tool" Event ID $Event_ID -EntryType Warning Message "$Message nSession ID: Global:GUID" Category $Category -RawData 10,20

}elseif ($0p -eq "AC"){

Write-EventLog -LogName "Custom Applications" -Source "DNS Management Tool" EventID 2001 -EntryType Information Message "An A record with value $HostN: $IP was created by $env:USERNAME against $Ticket 'nSession ID: $Global:GUID" -Category 1 -RawData 10,20

}elseif ($0p -eq "AM"){

Write-EventLog -LogName 'Custom Applications -Source "DNS Management Tool" EventID 2002 -EntryType Information -Message "An A record with value SHostn: Current IP was modified to $Hostn: $Ip by Senv: USERNAME against $Ticket nSession ID: $Global: GUID" Category 1 RawData 10,20

Jelseif ($0p-eq "AD") ( Write-EventLog -LogName 'Custom Applications Source "DNS Management Tool" EventID 2003 Entry Type Information Message "An A record with value SHostn: SCurrent IP

was deleted by $env: USERNAME against $Ticket 'nSession ID: $Global:GUID" Category 1 -RawData 10,20

Jelseif ($0p-eq "CC"){ Write-EventLog -LogName 'Custom Applications Source "DNS Management Tool" $Hostn created by Senv: USERNAME against $Ticket 'nSession ID: $Global: GUID" EventID 2001 EntryType Information Message "A CNAME record: $Alias for target host Category 2 RawData 10,20

Jelseif ($0p-eq "CM") { Write-EventLog-LogName 'Custom Applications Source "DNS Management Tool" EventID 2082 -EntryType Information -Message "A CNAME record: SALias with current target host: $Current_target_record was modified to new target host: $Hostn by $env: USERNAME against Slicket nSession ID: $Global: GUID -Category 2 -Rawdata 10,20

}elseif ($0p-eq "CD"){ Write-EventLog -LogName 'Custom Applications Source "DNS Management Tool" -EventID 2003 -EntryType Information Message "A CNAME record: SCHANE for the target hast $NameHost was deleted by Senv: USERNAME against $Ticket 'nSession ID: $Global: GUID" Category 2 RawData 18,20

elseif($0p-ea "Error"){
Write-EventLog -LogName 'Custom Applications' -Source "DIIS Management Tool" -EventID $Event_ID -EntryType Error -Message "$Message "nSession ID: $Global:GUID"

Category $Category -RanData 10,20

}

#Defining a fuction to validate IP address provided by the users

function Validate-Input(

[cmdletbinding()]

param([validatepattern("\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b")] #Regular expression for IP address validation

[string]$IP_Address)

}

#Defining a fuction for creating A record

function Create-A_record(

"Kindly choose a zone from the below choices: 'n

1.Zone1 2.ccdev.kpagdexcloud.kpag.com"

#Zone Selection input

an try{[validateset(1,2)] [int]$Zones- Read-host "Zone ")catch(write-host -EnregroundColor Red "ninYour input is invalid. Kindly choose from [1-2] to selecte option" Create-Log -Op "Error" -Category 1 -Event ID 4801 Message "Type: Zone input Error: `nActor: Senv: USERNAMEnDecription: During A record creation actor

did not choose [1-2] to select an option as an input." ; continue)

switch($Zones){

1{$zone "zone1"; $computername "godevazrgc@1.Zone1"}

2(Szone "ccdev.Zone1")

}

#Ticket input and validation

Sticket Read-Host "nkindly provide a Ticket number againts this operation"

if(($ticket-like "SCTASK"") or ($ticket -like "INC*") or ($ticket -like "CTASK"")-or ($ticket -like "RITM*")-or (Sticket -like "PRB"")){}else{Hirite- host-BackgroundColor: Red "ERROR: Invalid Request number 11 The provided input: $ticket does not resembles a request number."; Create-Log -Op "Error" -Category 1ed Event ID 4002 Message "Type: Ticket input ErrornActor: Senv: USERNAME. nProvided input: $Ticket 'nDecription: During A record creation actor did not provided a valid ticket input." ;break)

#Hostname input and validation

$HostN Read-Host "Kindly provide the FQDN of the hostname

if($Host-like" $Zone")(}else{write-host-BackgroundColor: Red "The Hostname: $HostN you provided is invalid input 1";Create-Log -Op "Error" -Category 1-Event ID 4003 -Message "Type: FQDN input Error påctor: Senv: USERNAME. Provided input: $HostN Decciption: During A record creation actor did not provided a valid Hostname input."; break)

#IP input and validation

$Ip Read-Host "Kindly provide the IPv4 Address 1"

try(Validate-Input-IP Address $IP )catch(write-host-BackgroundColor Red "The IP: $IP you provided is invalid input 1"; Create-Log -Op "Error Category 1-Event ID 4005 Message "Type: IP input Error nåctor: Senv: USERNAME. nProvided input: $IP `nDecription: During A record creation actor did not provided a valid IP input."; break)

#Displaying the input provided by the user

write-host-ForegroundColor Gray "DEQON input provided be you: $HostN" write-host-ForegroundColor Gray "IP input provided by you: $Ip"

#Checking if given hostname is already being used for any CNAME

try{

$Current_targethost-(Resolve-OnsName -Name $HostN -ErrorAction stop) namehost If($Current_targethost)

(Write-host-BackgroundColor red "nERROR: CNAME exist for $Host which is mapped to target host: $Current targethost. n'nCannot proceed further for the A record creation." ;Create-Log -Op "Duplicate" -Category 1 -Event ID 3002 -Message "Type: Duplicate CNAME record. nActor: Senv: USERNAME."nProvided input: $HostNnDecription: CNAME exist for SHost which is mapped to target host: $Current_targethost.During A record creation actor tried to map it to $Ip";break) }

catch(

Write-host-ForegroundColor green "nNSLookup successful for CNAME check 1

" Write-host-ForegroundColor Yellow "nGiven Hostname: $HostN is not mapped with any CNAME."

#Checking if given hostname is already being used for any A record

try{

$Current IP-(Resolve-OnsName Name $HostN -EccorAction stop). IPaddress

If($Current_IP)(Write-host-BackgroundColor Red "`n Please be informed that the given hostname: $Hosti is already mapped with $Current IP. So cannot proceed further n;Write-Host -ForegroundColor Yellow "Note: If you want to modify the current hostname and map it to other IP kindly choose 'Modification' action in the Operation menu; Create-Log -Op "Duplicate" -Category 1 -Event ID 3001 -Message "Type: Duplicate A record "nActor: Senv: USERNAME. nProvided input: $HostNnDecription: The given hostname: $HostN is already mapped with $Current_IP. During A record creation actor tried to map it to $Ip";break)

} catch(

Write-host-ForegroundColor green "n NSLookup successful for duplicate record I"

Write-host-ForegroundColor Yellow "nGiven Hostname: $HostN is not mapped with any IPnCreating a New A record now..."

#Creation of the A record along with Logs generation

if ($zones -eq 1) ($name $HostN.replace(".kpmgdevcloud.kpag.com","")} else{$name $HostN.replace(".ccdev.Zone1","")}

try(Add-OnsServerResourceRecordA -ZoneName Szone -Name $name -IPv4Address $Ip -ComputerName Scomputername ErrorAction SilentlyContinue} catch(Write-Host -BackgroundColor Red "ERROR: Something went wrong 11 Try again or contact your admin 1"; break]

write-host-ForegroundColor Green "DA-Record creation successful 1"

Resolve-DnsName -Name $HostN

A

Create-Log -Op "AC" -Hostn "$HostN" -IP "SIP" -Ticket "$Ticket"

$date Get-Date

"An A record with value $HostN: $Ip was created by Senv: USERNAME on $date againts Sticket" [Out-File F:\IDM\DNS\LOGS\A_Record\Creation_Logs.txt -append}
}

#Defining a fuction for Modifing A record

function Modify-A record(

"Kindly choose a zone from the below choices: `n

1.Zone1

2.ccdev.Zone1"

#Zone Selection input

try{[validateset(1,2)] [int]$Zones Read-host "Zone "}catch(write-host-ForegroundColor Red "ninYour input is invalid. Kindly choose from [1-2] to select an option"; Create-Log -Op "Error" -Category 1 -Event ID 4001 -Message "Type: Zone input Error. nActor: Senv: USERNAME olecription: During A record modification actor did not choose [1-2] to select an option as an input." ;continue)

switch($Zones){

1{$zone "Zone1";$computername "godevazrgc01.Zone1"}

2{$zone "ccdev.Zone1"}

}

#Ticket input and validation

Sticket Read-Host "nkindly provide a Ticket number againts this operation"

if(($ticket-like "SCTASK*") or ($ticket -like "INC*") or ($ticket -like "CTASK*")-or ($ticket-like "RITM"")-or (Sticket -like "PRB*")){}else{Write- host-BackgroundColor Red "ERROR: Invalid Request number The provided input: $ticket does not resembles a request number."; Create-Log -Op "Error" -Category 1 Event ID 4802 -Message "Type: Ticket input ErrornActor: Senv: USERNAME. nProvided input: $Ticket `nDecription: During A record modification actor did not provided a valid ticket input." ;break}

#Hostname input and validation

$HostN Read-Host "Kindly provide the FQDN of the hostname

if($HostN-like".$Zone")()else(write-host-BackgroundColor Red "The FQDN: SHost you provided is invalid input 1"; Create-Log -Op "Error" -Category 1 - Event ID 4003 -Message "Type: FOON input ErrornActor: Senv: USERNAME. Provided input: $HostNnDecription: During A record modification actor did not provided a valid Hostname input." ;break}

#Checking if given hostname is already being used for any CNAME

try{

$Current_targethost-(Resolve-DnsName Name $HostN -ErrorAction stop).namehost If($Current_targethost)

(Write-host-BackgroundColor red "DERROR: CNAME exist for $HostN which is mapped to target host: $Current_targethost."n'nCannot proceed further for the A record creation." ; Create-Log -Op "Duplicate" -Category 1 -Event ID 3002 -Message "Type: Duplicate CNAME record DActor: Senv: USERNAME. nProvided input: $HostNnDecription: During A record modification it was found that a CNAME exist for $HostN which is mapped to target host: $Current_targethost." ;break)

}

catch

}

Write-host -ForegroundColor green "nNSLookup successful for CNAME check I" Write-host -ForegroundColor Yellow "nGiven Hostname: $HostN is not mapped with any CNAME."

#Checking if given hostname exist or not

try{

Resolve-DnsName Name $HostN -ErrorAction Stop | Select-Object Name, IPaddress $CurrentIP- (Resolve-DnsName Name $HostN). IPaddress Write-host-ForegroundColor Gray "nThe given FQDN is currently mapped to IP: $CurrentIP."n"

catch(

Write-host-BackgroundColor Red "n$($_.exception.message)"; Write-host -ForegroundColor red "nThere is nothing to modify ";Create-Log -op "Error" -Category 1 -Event ID 4006 -Message "Type: Non Existent Hostname. nActor: Senv: USERNAME. nProvided input: $Hostn nDecription: During A record modification actor provided a non-existent hostname Hence it cannot be modified."

break

}

A

#IP input and validation

$Ip Read-Host "nKindly provide the new IPv4 Address which needs to be mapped to the FQDN $HostN try{Validate-Input -IP Address $IP }catch(write-host-BackgroundColor Red "The IP: SIP you provided is invalid input 1";Create-Log -Op "Error" -Category 1-Event ID 4005 -Message "Type: IP input Error nActor: Senv: USERNAME. nProvided input: $IP 'nDecription: During A record modification actor did not provided a valid IP input."; break}

#Displaying the inputs provided by the user
write-host-ForegroundColor Gray "nEQDN input provided by you: $HostN" write-host-ForegroundColor Gray "IP input provided by you: $Ip'n"

#Modification of the A record along with Logs generation

if ($zones -eq 1){

$name $Hostl.replace(".Zone1","")

}else{

}

$name $HostN.replace(".ccdev.Zone1","")

$01d0bj Get-OnsServerResourceRecord -BRType "A" -Zonellame $zone -Name $name -ComputerName $computername

$NewObj $01d0bj.Clone()

$NewObj.RecordData. IPv4Address [System.Net-IPAddress]:: parse($Ip)

try{Set-OnsServerResourceRecord -ComputerName Scomputername -NewInputObject $NewObj-Q1dInputObject $01d0bj-Zonellame Szone-Verbose }catch(Write-Host- BackgroundColor Red "ERROR: Something went wrong 11 Try again or contact your admin 1";break)

Start-Sleep -Seconds 2

Resolve-Dos Nam-Name $HostN |Select-Object Name, IPaddress

Create-Log -Op "AM" -Hosto "$Host" -Current IP "Current IP" -IP "$IP" -Ticket "$Ticket"

$date Get-Date

"An A record with value $HostN: $CurrentIP was modified to $Hostili: $Ip by Senv: USERNAME on $date againts Sticket" (Out-File "F:\IDM\DNS\LOGS A Record

Modification_Logs.txt" -Append

}

#Defining a fuction for Deleting A record

function Delete-A Record(

"Kindly choose a zone from the below choices: 'n 1.Zone1

2.ccdev.kpagdevcloud.kpmg.com"

#Zone Selection input

try{[validateset(1,2)] [int]$Zones- Read-host "Zone "}catch(write-host -ForegroundColor Red "ninYour input is invalid. Kindly choose from [1-2] to select an option Create-Log -Op "Error" -Category 1 -Event ID 4001-Message "Type: Zone input Error. nActor: Senv: USERNAMEnRecription: During A record deletion actor did not choose [1-2] to select an option as an input." ;continue)

switch($Zones){

1{$zone "Kpagdevcloud.kpmg.com"; $computername""godevazrgc01.Zone1"}

2{$zone "ccdev.Zone1"}}

@Ticket input and validation

Sticket Read-Host "nkindly provide a Ticket number againts this operation"

if(($ticket -like "SCTASK"") or ($ticket -like "INC*") or ($ticket -like "CTASK")-or ($ticket -like "RITM"")-or ($ticket-like "PRB"")){}else{Write- host-BackgroundColor Red "ERROR: Invalid Request number II The provided input: Sticket does not resembles a request number. Create-Log -Op "Error" -Category 1 - Event ID 4002 -Message "Type: Ticket input Error nåctor: Senv: USERNAME. Provided input: $Ticket Decription: During A record deletion actor did not provided a valid ticket input.";break)

A

#Hostname input and validation

$HostN- Read-Host "Kindly provide the FQDN of the hostname I"

if($HostN-like "".$Zone") {}else{write-host -BackgroundColor Red "The FQDN of the hostname: Hostl you provided is invalid input 1"; Create-Log -Op "Error" -Category 1 -Event ID 4003 -Message "Type: FQDN input ErrornActor: Senv: USERNAME. nProvided Input: SHostN Decription: During A record deletion actor did not provided a valid Hostname input."; break

#Checking if given hostname is already being used for any CNAME

try{

$Current_targethost-(Resolve-OnsName -Name $HostN -ErrorAction stop).namehost

If ($Current_targethost)

(Write-host-BackgroundColor red "NERROR: CNAME exist for $HostN which is mapped to target host: $Current_targethost."n'nCannot proceed further for the A record deletion." ; Create-Log -Op "Duplicate" -Category 1 -Event ID 3002 -Message "Type: Duplicate CNAME record "nActor: Senv: USERNAME. nProvided input: $HostNnDecription: During A record deletion it was found that a CNAME exist for $HostN which is mapped to target host: $Current_targethost." ;break}

}

catch{

}

Write-host-ForegroundColor green "nNSLookup successful for CNAME check 1"

Write-host-ForegroundColor Yellow ""nGiven Hostname: $HostN is not mapped with any CHAME."

try{

$Current IP-(Resolve-DnsName -Name $HostN -EccorAction stop). IPaddress

If($Current_IP){

#Displaying the inputs provided by the user

Write-host-ForegroundColor: Yellow "nGiven FQON of the hostname: $HostN is mapped with SCurrent_IP 'n";

Write-host -ForegroundColor green "n NSLookup successful 1";

#Deletion of the A record along with Logs generation

if ($zones -eq 1) ($name $HostN.replace(".kpmgdevcloud.kpmg.con","")}else{$name -

$HostN.replace(".ccdev.Zone1","")}

try{Remove-DnsServerResourceRecord -ZoneName Szone -ComputerName Scomputername -RRType A -Name $name -Force -Verbose} catch(Write-Host -BackgroundColor Red "ERROR: Something went wrong II Try again or contact your admin 1"; break)

try{

Write-host-ForegroundColor Gray "nResolving DNS once again for the hostname: $host'n"
[03:53, 12/24/2024] Prashant Raj Srivastava: Resolve-DnsName Name $HostN -EccorAction stop

}catch(

Write-host-BackgroundColor Red "n$($_.exception.message)";

write-host-BackgroundColor Green -ForegroundColor Black "nsHost!! removed sucessfully I'n" }

Create-Log -Op "AD" -Hostn "$HostN" -Current IP "$Current IP" -Ticket "$Ticket"

$date Get-Date

"An A record with value $Host: $Current_IP was deleted by $env: USERNAME on $date againts Sticket" [Out-File "F:\IDM\DNS\LOGS

A Record\Deletion_Logs.txt" -Append

}

}catch(

Write-host-BackgroundColor Redn$($_.exception.message)"; Write-host-ForegroundColor red "There is nothing to delete ";Create-Log-op "Error" Category 1 -Event ID 4006 -Message "Type: Non Existent HostnamenActor: Senv: USERNAME. Provided input: $Hostn nDecription: Actor provided non-existent hostname Hence it cannot be deleted. }

}

#Defining a fuction for creating CNAME record

function Create-CNAME(

"Kindly choose a zone from the below choices: 'n

1. KPMGDEVCLOUD.kpag.com

2.ccdev.Zone1"

#Zone Selection input

try{[validateset(1,2)] [int]$Zones- Read-host "Zone "}catch(write-host-ForegroundColor Red "ninYour input is invalid. Kindly choose from [1-2] to select an option": Create-Log -Op "Error" -Category 1 -Event ID 4001 -Message "Type: Zone input Error. nActor: Senv: USERNAME "Decciption: During CHAME record creation actor did not choose [1-2] to select an option as an input." ;continue}

switch($Zones){

1[$zone "Zone1"; $computecname-"godevazrgc01.Zone1"}

2{$zone "ccdev.Zone1"}}

#Ticket input and validation

Sticket Read-Host "nKindly provide a Ticket number againts this operation

if(($ticket-like "SCTASK"") or ($ticket -like "INC*") or ($ticket -like "CTASK*")-or ($ticket -like "RITM*")-or ($ticket -like "PRB*")){}else{Write- host-BackgroundColor Red "ERROR: Invalid Request number 11 The provided input: $ticket does not resembles a request number.Create-Log -Op "Error" -Category 1- Event ID 4002-Message "Type: Ticket input ErrornActor: Senv: USERNAME. Provided input: $Ticket Decription: During CNAME record creation actor did not provided a valid ticket input.";break}

#Hostname input and validation

SHostN- Read-Host "Kindly provide the FQDN for the target host"

if($Host-like "".$Zone" ){

SAliass Read-Host "Kindly provide the Alias FQDN which needs to be mapped with above FQDN

if($Aliass -like "*.$Zone" ){

} else{write-host-BackgroundColor Red "The Alias: $Aliass you provided is invalid input or not in the selected zone: Szone 1"; Create-Log -Op "Error" -Category 1 -Event ID 4884 -Message "Type: Alias FQDN input Error. nActor: $env: USERNAME. nProvided input: $Aliass 'nDecription: During CNAME record creation actor did not provided a valid Alias FQDN input."; break)

}

else{write-host-BackgroundColor Red "The Hostname: $HostN you provided is invalid input 1"; Create-Log -Op "Error" -Category 1 -Event ID 4003 -Message "Type: FQDN input ErrornActor: Senv: USERNAME. nProvided input: $HostNnDecription: During CNAME record creation actor did not provided a valid Hostname input."; break}

#Checking if given hostname is already being used for any A record

try{

$Current_IP-(Resolve-DnsName -Name $Aliass -ErrorAction stop). IPaddress

If($Current_IP) (Write-host-BackgroundColor Red "DERROR: Please be informed that the given hostname: $Aliass already have A record and is already mapped

with IP: $Current IP. So cannot proceed further with the CNAME creation." Create-Log -Op "Duplicate" -Category 1 -Event ID 3002 -Message "Type: Duplicate A record nActor: Senv: USERNAME. nProvided input: $Aliass nDecription: The given hostname: $Aliass is already mapped with $Current_IP.During CNAME record creation actor

tried to map it to $HostN"; break} }catch(Write-host-ForegroundColor green "n NSLookup successful for checking A record with the given alias name $Aliass!"; Write-host-ForegroundColor Yellow "nGiven Hostname: $Aliass is not mapped with any IP.";}

#Checking if given hostname is already being used for any CNAME

try{

$Current_target_record-(Resolve-DnsName -Name $Aliass -ErrorAction stop).namehost

If($Current_target_record) (Write-host-BackgroundColor Red "`n Please be informed that the given hostname: $Aliass is already mapped with $Current target_record. So cannot proceed further 'n;Write-Host -ForegroundColor: Yellow "Note: If you want to modify the current hostname and map it to other Target host kindly choose 'Modification' action in the Operation menu"; Create-Log -Op "Duplicate" -Category 1 -Event ID 3002 -Message "Type: Duplicate CNAME record nActor: $env: USERNAME. nProvided input: $Aliass'nDecription: During CNAME record creation it was found that a CNAME exist for $Aliass which is mapped to target host: $Current_target_record.";break}

}catch(Write-host-ForegroundColor green "n NSLookup successful for checking duplicate CNAME I"; Write-host -ForegroundColor Yellow "nGiven Hostname: $HostN is not mapped with any Target host Creating a New CNAME record now 1";}

#Creation of the CNAME record along with Logs generation

if ($zones -eq 1){

SAliasname $Aliass.replace(".Zone1","")

Jelse($Aliasname $Aliass.replace(".ccdev.Zone1",""))

try(Add-OnsServerResourceRecordCName -ComputerName $computername -ZoneName $zone -Name $Aliasname -HosthameAlias $HostN}catch(Write-Host-BackgroundColor Red "ERROR: Something went wrong 11 Try again or contact your admin 1";break)

Start-Sleep -Seconds 2

Write-host-ForegroundColor Gray "nResolving DNS for the hostname: $Aliass'n";

Resolve-DnsName -Hame $Aliass

Write-Host-ForegroundColor Black -BackgroundColor Green "CNAME: SAliass created for target host: $HostNI"

Create-Log -Op "CC" -Hosto "$Host" -Alias "SAliass" -Ticket "$Ticket"

$date -Get-Date

"A CHAME record: $Aliass for target host $Host created by Senv: USERNAME on $date againts Sticket" [Out-File "F:\IDM\DNS\LOGS\CHAME Record

Creation_Logs.txt" -Append \

}

#Defining a fuction for Modifing CHANE record

function Modify-CHAME(

"Kindly choose a zone from the below choices: 'n

1.Zone1

2.ccdev.Zone1"

#Zone Selection input

try{[validateset(1,2)] [int]$Zones- Read-host "Zone "catch(weite-host -ForegroundColor: Red "ninYour input is invalid. Kindly choose from [1-2] to select an option; Create-Log -Op "Error" -Category 1 -Event 10 4001 -Message "Type: Zone input Error. nActor: Senv: USERNAME. Decription: During CHAME record

modification actor did not choose [1-2] to select an option as an input.";continue)

switch($Zones){

1{$zone "Zone1";$computername "godevazrgc01.Zone1"}

2{$zone "ccdev.Zone1"}}

#Ticket input and validation

$ticket Read-Host "nKindly provide a Ticket number againts this operation

if(($ticket -like "SCTASK*") or ($ticket -like "INC*") or ($ticket -like "CTASK*")-or ($ticket -like "RITM*")-or ($ticket -like "PRB"")){}else{Write- host -BackgroundColor Red "ERROR: Invalid Request number 11 The provided input: $ticket does not resembles a request number. ; Create-Log -Op "Error" -Category 1 - Event ID 4002-Message "Type: Ticket input ErrornActor: Senv: USERNAME. nProvided input: $Ticket Decription: During CNAME record modification actor did not provided a valid ticket input." ;break}

@Hostname input and validation

$HostN Read-Host "Kindly provide the FOON for the new target host

if($HostN-like "*.$Zone" ){

$Aliass Read-Host "Kindly provide the Alias FQDN which needs to be mapped with above FQDN

if($Aliass -like "*.$Zone")

{

} else(write-host-BackgroundColor Red "The Alias: $Aliass you provided is invalid input or not in the selected zone: $zone !";Create- Log -Op "Error" -Category 1 -Event ID 4004 -Message "Type: Alias FQDN input ErrornActor: Senv: USERNAME. nProvided input: $Aliass 'nDecription: During CNAME record modification actor did not provided a valid Alias FQDN input."; break)

}

else(write-host-BackgroundColor Red "The Hostname: $HostN you provided is invalid input I"; Create-Log -Op "Error" -Category 1 -Event ID 4003 -Message "Type: FQDN input ErrornActor: $env: USERNAME. nProvided input: $HostN `nDecription: During CNAME record modification actor did not provided a valid Hostname input." ;break)

#Checking if given hostname is already being used for any A record

try{

$Current_IP-(Resolve-Dnslame -Name $Aliass -ErrorAction stop). IPaddress

If ($Current_IP) (Write-host-BackgroundColor Red "nERROR: Please be informed that the given hostname: $Aliass already have A record and is already mapped with IP: $Current_IP. So cannot proceed further with the CNAME creation.Create-Log -Op "Duplicate" -Category 1 -Event ID 3002-Message "Type: Duplicate A record nActor: Senv: USERNAME. nProvided input: $Aliass'nDecription: The given hostname: $Aliass is already mapped with $Current_IP.During CNAME record modification actor tried to map it to $HostN"; break}

}catch(Write-host -ForegroundColor green "n NSLookup successful for checking A record with the given alias name $Aliass!"; Write-host-ForegroundColor Yellow "nGiven Hostname: $Aliass is not mapped with any IP.";}

#Checking if given hostname is already being used for any CNAME or not.

try{

$Current_target_record-(Resolve-DnsName -Name $Aliass -ErrorAction stop).namehost

If ($Current_target_record) (Write-host-ForegroundColor Yellow "nPlease be informed that the given hostname: $Aliass is already mapped with $Current_target_record. n^nProceeding ahead with the modification of the target host to $HostN"}

}catch(Write-host -ForegroundColor red "n$($_.exception.message)"; Write-host-ForegroundColor red "nThere is nothing to modify ";Create-Log -op "Error" Category 1 -Event ID 4006 -Message "Type: Non Existent Hostname. nActor actor provided non-existent hostname Hence it cannot be modified.";break} Senv: USERNAME.nProvided input: $Aliass 'nDecription: During CNAME record modification


#Modification of the CNAME record along with Logs generation

if ($zones -eq 1){

$Aliasname $ Aliass.replace(".kpmgdevcloud.kpag.com","")

Jelse($Aliasname $Aliass.replace(".ccdev.Zone1","")}

try{Add-OnsServerResource RecordCName -ComputerName $computername -ZoneName $zone -Name $Aliasname -HostNameAlias $HostN }catch(Write-Host-BackgroundColor Red "ERROR: Something went wrong 11 Try again or contact your admin !"; break}

Start-Sleep -Seconds 2

Write-host-ForegroundColor Gray Resolving DNS for the hostname: $Aliass'n";

Resolve-DnsName -Name $Aliass

Write-Host-ForegroundColor Black -BackgroundColor Green "DCNAME: $Aliass mapped for the new target host: $HostNI"

Create-Log -Op "CM" -Hostn "$HostN" -Current_target_record "$Current_target record" Alias "SAliass" -Ticket "$Ticket"

$date Get-Date

"A CHAME record: $Aliass with current target host: $Current_target_record was modified to new target host: $HostN by Senv: USERNAME on $date againts $ticket" (Out-File "F:\IOM\DNS\LOGS\CNAME_Record\Modification_Logs.txt" -Append

#Defining a fuction for deleting CNAME record

function Delete-CNAME(

"Kindly choose a zone from the below choices: 'n

1.Zone1 2.ccdev.kp@gdevcloud.kpmg.com"

#Zone Selection input

try{[validateset(1,2)] [int]$Zones Read-host "Zone ")catch(write-host-ForegroundColor Red "ninYour input is invalid. Kindly choose from [1-2] to select an option" Create-Log -Op "Error" -Category 1 -Event ID 4001 Message "Type: Zone input Error. nActor: Senv: USERNAME`nDecription: During CNAME record deletion actor did not choose [1-2] to select an option as an input." ;continue}

switch($Zones){

1{$zone "Zone1"; $computername "godevazrgc01.Zone1"}

2{$zone "ccdev.Zone1"}}

#Ticket input and validation

$ticket Read-Host "nKindly provide a Ticket number againts this operation"

if(($ticket -like "SCTASK") or ($ticket -like "INC*") or ($ticket -like "CTASK*")-or ($ticket -like "RITM*")-or ($ticket -like "PRB"")){}else{Write- host -BackgroundColor Red "ERROR: Invalid Request number 11 The provided input: $ticket does not resembles a request number.Create-Log -Op "Error" -Category 1 - Event ID 4002-Message "Type: Ticket input ErrornActor: $env: USERNAME. Provided input: $Ticket `nDecription: During CNAME record deletion actor did not provided a valid ticket input." ;break}

#Hostname input and validation

$CNAME Read-Host "Kindly provide the FQDN for the CNAME"

if($CNAME -like "*.$Zone"){}else(write-host-BackgroundColor Red "The Hostname: $CNAME you provided is invalid input 1"; Create-Log -Op "Error" -Category 1-Event ID 4003 -Message "Type: CNAME FQDN input Error. nActor: Senv: USERNAME. nProvided input: SCNAME Decription: Actor did not provided a valid CHAME FODN input."; break)

#Checking if given hostname is already being used for any A record

try{

$Current_IP-(Resolve-Dnslame -Name $CHAME -ErrorAction stop). IPaddress

If($Current_IP) (Write-host-BackgroundColor Red "DERROR: Please be informed that the given hostname: $CNAME already has A record and is already mapped with IP: $Current_IP. So cannot proceed further with the CNAME creation. Create-Log -Op "Duplicate" -Category 1 -Event ID 3002-Message "Type: Duplicate A record nActor: Senv: USERNAME.nProvided input: $CNAMEnDecription : During CNAME record deletion it was found that the given hostname: $CNAME is already mapped with $Current_IP.";break)

}catch(Write-host -ForegroundColor green "n NSLookup successful for checking A record with the given alias name $CNAME!"; Write-host-ForegroundColor Yellow "nGiven Hostname: SCNAME is not mapped with any IP.";)

#Resolving DNS to check if the CNAME exists or not.

Write-host-ForegroundColor Gray "nResolving DNS for the hostname: $CNAME`n";

try(Resolve-DnsName $CNAME -ErrorAction Stop; $NameHost-(Resolve-DnsName $CNAME).namehost}catch(Write-host-BackgroundColor Red "n

$($_.exception.message)"; Write-host -ForegroundColor red ""There is nothing to delete ";Create-Log -op "Error" -Category 1 -Event ID 4006 -Message "Type: Non Existent Hostname. nActor: Senv: USERNAME. nProvided input: $CNAME 'Decription: During CNAME record deletion actor provided non-existent hostname Hence it cannot be deleted." ;break)

#Deletion of the CNAME along with Logs generation

if ($zones -eq 1){

$Hostname $CNAME.replace(".Zone1","")

}else{$Hostname $CHAME.replace(".ccdev.Zone1","")}

try{Remove-DnsServerResourceRecord -ZoneName $zone -ComputerName $computername -RRType CName -Name $Hostname -Force-Verbose }catch(Write-Host BackgroundColor Red "ERROR: Something went wrong 11 Try again or contact your admin 1";break}

try{

Write-host-ForegroundColor Gray "nResolving DNS once again for the hostname: $CNAME`n"; Resolve-DosName -Name $CNAME -ErrorAction stop }catch(Write- host-BackgroundColor Red "n$($_.exception.message)"; write-host -BackgroundColor Green -ForegroundColor Black "SCNAME removed sucessfully I'n"}

Create-Log -Op "CD" -Hostn "$CNAME" -Namehost "$Namehost" -Ticket "$Ticket"

$date Get-Date

"A CHAME record: SCHAME for the target host: $NaseHost was deleted by $env: USERNAME on $date againts Sticket" (Out-File "F:\IDM\DNS\LOGS\CNAME_Record \Deletion_Logs.txt" -Append

}

###################
####Menu#######
###################

Global: GUID - New-Guid

Create-Log -Op "Program" -Category 1 -Event ID 1001 -Message "DMS Tool Started by $env: USERNAME"

Clear-Host

$Space

$Title "Welcome To the DNS Management Console"

$space.PadRight(200)

Write-Host-ForegroundColor Cyan (($Title.PadRight(300)).Tollpper())

do{

#Main Menu write-host-ForegroundColor Yellow "n** Kindly Choose from any one of the options given below **":

1. A record Operations

2. Clame record operations

3. Quit

Main menu input and validation

try{

[validateset(1,2,3)] [int]$Choice_Main_menu Read-host"`n Please enter your choice 1"

catch(write-host-ForegroundColor RedninYour input is invalid. Kindly choose from [1-3] to select an option Create-Log -Op "Error" -Category 1 -Event ID 4007 - }

Message "Type: Main menu invalid input. nActor: Senv: USERNAME. Decription: Actor did not choose [1-3] from the options as input.";continue}

switch($Choice_Main_menu)

1{

#Sub menu

dof

write-host-ForegroundColor Green "n** You choose 'A Record Operations' from the Operation menu.*

write-host-ForegroundColor Yellow ""n" Kindly Choose from any one of the options given below**";

1. Creation

2. Modification

3. Deletion

4. Quit

A

#Sub menu input and validation

try{

[validateset(1,2,3,4)] [int] Soperation read-host "Choose the Operation"

}catch(write-host -ForegroundColor Red "nYour input is invalid. Kindly choose from [1-4] to select an option"; Create-Log -Op "Error" -Category 1-Event ID 4008 -Message "Type: Sub menu invalid input. nActor: Senv: USERNAME.'nDecription: Actor did not choose [1-4] from the options as input.";continue) Switch($operation) {

1 (Create-A record)

2 (Modify-A record)

3 (Delete-A Record)


} }until($operation -eq 4)

}

2 {

#Sub Menu

do{

write-host-ForegroundColor Green "n** You choose 'C Record Operations from the Operation menu.*

write-host-ForegroundColor Yellow ""n** Kindly Choose from any one of the options given below**";

1. Creation

2. Modification

3. Deletion

4. Quit

#Sub menu input and validation

try{

validateset(1,2,3,4)] [int] $operation read-host "Choose the Operation" [

catch( write-host-ForegroundColor Red "nYour input is invalid. Kindly choose from [1-4] to select an option"

} continue)

Switch($Operation)

{

Switch($Operation)

1 (Create-CNAME)

2 (Modify-CNAME)

3 (Delete-CNAME)

I

Juntil(Soperation -eq 4)

}

}

)until($Choice Main_menu-eq 3)

Create-Log -Op "Program" -Category 1 -Event ID 1002 -Message "OMS Tool Terminated by $env: USERNAME"
