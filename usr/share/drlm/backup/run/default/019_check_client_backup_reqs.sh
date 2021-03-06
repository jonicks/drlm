Log "------------------------------------------------------------------"
Log "$PROGRAM $WORWFLOW:                                               "
Log "                                                                  "
Log " - Starting DR backup operations for Client: ${CLI_ID}${CLI_NAME} "
Log "                                                                  "
Log " - Start Date & Time: $DATE                                       "
Log "------------------------------------------------------------------"


# Check if the target client for backup is in DRLM client database

if test -n "$CLI_NAME"; then
	Log "$PROGRAM:$WORKFLOW: Checking if client name: ${CLI_NAME} is registered in DRLM database ..."
	if exist_client_name "$CLI_NAME" ;	
	then
		CLI_ID=$(get_client_id_by_name $CLI_NAME)
		CLI_MAC=$(get_client_mac $CLI_ID)
	        CLI_IP=$(get_client_ip $CLI_ID)
		Log "$PROGRAM:$WORKFLOW: Client $CLI_NAME found!"
	else
		report_error "$PROGRAM: Client $CLI_NAME not found!"
		Error "$PROGRAM: Client $CLI_NAME not found!"
	fi
else
	Log "$PROGRAM:$WORKFLOW: Checking if client ID: ${CLI_ID} is registered in DRLM database ..."
        if exist_client_id "$CLI_ID" ;
        then
		CLI_NAME=$(get_client_name $CLI_ID)
        	CLI_MAC=$(get_client_mac $CLI_ID)
	        CLI_IP=$(get_client_ip $CLI_ID)
		Log "$PROGRAM:$WORKFLOW: Client ID $CLI_ID found!"
        else
        	report_error "$PROGRAM:$WORKFLOW: Client ID $CLI_ID not found!"
        	Error "$PROGRAM:$WORKFLOW: Client ID $CLI_ID not found!"
        fi

fi

Log "$PROGRAM:$WORKFLOW: Testing connectivity for ${CLI_NAME} ... ( ICMP - SSH )"

# Check if client is available over the network
#if check_client_connectivity "$CLI_ID" ; 
#if check_icmp "$CLI_IP" ;
#then
#	Log "Client name: $CLI_NAME is available over network!"
#else
#	report_error "Client with name: $CLI_NAME is not available (ICMP) aborting ..." 
#	Error "Client with name: $CLI_NAME is not available (ICMP) aborting ..." 
#fi


# Check if client SSH Server is available over the network

#if check_client_ssh "$CLI_ID" ;

if check_ssh_port "$CLI_IP" ;
then
	Log "$PROGRAM:$WORKFLOW: Client $CLI_NAME SSH Server is online!"
else
	report_error "$PROGRAM:$WORKFLOW: Client $CLI_NAME SSH Server is not available (SSH) aborting ..." 
	Error "$PROGRAM:$WORKFLOW: Client $CLI_NAME SSH Server is not available (SSH) aborting ..." 
fi

