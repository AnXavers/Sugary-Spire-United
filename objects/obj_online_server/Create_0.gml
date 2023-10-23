#macro PORT				9445
#macro MAXCLIENTS		32
#macro PACKET_PLAYER	1
server = network_create_server(network_socket_tcp, PORT, MAXCLIENTS)
buffer = buffer_create(16384, buffer_grow, 1)
clients = ds_map_create()
sockets = ds_list_create()