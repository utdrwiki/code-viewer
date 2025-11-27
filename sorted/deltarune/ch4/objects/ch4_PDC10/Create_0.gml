con = -1;
customcon = 0;
make_npcs = false;
phone_throw = false;
phone_timer = 0;
if (global.plot >= 50 && global.plot < 60)
{
    var couch_sparkle = instance_create(475, 550, obj_npc_room_animated);
    couch_sparkle.sprite_index = spr_shine_white;
    couch_sparkle.image_speed = 0.2;
    with (couch_sparkle)
        depth = 94310;
    if (scr_debug() && global.tempflag[91] == 1)
    {
        global.tempflag[91] = 0;
        if (!snd_is_playing(global.currentsong[1]))
        {
            global.currentsong[0] = snd_init("noelle_house_wip.ogg");
            global.currentsong[1] = mus_loop_ext(global.currentsong[0], 0.9, 1);
        }
    }
}
else
{
    instance_destroy();
}
