con = -1;
var dojo_npc = instance_create(290, 220, obj_npc_dojo);
with (dojo_npc)
{
    sprite_index = spr_npc_puzzlepiece_cringe;
    scr_depth();
    image_xscale = 2;
    image_yscale = 2;
}
puzzle_master_npc = -4;
puzzle_master_blush = false;
if (global.chapter < 4)
{
    puzzle_master_npc = instance_create(130, 80, obj_npc_puzzlemaster2);
    with (puzzle_master_npc)
        scr_depth();
}
else
{
    puzzle_master_npc = instance_create(130, 80, obj_npc_room);
    with (puzzle_master_npc)
    {
        extflag = "puzzlemaster";
        sprite_index = spr_puzzlemaster_frown;
        scr_depth();
    }
}
var desk_marker = scr_marker(84, 112, bg_dw_dojo_help_desk);
desk_marker.depth = puzzle_master_npc.depth - 10;
var desk_collider = instance_create(84, 115, obj_soliddark);
desk_collider.image_xscale = 4;
desk_collider.image_yscale = 1.5;
var help_marker = scr_marker(115, 30, bg_dw_dojo_help);
if (global.chapter == 4)
{
    help_marker.sprite_index = spr_castle_dojo_sign_love;
    help_marker.image_xscale = 2;
    help_marker.image_yscale = 2;
}
with (help_marker)
    scr_depth();
var clover_npc = instance_create(370, 248, obj_npc_room);
clover_npc.sprite_index = spr_clubs_idle;
with (clover_npc)
    scr_depth();
var capn_npc = instance_create(460, 230, obj_npc_room_animated);
capn_npc.sprite_index = spr_hatguy_idle;
with (capn_npc)
    scr_depth();
var blockguy_npc = instance_create(404, 30, obj_npc_room);
blockguy_npc.sprite_index = spr_npc_bloxer_heart;
with (blockguy_npc)
{
    extflag = "bloxer";
    scr_depth();
}
var pippins_npc = instance_create(350, 100, obj_npc_room);
pippins_npc.sprite_index = spr_npc_pippins;
with (pippins_npc)
    scr_depth();
