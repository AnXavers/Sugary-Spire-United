//Initiate this object with bnet. 
//No need to send any variable since we are only using the received co-ord.
//Check BNET_DEMO_MANAGER step event instance updated.
bnet_instance_init();

walkSpd				= 10;					// Speed at which the player moves
reducedSpd			= walkSpd * .5;			// Speed to apply to local player to compensate
mul_goto			= 0;

move_h				= 0;					// Horizontal speed
move_v				= 0;					// Veritical speed

is_player			= false;				// Does this player instance belongs to the client.
x_goto				= x;					// X position to interpolate too.
y_goto				= y;					// Y position to goto
x_goto_prev			= x;					// For sprite direction
y_goto_prev			= y;					
goto				= ds_list_create();		// Queue for holding x/y positions received from the server
last_x				= x;					// Position since last sending position
last_y				= y;

voip_blink			= 0;
voip				= 0;