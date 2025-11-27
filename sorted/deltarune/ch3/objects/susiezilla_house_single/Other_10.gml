if (room == room_dw_teevie_susiezilla)
{
    if (myhealth != 0)
    {
        scr_shakeobj();
        myhealth = 0;
        with (obj_dw_teevie_susiezilla)
        {
            if (targ != other.id)
                other.alarm[1] = 6;
            if (obj_dw_teevie_susiezilla.nohouses == 1)
            {
                obj_dw_teevie_susiezilla.nohouses = 3;
                debug_print("kris got the last one");
            }
        }
    }
}
else if (explo)
{
    sprite_index = spr_susiezilla_house_close;
    scr_lerpvar("image_index", 0, 5, 10);
    scr_script_delayed(instance_destroy, 10);
}
else
{
    explo = true;
    sprite_index = spr_susiezilla_house_rise;
    image_index = 9;
    scr_lerpvar("image_index", 9, 0, 10);
    scr_script_delayed(instance_destroy, 10);
}
