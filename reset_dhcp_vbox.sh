# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    reset_dhcp_vbox.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migferna <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/17 22:51:24 by migferna          #+#    #+#              #
#    Updated: 2020/12/17 22:51:46 by migferna         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

function reset_dhcp() {
	echo "🧼 Cleaning DHCP ..."
	kill -9 $(ps aux | grep -i "vboxsvc\|vboxnetdhcp" | awk '{print $2}') 2>/dev/null

	if [[ -f ~/Library/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.leases ]] ; then
    	rm  ~/Library/VirtualBox/HostInterfaceNetworking-vboxnet0-Dhcpd.leases
	fi
	echo  "🧙‍♂️ Magic has been done"
}

reset_dhcp
