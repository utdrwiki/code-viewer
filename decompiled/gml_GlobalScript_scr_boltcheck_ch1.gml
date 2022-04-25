scr_boltcheck_ch1 = function(argument0) //gml_Script_scr_boltcheck_ch1
{
    pressbuffer[global.char[argument0]] = 5
    qualifybolt = -1
    close = 99
    topclose = 99
    for (i = 0; i < bolttotal; i += 1)
    {
        if (boltchar[i] == argument0 && boltalive[i] == 1)
        {
            close = (boltframe[i] - boltx)
            if (close < 15 && close > -5)
            {
                if (close < topclose)
                {
                    topclose = close
                    qualifybolt = i
                }
            }
        }
    }
    if (qualifybolt != -1)
    {
        p = abs(topclose)
        burstbolt = instance_create_ch1((((x + 80) + (boltframe[qualifybolt] * boltspeed)) - (boltx * boltspeed)), (y + (38 * argument0)), obj_burstbolt_ch1)
        if (p == 0)
        {
            points[argument0] += 150
            with (burstbolt)
                image_blend = c_yellow
            with (burstbolt)
                mag = 0.2
        }
        if (p == 1)
            points[argument0] += 120
        if (p == 2)
            points[argument0] += 110
        if (p >= 3)
        {
            points[argument0] += (100 - (abs(topclose) * 2))
            burstbolt.image_blend = boltcolor[argument0]
        }
        if (p >= 15)
            burstbolt.image_blend = charcolor[argument0]
        boltalive[qualifybolt] = 0
    }
    return;
}

