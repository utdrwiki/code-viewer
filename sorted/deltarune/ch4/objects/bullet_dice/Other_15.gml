if ((mercified && sprite_index == spr_bullet_dice_all4s) || (mercified && image_index >= 10 && image_index < 15 && sprite_index == spr_bullet_dice4pip))
{
    snd_play(snd_mercyadd);
    for (var i = 0; i < instance_number(obj_pippins_enemy); i++)
    {
        enemy[i] = instance_find(obj_pippins_enemy, i);
        if (enemy[i].bet)
        {
            with (enemy[i])
                scr_mercyadd(myself, 35);
        }
        if (enemy[i].fixedbet)
        {
            with (enemy[i])
                scr_mercyadd(myself, 35);
        }
    }
    instance_destroy();
    exit;
}
target = obj_dbulletcontroller.target;
if (active == 1)
{
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
    if (destroyonhit == 1)
        instance_destroy();
}
