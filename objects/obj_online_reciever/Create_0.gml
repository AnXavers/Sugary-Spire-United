client_socket = network_create_socket(network_socket_udp);
server = network_connect(client_socket, "127.0.0.1", 19002);
if server < 0
{
	show_message("Unable to connect to server, please try again later.")
}
else
{
	show_message("Oh my lawd")
}