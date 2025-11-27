with (obj_marker)
{
    if (sprite_index == spr_dw_kitchen)
        instance_destroy();
    if (sprite_index == spr_dw_kitchen_counter)
        instance_destroy();
    if (sprite_index == spr_dw_chef_stove)
        instance_destroy();
}
if (minigametype == "susiezilla" && i_ex(obj_susiezilla_gamecontroller))
{
    if (minigamedifficulty == 2 && hurt_counter == 0)
    {
        if (obj_susiezilla_gamecontroller.ral_difficulty == 1)
            obj_tenna_enemy.ralsei1withouttakingdamage = true;
        if (obj_susiezilla_gamecontroller.ral_difficulty == 2)
            obj_tenna_enemy.ralsei2withouttakingdamage = true;
    }
    obj_susiezilla_gamecontroller.susiezilla_destroy();
    with (obj_animation)
        instance_destroy();
}
if (minigametype == "cooking" && i_ex(obj_chefs_game))
{
    with (obj_tenna_enemy)
    {
        if (minigamefailcount == 0)
            completedchefwithouttakingdamage = 1;
    }
    scr_chefs_end();
    with (counter_marker)
        instance_destroy();
    with (su_stove)
        instance_destroy();
    with (ra_stove)
        instance_destroy();
    with (obj_vfx_twinkle)
        instance_destroy();
    with (obj_flickerdie)
        instance_destroy();
    with (obj_ch3_b4_chef_fire)
        instance_destroy();
    instance_destroy(obj_tenna_chef_marker1);
}
if (minigametype == "music" && i_ex(obj_rhythmgame))
{
    with (obj_rhythmgame)
        instance_destroy();
}
if (minigametype == "cowboy" && i_ex(obj_shootout_controller))
{
    with (obj_shootout_controller)
        instance_destroy();
}
if (minigametype == "battle")
{
    with (obj_battleback)
        instance_destroy();
    with (obj_shutta_nobyacttest)
        instance_destroy();
    with (obj_shutta_nobyact_tv)
        instance_destroy();
    with (obj_shutta_photo_controller)
        instance_destroy();
    with (obj_shutta_enemy)
        instance_destroy();
    with (obj_lightemup_controller)
        instance_destroy();
    with (obj_lightemup_controller)
        instance_destroy();
    with (obj_clearbullets_fx)
        instance_destroy();
    with (obj_tenna_lightemup_bullet)
        instance_destroy();
    with (obj_heart)
        instance_destroy();
    with (obj_growtangle)
        instance_destroy();
    with (obj_elnina_bouncingbullet)
        instance_destroy();
    with (obj_regularbullet)
        instance_destroy();
    with (obj_afterimage)
        instance_destroy();
    with (obj_afterimage_grow)
        instance_destroy();
    with (obj_umbrella_tv)
        instance_destroy();
    with (obj_shadowman_sharpshoot_heart)
        instance_destroy();
    with (obj_elnina_umbrella)
        instance_destroy();
    with (obj_tenna_enemy)
    {
        scr_act_charsprite_end();
        with (obj_herokris)
        {
            obj_herokris.x = obj_herokris.xstart;
            obj_herokris.y = obj_herokris.ystart;
        }
        with (obj_herosusie)
        {
            obj_herosusie.x = obj_herosusie.xstart;
            obj_herosusie.y = obj_herosusie.ystart;
        }
        with (obj_heroralsei)
        {
            obj_heroralsei.x = obj_heroralsei.xstart;
            obj_heroralsei.y = obj_heroralsei.ystart;
        }
    }
    if (minigamedifficulty == 1)
        obj_tenna_enemy.alreadydidsharpshoot = true;
    if (minigamedifficulty == 2 && hurt_counter == 0)
        obj_tenna_enemy.umbrellawithouttakingdamage = true;
}
