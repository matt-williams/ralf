#!/bin/bash

# @file poll_ralf.sh
#
# Copyright (C) Metaswitch Networks 2016
# If license terms are provided to you in a COPYING file in the root directory
# of the source code repository by which you are accessing this code, then
# the license outlined in that COPYING file applies to your use.
# Otherwise no rights are granted except for those provided to you by
# Metaswitch Networks in a separate written agreement.

. /etc/clearwater/config
http_ip=$(/usr/share/clearwater/bin/bracket-ipv6-address $local_ip)
/usr/share/clearwater/bin/poll-http $http_ip:10888
exit $?
