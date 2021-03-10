# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    resetVb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: krios-fu <krios-fu@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/18 19:28:49 by krios-fu          #+#    #+#              #
#    Updated: 2021/02/18 19:29:04 by krios-fu         ###   ########.fr        #
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