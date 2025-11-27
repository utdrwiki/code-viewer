if (turn_type == "full")
    local_turntimer = 240;
if (turn_type == "start")
    local_turntimer = 140;
if (turn_type == "end")
{
    local_turntimer = 140;
    sprite_index = spr_roaringknight_point_ol;
    image_index = 0;
    image_speed = 0;
    scr_lerpvar("image_index", 0, 4, 15, 2, "out");
    scr_lerpvar("x", x, x + 40, 15, 2, "out");
    scr_lerpvar("y", y, scr_get_box(5) - 100, 15, 2, "out");
    scr_lerpvar("knightafterimagerange", knightafterimagerange, 4, 30);
    con = 1;
    timer = 7;
    fake_timer = 7;
}
if (turn_type == "short start")
{
    local_turntimer = 120;
    if (next_up == 4)
        turntimer_limit = 60;
}
if (turn_type == "short mid")
{
    local_turntimer = 100;
    sprite_index = spr_roaringknight_point_ol;
    image_index = 0;
    image_speed = 0;
    scr_lerpvar("image_index", 0, 4, 15, 2, "out");
    scr_lerpvar("x", x, x + 40, 15, 2, "out");
    scr_lerpvar("y", y, scr_get_box(5) - 100, 15, 2, "out");
    scr_lerpvar("knightafterimagerange", knightafterimagerange, 4, 30);
    con = 1;
    timer = 7;
    fake_timer = 7;
    if (next_up == 4)
        turntimer_limit = 70;
}
if (turn_type == "short end")
{
    local_turntimer = 90;
    sprite_index = spr_roaringknight_point_ol;
    image_index = 0;
    image_speed = 0;
    scr_lerpvar("image_index", 0, 4, 15, 2, "out");
    scr_lerpvar("x", x, x + 40, 15, 2, "out");
    scr_lerpvar("y", y, scr_get_box(5) - 100, 15, 2, "out");
    scr_lerpvar("knightafterimagerange", knightafterimagerange, 4, 30);
    con = 1;
    timer = 7;
    fake_timer = 7;
}
