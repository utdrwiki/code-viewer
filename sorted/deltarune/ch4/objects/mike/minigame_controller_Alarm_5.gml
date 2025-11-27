with (obj_mike_controller)
    battle_active = false;
with (obj_volumebar)
    instance_destroy();
with (obj_mike_minigame_bg)
    act = 1;
with (obj_juggle_collision)
    instance_destroy();
with (obj_mike)
{
    x = xstart;
    y = ystart;
    act = 0;
    scr_depth();
}
action = 999;
finished = 1;
mus_volume(global.batmusic[1], 0, 15);
