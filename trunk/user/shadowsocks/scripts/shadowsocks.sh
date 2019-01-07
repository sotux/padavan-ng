#!/bin/sh
SHADOWSOCKS_DIR="/tmp/shadowsocks.d"

# storage dir
dir_storage="/etc/storage"

# shadowsocks
ss_redir="ss-redir"
ss_tunnel="ss-tunnel"
ss_server_json="/tmp/shadowsocks.json"

# server params
ss_server=$(nvram get ss_server)
ss_server_port=$(nvram get ss_server_port)
ss_password=$(nvram get ss_password)
ss_method=$(nvram get ss_method)
ss_timeout=$(nvram get ss_timeout)
ss_plugin=$(nvram get ss_plugin)
ss_plugin_opts=$(nvram get ss_plugin_opts)

# local setting
ss_local_port=$(nvram get ss_local_port)

# advanced setting
ss_mode=$(nvram get ss_mode)
ss_router_proxy=$(nvram get ss_router_proxy)
ss_reuse_port=$(nvram get ss_reuse_port)
ss_udp=$(nvram get ss_udp)
ss_mtu=$(nvram get ss_mtu)
ss_chromecast=$(nvram get ss_chromecast)

# ss-tunnel setting
ss_tunnel_remote=$(nvram get ss_tunnel_remote)
ss_tunnel_mtu=$(nvram get ss_tunnel_mtu)
ss_tunnel_local_port=$(nvram get ss_tunnel_local_port)

# gfwlist mode setting
ss_gfwlist_url=$(nvram get ss_gfwlist_url)
ss_unblocked_sites_dns=$(nvram get ss_unblocked_sites_dns)
ss_gfwlist_extra_domain="$dir_storage/shadowsocks/gfwlist-extra-domain.conf"
ss_gfwlist_extra_ip="$dir_storage/shadowsocks/gfwlist-extra-ip.conf"

get_arg_reuse_port() {
	if [ "$ss_reuse_port" = "1" ]; then
		echo "--reuse-port"
	fi
}

get_arg_udp() {
	if [ "$ss_udp" = "1" ]; then
		echo "-u"
	fi
}

get_arg_ss_mtu() {
	if [ -n "$ss_mtu" ]; then
		echo "--mtu $ss_mtu"
	fi
}

get_arg_tunnel_mtu() {
	if [ -n "$ss_tunnel_mtu" ]; then
		echo "--mtu $ss_tunnel_mtu"
	fi
}

func_update_gfwlist() {
	wget --no-check-certificate $ss_gfwlist_url -O /tmp/gfwlist.conf
	if [ $? -eq 0 ]; then
		[ ! -d $SHADOWSOCKS_DIR ] && mkdir -p $SHADOWSOCKS_DIR
		mv /tmp/gfwlist.conf $SHADOWSOCKS_DIR
	fi
}

func_gen_ss_server_json() {
	cat > "$ss_server_json" <<EOF
{
	"server": "$ss_server",
	"server_port": $ss_server_port,
	"password": "$ss_password",
	"method": "$ss_method",
	"plugin": "$ss_plugin",
	"plugin_opts": "$ss_plugin_opts",
	"timeout": $ss_timeout
}
EOF
}

func_start_ss_redir() {
	sh -c "$ss_redir -c $ss_server_json $(get_arg_udp) -l $ss_local_port -b 0.0.0.0 $(get_arg_ss_mtu) $(get_arg_reuse_port) &"
	return $?
}

func_start_ss_tunnel() {
	sh -c "$ss_tunnel -c $ss_server_json -u -l $ss_tunnel_local_port -b 127.0.0.1 -L $ss_tunnel_remote $(get_arg_tunnel_mtu) $(get_arg_reuse_port) &"
	return $?
}

func_start() {
	func_gen_ss_server_json

	func_start_ss_redir && \
	logger -st $ss_redir "start done" || loger $ss_redir "start failed"

	func_start_ss_tunnel && \
	logger -st $ss_tunnel "start done" || loger $ss_tunnel "start failed"
}

func_stop() {
	killall -q $ss_redir
	killall -q $ss_tunnel
}

case "$1" in
start)
	func_start
	;;
stop)
	func_stop
	;;
restart)
	func_stop
	func_start
	;;
update)
	func_update_gfwlist
	;;
*)
	echo "Usage: $0 { start | stop | restart }"
	exit 1
	;;
esac
