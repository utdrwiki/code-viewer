if ((sprite_index == spr_umbrella && other.sprite_index == spr_ch3_bullet_raindrop) || (sprite_index == spr_sunglasses && other.sprite_index == spr_ch3_bullet_sun) || (sprite_index == spr_warmhat && other.sprite_index == spr_ch3_bullet_ice) || (sprite_index == spr_telescope && other.sprite_index == spr_ch3_bullet_moon))
{
    snd_stop(snd_noise);
    snd_stop(snd_wing);
    snd_stop(snd_ghostappear);
    snd_stop(snd_stardrop);
    if (sprite_index == spr_umbrella)
        snd_play(snd_noise);
    if (sprite_index == spr_sunglasses)
        snd_play(snd_wing);
    if (sprite_index == spr_warmhat)
        snd_play_x(snd_ghostappear, 1, 1.4);
    if (sprite_index == spr_telescope)
        snd_play_x(snd_stardrop, 1, 1.2);
    mercy += 1.6;
    with (other)
        instance_destroy();
}
else
{
    snd_stop(snd_bump);
    snd_play(snd_bump);
    mercy += 0.8;
    with (other)
        instance_destroy();
}
if (!i_ex(obj_dmgwriter_boogie))
{
    snd_play_x(snd_mercyadd, 0.8, 1.4);
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
