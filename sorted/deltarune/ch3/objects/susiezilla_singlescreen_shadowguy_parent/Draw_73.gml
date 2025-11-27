mark_counter = scr_approach(mark_counter, 1, 0.1);
if (hitcon || state == states.dead)
    exit;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (object_index != obj_susiezilla_singlescreen_shadowguy_laser_machine)
{
    if (object_index == obj_susiezilla_singlescreen_shadowguy_in_dozer)
    {
        if (x < (camerax() - 32) || x > (camerax() + camerawidth() + 32))
        {
            var diir = (x < (camerax() - 32)) ? -1 : 1;
            var where = (camerax() + (camerawidth() * 0.5) + ((camerawidth() * 0.5 * diir) - (8 * diir))) - (sin(global.time * 0.4) * 2);
            draw_sprite_ext(spr_susiezilla_extremedanger_indicator, 0, where, y - 48, diir * 0.75 * mark_counter, 0.75 * mark_counter, 0, c_white, 1);
            if ((global.time % 6) < 3)
                draw_sprite_ext(spr_susiezilla_extremedanger_indicator, 1, where, y - 48, diir * 0.75 * mark_counter, 0.75 * mark_counter, 0, c_white, 1);
        }
    }
    else
    {
        if (x < (camerax() - 32))
            draw_sprite_ext(spr_susiezilla_enemy_indicator, 0, (camerax() + 8) - (sin(global.time * 0.4) * 2), y - 48, -mark_counter, mark_counter, 0, c_white, 1);
        if (x > (camerax() + camerawidth() + 32))
            draw_sprite_ext(spr_susiezilla_enemy_indicator, 0, ((camerax() + camerawidth()) - 8) + (sin(global.time * 0.4) * 2), y - 48, mark_counter, mark_counter, 0, c_white, 1);
    }
}
else if (x < (camerax() + 32) || x > ((camerax() + camerawidth()) - 32))
{
    var diir = (x < (camerax() + 32)) ? -1 : 1;
    var where = (camerax() + (camerawidth() * 0.5) + ((camerawidth() * 0.5 * diir) - (8 * diir))) - (sin(global.time * 0.4) * 2);
    draw_sprite_ext(spr_susiezilla_extremedanger_indicator, 0, where, y - 48, diir, 1, 0, c_white, 1);
    if ((global.time % 6) < 3)
        draw_sprite_ext(spr_susiezilla_extremedanger_indicator, 1, where, y - 48, diir, 1, 0, c_white, 1);
    if (state == states.charge)
    {
        for (aa = 0; aa < ((48 / max_charge) * state_timer); aa++)
        {
            var tempdir = 90 - (7.5 * aa);
            draw_sprite_ext(spr_susiezilla_extremedanger_bar, 0, (where + lengthdir_x(18, tempdir)) - (64 * diir), (y - 48) + lengthdir_y(18, tempdir), 1, 1, tempdir, c_white, 1);
        }
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(fnt_comicsans);
        draw_set_color(c_black);
        draw_text_transformed(where - (64 * diir) - 2, y - 54 - 2, string_format((state_timer / max_charge) * 100, 3, 1) + "%", 2, 2, ra);
        draw_text_transformed((where - (64 * diir)) + 2, (y - 52) + 2, string_format((state_timer / max_charge) * 100, 3, 1) + "%", 2, 2, ra);
        draw_text_transformed((where - (64 * diir)) + 2, y - 52 - 2, string_format((state_timer / max_charge) * 100, 3, 1) + "%", 2, 2, ra);
        draw_text_transformed(where - (64 * diir) - 2, (y - 52) + 2, string_format((state_timer / max_charge) * 100, 3, 1) + "%", 2, 2, ra);
        draw_set_color(c_maroon);
        draw_text_transformed(where - (64 * diir), y - 52, string_format((state_timer / max_charge) * 100, 3, 1) + "%", 2, 2, ra);
        draw_set_color(c_red);
        draw_text_transformed((where + rxo) - (64 * diir), (y - 52) + 2 + ryo, string_format((state_timer / max_charge) * 100, 3, 1) + "%", 2, 2, ra);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
    }
}
