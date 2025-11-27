if (turn_type == "full")
{
    local_turntimer = 324;
    alarm[5] = 4;
}
if (turn_type == "start")
{
    local_turntimer = 120;
    countdowner = 20;
    countdown = 2;
    turn_time = 40;
    sprite_index = spr_roaringknight_point_ol;
    scr_lerpvar("image_index", 0, 4, 8);
    scr_lerpvar("x", x, scr_get_box(0) + 60, 20, 1, "out");
    scr_lerpvar("y", y, mean(scr_get_box(1), scr_get_box(3)) - 110, 20, 1, "out");
}
if (turn_type == "end")
{
    with (obj_knight_warp)
    {
        x = camerax() + 444;
        y = obj_knight_enemy.ystart;
    }
    x = camerax() + 444;
    y = obj_knight_enemy.ystart;
    local_turntimer = 244;
    countdowner = 16;
    countdown = 20;
    alarm[5] = 4;
}
if (turn_type == "short start")
{
    local_turntimer = 70;
    countdowner = 10;
    countdown = 2;
    turn_time = 40;
    sprite_index = spr_roaringknight_point_ol;
    scr_lerpvar("image_index", 0, 4, 8);
    scr_lerpvar("x", x, scr_get_box(0) + 60, 20, 1, "out");
    scr_lerpvar("y", y, mean(scr_get_box(1), scr_get_box(3)) - 110, 20, 1, "out");
}
if (turn_type == "short mid")
{
    local_turntimer = 80;
    countdowner = 20;
    countdown = 2;
    turn_time = 40;
    sprite_index = spr_roaringknight_point_ol;
    scr_lerpvar("image_index", 0, 4, 8);
    scr_lerpvar("x", x, scr_get_box(0) + 60, 20, 1, "out");
    scr_lerpvar("y", y, mean(scr_get_box(1), scr_get_box(3)) - 110, 20, 1, "out");
}
if (turn_type == "short end")
{
    local_turntimer = 214;
    countdowner = 10;
    countdown = 20;
    alarm[5] = 4;
}
