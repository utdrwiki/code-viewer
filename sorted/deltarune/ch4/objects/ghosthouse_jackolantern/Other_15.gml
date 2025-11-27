if (tutu == 1 && collision_line(x, y + 8, obj_heart.x + 4, obj_heart.y + 4, obj_battlesolid, true, true))
    exit;
if (damage && global.inv < 0 && !polite && tutu != 1)
{
    damage = 20 - floor(hits / 2);
    if (global.tempflag[89] >= 2)
        damage = 15 - floor(hits / 2);
    if (damage < 1)
        damage = 1;
    hits++;
    if (hits == 12)
        global.turntimer = 1;
}
if (damage && global.inv < 0 && !polite && tutu != 1)
    target = 3;
event_inherited();
global.inv = min(global.inv, 10 - floor(hits / 2));
if (tutu == 1)
{
    with (obj_battlesolid)
        image_blend = c_yellow;
    if (i_ex(obj_jackenstein_enemy) && obj_jackenstein_enemy.scaredycat)
    {
        scaredy = obj_jackenstein_enemy.scaredycat;
        obj_jackenstein_enemy.scaredycat = false;
    }
    obj_heart.wspeed = 0;
    if (room == room_bullettest || room == room_bullettest_new)
        audio_stop_all();
    else
        snd_pause(global.batmusic[0]);
    with (obj_gh_fireball_bouncy)
        speed = 0;
    with (obj_gh_fireball_linear)
        rate = 0;
    with (obj_gh_fireball_square)
        path_speed = 0;
    timer = 100;
    tutu = 2;
    image_speed = 0;
    sprite_index = spr_guywhoappearswhenyoudroppedyourtutu;
    scr_lerpvar("x", x, obj_heart.x - 60, 45, -1, "out");
    scr_lerpvar("y", y, obj_heart.y - 12, 45, -1, "out");
    path_end();
}
else if (polite == 1)
{
    path_speed = 0;
}
else if (!tutu)
{
    if (!fully_aggro)
        event_user(0);
}
