image_speed = 0;
statue_active = true;
con = 0;
callback = -4;
bit_index = 1;
statue = instance_create(x, y, obj_mike_statue_cat);
statue_block = instance_create(x + 10, y + 80, obj_solidblockDark);
statue_readable = instance_create(x + 8, y + 70, obj_readable_room1);
with (statue_readable)
{
    image_xscale = 2;
    image_yscale = 2;
}

init = function(arg0, arg1 = -4)
{
    statue_readable.extflag = arg0;
    callback = arg1;
    statue.sprite_index = sprite_index;
    statue_block.y = (y + (sprite_get_height(sprite_index) * 2)) - 40;
    statue_readable.y = (y + (sprite_get_height(sprite_index) * 2)) - 40;
    if (!scr_is_valid_mic_platform() && global.flag[1692] == 1)
    {
        with (statue_readable)
            instance_destroy();
    }
    with (statue)
        scr_depth();
};

clean_up = function()
{
    with (statue)
        instance_destroy();
    with (statue_block)
        instance_destroy();
    with (statue_readable)
        instance_destroy();
    if (callback != -4)
        callback(bit_index);
    instance_destroy();
};
