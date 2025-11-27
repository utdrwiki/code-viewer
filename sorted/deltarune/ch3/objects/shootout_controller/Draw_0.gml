if (shootout_type != 3)
    draw_sprite_ext(spr_ralsei_horse_shadow, 0, obj_shootout_horse.x + 54, kris_y_ground + 2, 2 - ((kris_y_ground - kris_y) * 0.01), 3, 0, c_white, 1);
if (state == "main" && shootout_type != 3)
{
    if ((i_ex(obj_tenna_zoom) && obj_tenna_zoom.con != 1) || minigameend == 1)
    {
    }
    else
    {
        draw_sprite_ext(spr_shootout_reticle1, reticle_index, aim_x, aim_y, 2, 2, 0, c_white, 1);
        if (reticle_index > 0)
            reticle_index += 1;
        if (reticle_index > 4.5)
            reticle_index = 0;
    }
}
if (state == "main" && shootout_type == 3)
{
    var target_window = -1;
    for (var i = 0; i < instance_number(obj_shootout_window); i++)
    {
        window[i] = instance_find(obj_shootout_window, i);
        if (window[i].type == 4 && window[i].krspopout)
            target_window = window[i];
    }
    if (target_window != -1)
    {
        wreticle_x = lerp(wreticle_x, target_window.x, 0.33);
        wreticle_y = lerp(wreticle_y, target_window.y, 0.33);
    }
    draw_sprite_ext(spr_shootout_reticle3, 1, wreticle_x, wreticle_y, 2, 2, 0, c_white, 1);
}
if (hazard_warning)
    draw_sprite_ext(spr_shootout_warning, 0, 590, 330, 2, 2, 0, c_white, round(hazard_warning / 7) % 2);
