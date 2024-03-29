#!/bin/bash

set -u

MY_ADDR_IPv4=`ip -4 addr show to 10.0.0.0/8 up`

if [[ "$MY_ADDR_IPv4" == *"10.7."* ]]; then
  echo "Subnet 10.7.0.0/16 detected"
  ROUTER_IPv4=${AS7_ROUTER_IPv4}
  ROUTER_IPv6=${AS7_ROUTER_IPv6}
elif [[ "$MY_ADDR_IPv4" == *"10.9."* ]]; then
  echo "Subnet 10.9.0.0/16 detected"
  ROUTER_IPv4=${AS9_ROUTER_IPv4}
  ROUTER_IPv6=${AS9_ROUTER_IPv6}
else
  echo "FAIL: unknown subnet. MY_ADDR_IPv4=${MY_ADDR_IPv4}"
  exit 1
fi

echo "Switching to ipv4 router ${ROUTER_IPv4}"
route -4n
ip -4 route change default via ${ROUTER_IPv4} dev eth0

echo "Switching to ipv6 router ${ROUTER_IPv6}"
route -6n
ip -6 route del default via 2480:db8:1:9::1 || true
ip -6 route add default via ${ROUTER_IPv6} dev eth0 metric 1024

./bootstrap.sh $@
