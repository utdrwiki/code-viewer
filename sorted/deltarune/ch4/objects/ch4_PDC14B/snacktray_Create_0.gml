con = 0;
image_speed = 0;
current_x_pos = 0;
current_y_pos = 0;
platter_npc = instance_create(x, y, obj_readable_room1);
platter_npc.extflag = "snack_platter";

clean_up = function()
{
    with (platter_npc)
        instance_destroy();
    instance_destroy();
};
