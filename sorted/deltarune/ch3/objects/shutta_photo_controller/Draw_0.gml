siner++;
if (state == "intro" || state == "aiming")
{
    if (i_ex(obj_shutta_nobyacttest) && obj_shutta_nobyacttest.photocooldowntimer > 0)
        draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    else
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (flash_alpha > 0 && (state == "capture" || state == "result"))
    {
    }
    else if (flash_alpha > 0)
    {
        draw_sprite_stretched_ext(spr_whitepixel, 0, x - 82, y - 64, 32 * image_xscale, 32 * image_yscale, c_white, flash_alpha);
        flash_alpha -= 0.1;
    }
    draw_sprite_ext(spr_shutta_hands2, 0, (x - (width / 2)) + 4, y - (height / 2) - 4, 2, 2, 0, c_white, image_alpha);
    draw_sprite_ext(spr_shutta_hands2, 1, (x + (width / 2)) - 4, y + (height / 2) + 4, 2, 2, 0, c_white, image_alpha);
    draw_set_color(c_white);
    draw_set_alpha(image_alpha - 0.5);
    if (reticle_over_good_shot)
    {
        draw_set_color(c_lime);
        draw_set_alpha(1);
    }
    draw_circle(x, y, reticle_size, true);
    if (reticle_over_good_shot)
        draw_circle(x, y, reticle_size + 1, true);
    draw_set_alpha(1);
    draw_set_color(c_white);
    if (reticle_over_good_shot_prev != reticle_over_good_shot)
    {
        snd_stop(snd_menumove);
        snd_play(snd_menumove);
    }
    reticle_over_good_shot_prev = reticle_over_good_shot;
    var _tx = camerax() + 200;
    var _ty = cameray() + 295;
    if (!i_ex(obj_tenna_minigame_ui))
    {
        draw_set_alpha(introtimer / 10);
        ossafe_fill_rectangle_color(_tx, _ty - 5, _tx + ((1 - (timer / timer_duration)) * 180), _ty + 5, c_aqua, c_aqua, c_aqua, c_aqua, 0);
        draw_set_alpha(1);
        draw_sprite_ext(spr_poppup_hourglass, 1, _tx, _ty, 2, 2, 0, c_white, introtimer / 10);
    }
}
if ((state == "result" || state == "outro") && tookaphoto == true && subact != "bullets")
{
    if (!surface_exists(photo_surface))
    {
    }
    var _border_width = 10;
    var _border_offset = point_distance(0, 0, _border_width, _border_width);
    var _scale = 1.5;
    var _px = x - ((photo_width * _scale) / 2);
    var _py = y - ((photo_height * _scale) / 2);
    draw_sprite_ext(spr_whitepixel, 0, _px - lengthdir_x(_border_offset, -45 + angle), _py - lengthdir_y(_border_offset, -45 + angle), (photo_width * _scale) + (_border_width * 2), (photo_height * _scale) + (_border_width * 2), angle, c_white, 1);
    draw_sprite_ext(screenshot, 0, _px, _py, _scale, _scale, angle, c_white, 1);
}
if (subact == "bullets" && flash_alpha > 0)
{
}
