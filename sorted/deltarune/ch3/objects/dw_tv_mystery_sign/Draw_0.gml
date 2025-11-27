if (is_animated)
    sign_anim += 0.2;
if (banner_drop)
{
    banner_drop = false;
    scr_lerp_var_instance(id, "banner_y_pos", banner_y_pos, 2, 18, 2, "out");
}
if (sign_drop)
{
    sign_drop = false;
    scr_lerp_var_instance(id, "sign_y_pos", sign_y_pos, 60, 18, -3, "out");
}
if (gray_mode)
{
    if (normal_mode)
        normal_mode = false;
    banner_alpha = scr_movetowards(banner_alpha, 0, 0.02);
    banner_dark_alpha = scr_movetowards(banner_dark_alpha, 1, 0.02);
    banner_gray_alpha = scr_movetowards(banner_gray_alpha, 0.5, 0.02);
    sign_alpha = scr_movetowards(sign_alpha, 0, 0.02);
    sign_gray_alpha = scr_movetowards(sign_gray_alpha, 0.5, 0.02);
    killed_alpha = scr_movetowards(killed_alpha, 1, 0.02);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_white, banner_alpha);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_black, banner_dark_alpha);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign_gray"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_white, banner_gray_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_half, sign_anim, sign_x_pos, sign_y_pos, 2, 2, 0, c_white, sign_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_half, sign_anim, sign_x_pos, sign_y_pos, 2, 2, 0, c_black, banner_dark_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_off_gray, 0, sign_x_pos, sign_y_pos, 2, 2, 0, c_white, sign_gray_alpha);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysertySign_killed"), 0, 330, 120, 2, 2, 0, c_white, killed_alpha);
}
if (recovery_mode)
{
    if (gray_mode)
        gray_mode = false;
    banner_alpha = scr_movetowards(banner_alpha, 1, 0.2);
    banner_dark_alpha = scr_movetowards(banner_dark_alpha, 0, 0.2);
    banner_gray_alpha = scr_movetowards(banner_gray_alpha, 0, 0.2);
    sign_alpha = scr_movetowards(sign_alpha, 1, 0.2);
    sign_gray_alpha = scr_movetowards(sign_gray_alpha, 0, 0.2);
    killed_alpha = scr_movetowards(killed_alpha, 0, 0.2);
    if (killed_alpha <= 0)
        normal_mode = true;
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_white, banner_alpha);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_black, banner_dark_alpha);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign_gray"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_white, banner_gray_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_half, sign_anim, sign_x_pos, sign_y_pos, 2, 2, 0, c_white, sign_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_half, sign_anim, sign_x_pos, sign_y_pos, 2, 2, 0, c_white, banner_dark_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_off_gray, 0, sign_x_pos, sign_y_pos, 2, 2, 0, c_white, sign_gray_alpha);
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysertySign_killed"), 0, 330, 120, 2, 2, 0, c_white, killed_alpha);
}
if (normal_mode)
{
    if (gray_mode)
        gray_mode = false;
    if (recovery_mode)
        recovery_mode = false;
    draw_sprite_ext(scr_84_get_sprite("spr_dw_tv_mysterySign"), 0, banner_x_pos, banner_y_pos, 2, 2, 0, c_white, sign_alpha);
    draw_sprite_ext(spr_dw_tv_tvtimeSign_half, sign_anim, sign_x_pos, sign_y_pos, 2, 2, 0, c_white, sign_alpha);
}
