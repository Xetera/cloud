#!/bin/sh

set -o errexit

# Ensure the WireGuard config file exists
if [ ! -f /etc/wireguard/origin0.conf ]; then
  echo "WireGuard config not found in /etc/wireguard/origin0.conf!"
  exit 1
fi

echo "Starting WireGuard client..."
# Start the WireGuard client (ProtonVPN config)
wg-quick up /etc/wireguard/origin0.conf
echo "WireGuard client started"

# iptables -F
# iptables -t nat -F

# iptables -A FORWARD -i wg0 -o origin0 -j ACCEPT
# iptables -A FORWARD -i origin0 -o wg0 -j ACCEPT

# iptables -t nat -A POSTROUTING -o origin0 -j MASQUERADE

# # Allow established connections
# iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# # Forward traffic from WireGuard clients (wg0) to ProtonVPN (origin0)
# iptables -A FORWARD -i wg0 -o origin0 -j ACCEPT
# iptables -A FORWARD -i origin0 -o wg0 -m state --state RELATED,ESTABLISHED -j ACCEPT

# # NAT rules - masquerade traffic from WireGuard clients through ProtonVPN
# iptables -t nat -A POSTROUTING -o origin0 -j MASQUERADE

# # Keep kubernetes networking functional
# iptables -A FORWARD -i wg0 -o eth0 -j ACCEPT
# iptables -A FORWARD -i eth0 -o wg0 -m state --state RELATED,ESTABLISHED -j ACCEPT



exec "$@"
