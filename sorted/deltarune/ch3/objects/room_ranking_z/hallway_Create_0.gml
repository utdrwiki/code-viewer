con = -1;
customcon = 0;
scr_setparty(1, 1, 0);
door_marker = scr_dark_marker(335, 120, spr_dw_ranking_door_z);
with (door_marker)
    scr_depth();
var _door_readable = instance_create(340, 140, obj_readable_room1);
with (_door_readable)
{
    image_xscale = 2;
    image_yscale = 2;
    extflag = "z_rank_door";
}

enter_door = function()
{
    con = 0;
};
