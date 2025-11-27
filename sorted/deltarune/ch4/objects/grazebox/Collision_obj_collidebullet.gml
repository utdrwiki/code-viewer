if (!other.active)
    exit;
var _grazetpfactor = grazetpfactor;
var _grazetimefactor = grazetimefactor;
with (other)
{
    if (global.inv < 0)
    {
        if (global.chapter == 4 && object_index == obj_organ_enemy_vertical_pillar && green == 1)
            exit;
        if (grazed == -1)
            exit;
        if (grazed == 1)
        {
            scr_tensionheal((grazepoints / 30) * _grazetpfactor);
            if (global.turntimer >= 10)
                global.turntimer -= ((timepoints / 30) * _grazetimefactor);
            with (obj_grazebox)
            {
                if (grazetimer >= 0 && grazetimer < 4)
                    grazetimer = 3;
                if (grazetimer < 2)
                    grazetimer = 2;
            }
        }
        if (grazed == 0)
        {
            if (global.chapter == 4 && object_index == obj_incense_cloud)
            {
                with (obj_incense_cloud)
                    grazed = 1;
            }
            grazed = 1;
            scr_tensionheal(grazepoints * _grazetpfactor);
            if (global.turntimer >= 10)
                global.turntimer -= (timepoints * _grazetimefactor);
            with (obj_battlecontroller)
                grazenoise = 1;
            with (obj_grazebox)
                grazetimer = 10;
            if (i_ex(obj_mike_controller))
            {
                with (obj_mike_controller)
                    grazenoise = 1;
            }
        }
    }
}
