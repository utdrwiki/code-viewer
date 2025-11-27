con = -1;
shine = -4;
remove_shine = false;
var show_shine = false;
var pending_items = scr_get_cliff_items();
if (array_length(pending_items) > 0)
{
    scr_flag_set(1644, 0);
    show_shine = true;
}
var hole = scr_marker(281, 200, spr_darkwest_hole);
with (hole)
    scr_depth();
cliff_readable = instance_create(300, 240, obj_readable_room1);
cliff_readable.image_xscale = 2;
cliff_readable.image_yscale = 2;
if (show_shine)
{
    shine = scr_marker(320, 235, spr_shine);
    shine.image_speed = 0.1;
    shine.image_xscale = 2;
    shine.image_yscale = 2;
    shine.depth = hole.depth - 10;
    cliff_readable.extflag = "cliff_items";
}
if (scr_flag_get(659) == 1)
{
    var hacker_npc = instance_create(400, 204, obj_npc_room);
    with (hacker_npc)
    {
        extflag = "hacker";
        normalanim = 4;
        sprite_index = spr_npc_cursor_walk_right;
        scr_depth();
    }
    var pippins_npc = instance_create(478, 216, obj_npc_room);
    with (pippins_npc)
    {
        extflag = "pippins";
        sprite_index = spr_pippins_idle;
        scr_depth();
    }
}
