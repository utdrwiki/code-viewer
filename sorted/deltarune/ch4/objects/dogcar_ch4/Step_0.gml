if (mode == 0)
{
    y = obj_mainchara.y - 8;
    if (x <= obj_mainchara.x)
        x += 20;
}
if (place_meeting(x, y, obj_mainchara) && mode == 0)
{
    snd_stop(snd_hurt1);
    snd_play(snd_hurt1);
    snd_stop(snd_punchweak);
    snd_play(snd_punchweak);
    doghit = instance_create(x, y + 40, obj_animation);
    doghit.image_xscale = 2;
    doghit.image_yscale = 2;
    doghit.sprite_index = spr_dogcar_hit;
    x += 48;
    dmgwriter = instance_create(obj_mainchara.x, (obj_mainchara.y + obj_mainchara.myheight) - 24, obj_dmgwriter);
    dmgwriter.damage = choose(2, 3, 4, 5);
    dmgwriter.type = 0;
    dmgwriter.depth = -100;
    dmgwriter.hspeed = -10;
    global.interact = 1;
    with (obj_mainchara)
        alarm[1] = 1;
    fakedamage += 4;
    if (fakedamage >= 120)
    {
        with (obj_bellListener)
            badcon++;
        mode = 1;
    }
}
if (place_meeting(x, y, obj_dogcar_gameover_ch4) && mode == 1)
{
    snd_stop(snd_hurt1);
    snd_play(snd_hurt1);
    snd_stop(snd_punchweak);
    snd_play(snd_punchweak);
    doghit = instance_create(x, y + 40, obj_animation);
    doghit.image_xscale = 2;
    doghit.image_yscale = 2;
    doghit.sprite_index = spr_dogcar_hit;
    doghit.depth = -300;
    x += 36;
    obj_dogcar_gameover_ch4.image_xscale -= 0.08;
    if (obj_dogcar_gameover_ch4.image_xscale <= 0.08)
    {
        with (obj_dogcar_gameover_ch4)
            instance_destroy();
    }
}
