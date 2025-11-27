if (turn_type != "start" && turn_type != "short start" && turn_type != "short mid" && scr_bulletparent_count() < 2)
{
    with (obj_knight_enemy)
        image_alpha = 1;
    global.turntimer = -1;
}
snd_stop(snd_shinka_ambience);
