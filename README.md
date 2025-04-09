# conda-monitor

set of scripts/functions to monitor and address conda relates issues ( system-wide ) 


## `bashrc_prevent_condainit.sh`

This bash function approach will only block commands containing "conda init" or the shell hook mechanism, 
without affecting other conda functionality or changing file permissions

1. The function uses the `DEBUG` trap to inspect commands before they execute
2.It only blocks commands matching specific patterns related to conda initialization
