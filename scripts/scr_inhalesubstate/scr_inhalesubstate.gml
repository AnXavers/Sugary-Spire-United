function scr_inhalesubstate()
{
    switch (storedinhalebaddie)
    {
        case "obj_knight":
            substate = substates.unknown_1
            break
        case "obj_googlyjuice":
            substate = substates.unknown_2
            break
        case "obj_babybear":
            substate = 3
            break
			 case "obj_cottonwitch":
            substate = 4
            break
    }
}

