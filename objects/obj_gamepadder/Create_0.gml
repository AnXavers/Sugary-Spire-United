device_selected[0] = 0
device_selected[1] = 0
gamepad_discovered = 0
deactivated = 0
device_to_reconnect = 0
press_start = 0
carddex = 0
cardspr = spr_rankcard
confirmspr = spr_rankcardflipping
prevstate[0] = 2
prevstate[1] = 2
vibration1 = 0
vibrationDecay1 = 0
vibration2 = 0
vibrationDecay2 = 0
 function CheckUsedIndex(argument0)
{
        if (global.player_input_device == argument0)
            return 1;
		else
    return 0;
}
