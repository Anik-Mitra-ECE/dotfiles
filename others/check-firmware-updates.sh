#!/bin/sh
# https://fwupd.org/users
fwupdmgr refresh > /dev/null
exit "$(fwupdmgr get-updates 2> /dev/null | wc -l)"
