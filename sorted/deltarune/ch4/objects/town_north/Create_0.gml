con = -1;
var bratty_door = instance_create(920, 60, obj_readable_room1);
bratty_door.image_xscale = 1.5;
if (global.chapter == 2)
{
    var froggit_npc = instance_create(1050, 190, obj_npc_room);
    froggit_npc.sprite_index = spr_smallfrog;
    with (froggit_npc)
        scr_depth();
    var rabbit_npc = instance_create(1135, 105, obj_npc_room);
    rabbit_npc.sprite_index = spr_npc_bunbun;
    with (rabbit_npc)
        scr_depth();
    var mw_npc = instance_create(1295, 105, obj_npc_room);
    mw_npc.sprite_index = spr_npc_mikewazowski;
    with (mw_npc)
        scr_depth();
}
if (global.chapter == 4)
{
    if (global.chapter >= 2)
    {
        with (obj_npc_room)
            instance_destroy();
    }
    if (global.plot < 95)
    {
        var mc_npc = instance_create(1290, 96, obj_npc_room);
        mc_npc.sprite_index = spr_npc_manticore;
        with (mc_npc)
            scr_depth();
        var sans_npc = instance_create(710, 62, obj_npc_facing);
        with (sans_npc)
            scr_depth();
        var grill_marker = scr_marker(689, 23, spr_cattyhouse_grill);
        with (grill_marker)
            scr_depth();
        grill_marker.image_speed = 0.15;
    }
    if (global.plot >= 300)
    {
        with (obj_readable_room1)
        {
            if (x >= 500 && x < 1400)
                instance_destroy();
        }
        var bratty_marker = instance_create(800, 0, obj_marker_palette);
        bratty_marker.sprite_index = bg_building_brattyhouse_night;
        bratty_marker.depth = 949996;
        bratty_marker.current_palette = 2763;
        bratty_marker.palette_index = 1;
        var door_readable = instance_create(526, 76, obj_readable_room1);
        door_readable.image_xscale = 1.6;
        door_readable.image_yscale = 0.6;
        door_readable.extflag = "night_door";
        door_readable = instance_create(920, 76, obj_readable_room1);
        door_readable.image_xscale = 1.6;
        door_readable.image_yscale = 0.6;
        door_readable.extflag = "night_door";
        door_readable = instance_create(1102, 86, obj_readable_room1);
        door_readable.extflag = "night_door";
    }
}
