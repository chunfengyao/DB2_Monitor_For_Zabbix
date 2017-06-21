#!/bin/bash
cd sqlscript/
>/dev/null ./check_tablespace_datail.sh
cd ../script/
>/dev/null ./handle_tablespace_log.sh
>/dev/null ./create_tablespace_name_for_auto_discovery.sh
cd ..