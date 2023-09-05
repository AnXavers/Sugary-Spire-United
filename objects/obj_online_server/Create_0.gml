#macro PORT		9445
#macro MAXCLIENTS	4
server = network_create_server(network_socket_tcp, PORT, MAXCLIENTS)
clients = ds_map_create()
sockets = ds_map_create()