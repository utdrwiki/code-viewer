x = 100;
y = 100;
width = 4;
height = 3;
timer = 0;
init = 0;
tvbasecolor = #5B2745;
tvbasesprite = spr_dw_teevie_tv_base_thin;
mode = 0;
frozen_mode = 0;
myimage = choose(0, 2, 4, 8, 19, 23, 31, 35, 37, 39);
door_active = false;
image_xscale = 2;
image_yscale = 2;
tvheight = 40 * image_yscale;
tvwidth = 40 * image_xscale;
readable = -4;
door_block = -4;
treasure_flag = -1;
treasure_sequence = false;
treasure_timer = 0;
_screen_list = [];

set_secret = function(arg0, arg1)
{
    treasure_flag = arg0;
    frozen_mode = arg1;
    if (scr_flag_get(treasure_flag) == 0)
    {
        readable = instance_create(x + (3 * tvwidth), y + (1 * tvheight) + 80, obj_readable_room1);
        with (readable)
        {
            extflag = arg0;
            image_xscale = 4;
            image_yscale = 4;
        }
        door_block = instance_create(x + (3 * tvwidth), y + (1 * tvheight) + 80, obj_solidblocksized);
        with (door_block)
        {
            image_xscale = 2;
            image_yscale = 2;
        }
    }
    else
    {
        show_treasure();
    }
};

show_treasure = function()
{
    door_active = true;
    alarm[0] = 30;
    with (readable)
        instance_destroy();
    with (door_block)
        instance_destroy();
    if (scr_flag_get(treasure_flag) == 0)
        scr_flag_set(treasure_flag, 1);
};
