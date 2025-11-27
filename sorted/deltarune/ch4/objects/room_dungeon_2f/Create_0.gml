con = -1;
cutscene_master = noone;
leaveCounter = 0;
var cagesama = instance_create(70, 75, obj_npc_room);
cagesama.sprite_index = spr_npc_gouldensam;
cagesama.depth = 500000;
var cagesamb = instance_create(cagesama.x + 280, cagesama.y, obj_npc_room);
cagesamb.sprite_index = spr_npc_gouldensam;
cagesamb.depth = 500000;
if (global.chapter < 4)
{
    var cageking = instance_create(cagesama.x, cagesama.y, obj_npc_room);
    cageking.sprite_index = spr_npc_cage_king_castle;
    cageking.depth = cagesama.depth - 10;
    var cageanimal = instance_create(cagesamb.x, cagesamb.y, obj_npc_room);
    cageanimal.sprite_index = spr_npc_cage_animals_castle;
    cageanimal.depth = cagesamb.depth + 10;
    var checkers = instance_create(60, 260, obj_npc_room_animated);
    checkers.sprite_index = spr_smallcheckers_front;
    with (checkers)
        scr_depth();
}
else
{
    var cageking = instance_create(cagesama.x, cagesama.y, obj_npc_room);
    cageking.sprite_index = spr_npc_cage_king_alone;
    cageking.depth = cagesama.depth - 10;
    var cageanimal = instance_create(470, 165, obj_npc_room);
    cageanimal.sprite_index = spr_dw_castle_crown;
    cageanimal.depth = cagesamb.depth + 10;
    var checkers = instance_create(60, 260, obj_npc_room_animated);
    checkers.sprite_index = spr_smallcheckers_sleep;
    checkers.image_speed = 0.05;
    with (checkers)
        scr_depth();
}
if (global.chapter == 4)
{
    if (!scr_tenna_alt_plot())
    {
        if (scr_recruited_all_in_chapter(3) && scr_flag_get(779) < 2 && scr_flag_get(790) == 0)
        {
            king_npc = instance_find(obj_npc_king, 0);
            with (king_npc)
            {
                x += 120;
                xstart += 120;
            }
            bars_vfx = instance_create(0, 0, obj_castle_town_dungeon_bars);
            bars_vfx.depth = 500000;
            lancer_marker = scr_dark_marker(1340, 114, spr_lancer_ut);
            with (lancer_marker)
                depth = 500010;
            tenna_track[0] = -4;
            tenna_track[1] = -4;
            con = 10;
        }
    }
}
