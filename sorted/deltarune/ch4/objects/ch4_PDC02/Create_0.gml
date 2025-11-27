con = -1;
customcon = 0;
leave_con = 0;
door_marker = -4;
toriel_hide = false;
toriel_shadow = 0;
if (global.plot < 190)
{
    office_door_blocker = instance_create(420, 100, obj_solidblockLight);
    with (office_door_blocker)
        image_xscale = 2;
    office_door_readable = instance_create(420, 100, obj_readable_room1);
    with (office_door_readable)
    {
        extflag = "office_room_door";
        image_xscale = 2;
    }
    choir_door_blocker = instance_create(180, 100, obj_solidblockLight);
    with (choir_door_blocker)
        image_xscale = 2;
    choir_door_readable = instance_create(180, 100, obj_readable_room1);
    with (choir_door_readable)
    {
        extflag = "choir_room_door";
        image_xscale = 2;
    }
}
if (global.plot >= 15 && global.plot < 20)
{
    door_cover = scr_marker(183, 64, spr_pixel_white);
    with (door_cover)
    {
        scr_depth();
        image_blend = c_black;
        image_xscale = 8.5;
        image_yscale = 13.8;
        visible = 0;
    }
    blackall = scr_dark_marker(-10, -10, spr_pixel_white);
    blackall.image_xscale = 999;
    blackall.image_yscale = 999;
    blackall.depth = 6000;
    blackall.image_blend = c_black;
    actor_talker = instance_create(0, 0, obj_actor_talk);
    with (obj_mainchara)
    {
        cutscene = 1;
        visible = 0;
    }
    with (obj_caterpillarchara)
        visible = 0;
    camerax_set(161);
    con = 0;
}
if (global.plot >= 30)
    instance_destroy();
