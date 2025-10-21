#####################################################################################################################
# Script to disable unnecesary Windows services and improve the performance.
# 
# This use the command Set-Service, you can check the below link for more information
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-service?view=powershell-7
#
# You should check what service you want to disable, like Windows defender, Windows Search 
# or Seclogon (necesary for some programs or games).
# Some services were removed in Windows 10.
#####################################################################################################################

$services = @(
    "CertPropSvc"                              # Certificates Propagation Service
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "DPS"                                      # Diagnostic Policies Service
    "dmwappushservice"                         # WAP Push Message Routing Service
    # "HomeGroupListener"                        # HomeGroup Listener (Removed in Windows 10)
    # "HomeGroupProvider"                        # HomeGroup Provider (Removed in Windows 10)
    "iphlpsvc"                                 # Auxiliar IP App
    "lfsvc"                                    # Geolocation Service
    "lmhosts"                                  # NetBIOS over TCP/IP Auxiliar App
    "MapsBroker"                               # Downloaded Maps Manager
    "MSiSCSI"                                  # Microsoft iSCSI Initatior Service
    "Netlogon"                                 # NetLogon Service
    "PcaSvc"                                   # Compatibility Programs Assistant Service
    "RemoteRegistry"                           # Remote Registry
    "RemoteAccess"                             # Routing and Remote Access
    "RpcLocator"                               # Remote Procedure Call (RPC) Locator
    "SCardSvr"                                 # Smart card
    "SCPolicySvc"                              # Smart card Extraction Policy Service
    # "seclogon"                                 # Secundary Login Service
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "SNMPTRAP"                                 # SNMP Capture Service
    "Spooler"                                  # Print Spooler Service
    "stisvc"                                   # Windows Image acquisition (WIA) Service
    "TabletInputService"                       # Handwriting Panel and touch keyboard Service
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service
    "WlanSvc"                                  # WLAN AutoConfig    
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    # "wscsvc"                                   # Windows Security Center Service
    "WSearch"                                  # Windows Search
)

foreach ($service in $services) {
    echo "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
    echo "$service disabled"
}