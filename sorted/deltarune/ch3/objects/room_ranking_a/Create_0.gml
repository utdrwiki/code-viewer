con = -1;
customcon = 0;
var door_list = ["susiezilla", "chef", "band"];
for (var i = 0; i < array_length(door_list); i++)
{
    var _door = instance_create(150 + (i * 320), 130, obj_dw_ranking_minigame_door);
    with (_door)
        init(door_list[i]);
}
pippins_marker = -4;
pippins_readable = -4;
pippins_block = -4;
if (scr_flag_get(1189) == 0)
{
    pippins_marker = scr_dark_marker(194, 165, spr_npc_pippins_jump_cool);
    pippins_marker.image_speed = 0.2;
    with (pippins_marker)
        scr_depth();
    pippins_readable = instance_create(pippins_marker.x + 8, pippins_marker.y + 20, obj_readable_room1);
    with (pippins_readable)
    {
        image_xscale = 3;
        image_yscale = 3;
        extflag = "unlock_susiezilla";
    }
    pippins_block = instance_create(pippins_marker.x, pippins_marker.y + 8, obj_solidblocksized);
    with (pippins_block)
    {
        image_xscale = 2;
        image_yscale = 2;
    }
}

unlock_susiezilla = function()
{
    var can_afford = global.flag[1044] >= 500;
    if (can_afford)
    {
        con = 50;
        global.flag[1044] -= 500;
    }
    else
    {
        con = 10;
    }
    with (pippins_marker)
    {
        image_index = 0;
        image_speed = 0;
    }
};
