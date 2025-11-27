var bouncingbullet = 0;
if (other.object_index == obj_elnina_bouncingbullet)
    bouncingbullet = 1;
if ((sprite_index == spr_ch3_elnina_umbrella && other.sprite_index == spr_ch3_bullet_raindrop) || (sprite_index == spr_ch3_elnina_sunglasses && other.sprite_index == spr_ch3_bullet_sun) || (sprite_index == spr_ch3_elnina_warmhat && other.sprite_index == spr_ch3_bullet_ice) || (sprite_index == spr_ch3_elnina_telescope && other.sprite_index == spr_ch3_bullet_moon))
{
    mercy += 1.6;
    snd_stop(snd_wing);
    snd_play_x(snd_wing, 0.5, 1 + (count / 40));
}
else if (other.sprite_index == spr_lanino_fire)
{
    mercy -= 5;
    snd_play_x(snd_motor_upper_2, 0.5, 1.3);
    image_alpha2 = 1.4;
    with (other)
        scr_afterimage_grow();
    with (obj_lanino_rematch_enemy)
    {
        talking = true;
        laughtimer = 90;
        head = 679;
    }
    with (obj_elnina_rematch_enemy)
    {
        talking = true;
        laughtimer = 90;
        head = 1196;
    }
}
else
{
    mercy += 0.8;
    snd_stop(snd_wing);
    snd_play_x(snd_wing, 0.5, 1 + (count / 40));
}
if (i_ex(obj_elnina_rematch_enemy) && global.mercymod[obj_elnina_rematch_enemy.myself] < 90)
{
    if ((mercy + global.mercymod[obj_elnina_rematch_enemy.myself]) > 90)
        mercy = 90 - global.mercymod[obj_elnina_rematch_enemy.myself];
    if (mercy < 0)
        mercy = 0;
    if (!i_ex(obj_dmgwriter_boogie))
    {
        with (obj_lanino_rematch_enemy)
        {
            __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
            __mercydmgwriter.damage = other.mercy;
            __mercydmgwriter.type = 5;
        }
        with (obj_elnina_rematch_enemy)
        {
            __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
            __mercydmgwriter.damage = other.mercy;
            __mercydmgwriter.type = 5;
        }
    }
}
else
{
    mercy = 0;
}
image_alpha = 1.2;
count++;
if (!bouncingbullet)
{
    with (other)
    {
        var afterimage = scr_afterimage();
        afterimage.sprite_index = spr_rabbick_dustorb;
        afterimage.direction = random(360);
        afterimage.image_alpha = 0.8;
        afterimage.speed = 4;
        afterimage.image_xscale = 0.5;
        afterimage.image_yscale = 0.5;
        afterimage.friction = 0.334;
        instance_destroy();
    }
}
