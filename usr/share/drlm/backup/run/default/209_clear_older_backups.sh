Log "$PROGRAM:$WORKFLOW:ARCHIVE:CLEAN:${CLI_NAME}: DR Archive Clean in progress .... "

if clean_backups ;
then
	Log "$PROGRAM:$WORKFLOW:ARCHIVE:DR:CLEAN:FS:DB:${CLI_NAME}: .... Success!"
else
	report_error "ERROR:$PROGRAM:$WORKFLOW:ARCHIVE:DR:CLEAN:FS:DB:${CLI_NAME}: Problem removing Oldest backup! aborting ..."
	Error "$PROGRAM:$WORKFLOW:ARCHIVE:DR:CLEAN:FS:DB:${CLI_NAME}: Problem removing Oldest backup! aborting ..."
fi

Log "$PROGRAM:$WORKFLOW:ARCHIVE:CLEAN:${CLI_NAME}: DR Archive Clean in progress .... Success!"

Log "####################################################"
Log "# DR backup operations for ${CLI_NAME} finished!"
Log "####################################################"