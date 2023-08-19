var elitehealth = (3 + floor((global.laps / 12)))
with (obj_baddie)
{
    if global.elitelap
    {
        elite = 1
        if (elitehit == -4)
            elitehit = elitehealth
    }
}
