if (sprite_index == spr_krisb_eye_x)
{
    with (obj_herokris)
    {
        if (state == 6)
            acttimer += 0.5;
    }
}
if (sprite_index == spr_ralsei_mustache2)
{
    with (obj_heroralsei)
    {
        if (state == 6)
            acttimer += 0.5;
    }
}
timer++;
if (timer == 30)
{
    visible = true;
    image_speed = 0.1;
    snd_play(snd_magicmarker);
}
if (image_index > 3)
{
    image_index = 3;
    image_speed = 0;
}
if (scr_monsterpop() == 0)
    instance_destroy();
if (sprite_index == spr_krisb_eye_x && global.hp[1] < 1)
    instance_destroy();
if (sprite_index == spr_ralsei_mustache2 && global.hp[3] < 1)
    instance_destroy();
