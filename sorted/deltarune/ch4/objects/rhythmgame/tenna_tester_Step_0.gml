if (init == false)
{
    global.batmusic[0] = snd_init("tenna_battle.ogg");
    global.batmusic[1] = mus_loop(global.batmusic[0]);
    init = true;
}
track_pos = audio_sound_get_track_position(global.batmusic[1]);
if (image_speed < 2 && track_pos > 6.4)
    image_speed = 2;
if (image_speed == 2 && track_pos < 6.4)
    image_speed = 1;
if (keyboard_check(vk_space) && !active)
{
    active = true;
    rhythmgame = instance_create(0, 0, obj_rhythmgame);
    timer = 240;
    rhythmgame.tenna_boss = true;
}
if (scr_debug())
{
    if (keyboard_check(ord("0")) && !active)
        audio_sound_set_track_position(global.batmusic[0], 0);
}
if (timer > 0 && active)
{
    timer--;
    if (timer <= 0)
    {
        instance_destroy(rhythmgame);
        timer = 0;
        active = false;
    }
}
