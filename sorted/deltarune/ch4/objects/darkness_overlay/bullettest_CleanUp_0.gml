if (i_ex(heartlight) && room == room_bullettest)
    instance_destroy(heartlight);
if (variable_instance_exists(id, "darkness"))
{
    obj_growtangle.depth = 5;
    instance_destroy(darkness);
}
if (room == room_bullettest)
    obj_growtangle.sprite_index = spr_battlebg_0;
