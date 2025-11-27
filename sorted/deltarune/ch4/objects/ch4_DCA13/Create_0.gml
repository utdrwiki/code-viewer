con = -1;
customcon = 0;
if (global.plot >= 200)
{
    var door_smoke = instance_create(301, 43, obj_ch4_DCA13_door);
    var door_lock = scr_marker(320, 70, bg_church_entrance_door_lock);
    door_lock.image_blend = merge_color(c_white, c_navy, 0.6);
    door_lock.depth = 400100;
    if (global.plot < 210)
    {
        con = 0;
        scr_setparty(1, 0, 0);
        whiteall = scr_dark_marker(-10, -10, spr_pixel_white);
        whiteall.image_xscale = 999;
        whiteall.image_yscale = 999;
        whiteall.depth = 100;
        walk_timer = 0;
    }
    if (global.plot < 220)
    {
        var door_readable = instance_create(300, 85, obj_readable_room1);
        with (door_readable)
        {
            image_xscale = 2;
            extflag = "church_door";
        }
    }
    if (global.plot >= 240)
    {
        with (door_smoke)
            instance_destroy();
        with (door_lock)
            instance_destroy();
    }
    if (global.plot < 290)
    {
        var door_block = instance_create(300, 85, obj_solidblock);
        with (door_block)
            image_xscale = 2;
        var door_block_south = instance_create(300, 240, obj_solidblock);
        with (door_block_south)
            image_xscale = 2;
        with (obj_doorAny)
        {
            if (y < 80)
                instance_destroy();
            else if (y > 220)
                instance_destroy();
        }
    }
}
else
{
    instance_destroy();
}
