timer++;
if (timer == 1)
{
    sprite_index = spr_tenna_attack;
    snd_play_x(snd_jump, 0.7, 1.8);
}
if (timer < 6)
    fronttenna.image_alpha += 0.2;
if (timer == 26)
{
    image_index = 1;
    snd_play(snd_scytheburst);
}
if (timer == 27)
{
    vspeed = 0;
    gravity = 0;
    scr_shakescreen();
    instance_create(0, 0, obj_tenna_smashcut_manager);
    snd_volume(snd_rumble, 0.5, 0);
    snd_loop(snd_rumble);
}
if (timer == 35)
    gravity = 1;
if (timer > 41)
    fronttenna.image_alpha -= 0.2;
if (timer == 46)
{
    master.tenna_actor.x = master.tenna_actor.xstart;
    instance_destroy();
}
fronttenna.sprite_index = sprite_index;
fronttenna.image_speed = image_speed;
fronttenna.image_index = image_index;
fronttenna.image_xscale = image_xscale;
fronttenna.image_yscale = image_yscale;
fronttenna.x = x;
fronttenna.y = y;
