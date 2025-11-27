if (scr_debug())
{
    if (keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0, gp_face3))
    {
        background++;
        if (background >= 4)
            background = 0;
        with (obj_actor_tenna)
        {
            preset = irandom(37);
            if (preset >= 35)
                preset++;
        }
    }
}
if (background == 1)
    draw_sprite(spr_rhythmgame_bg, 4, 0, 0);
if (background == 2)
    draw_sprite_ext(bg_torhouse_bg, 0, -690, 0, 2, 2, 0, c_white, 1);
if (background == 3)
    draw_sprite_ext(spr_dw_susiezilla_bg_empty, 0, 0, 0, 2, 2, 0, c_white, 1);
with (obj_screen_channel_change)
{
    if (keyboard_check_pressed(ord("I")))
    {
        if (keyboard_check(vk_shift))
        {
            lifetime++;
            debug_print("lifetime: " + string(lifetime));
        }
        else
        {
            strength += 10;
            debug_print("stremgth: " + string(strength));
        }
    }
    else if (keyboard_check_pressed(ord("U")))
    {
        if (keyboard_check(vk_shift))
        {
            if (lifetime > 1)
                lifetime--;
            debug_print("lifetime: " + string(lifetime));
        }
        else if (strength > 0)
        {
            strength -= 10;
            debug_print("stremgth: " + string(strength));
        }
    }
    if (shader_check == 1)
    {
    }
    if (keyboard_check_pressed(ord("F")) || gamepad_button_check_pressed(0, gp_shoulderl) || gamepad_button_check_pressed(1, gp_shoulderl))
    {
        draw_end = !draw_end;
        if (draw_end)
            debug_print("1: effect handled in Draw End event");
        else
            debug_print("0: effect handled in Draw event");
    }
    if (keyboard_check_pressed(ord("B")) || gamepad_button_check_pressed(0, gp_face3) || gamepad_button_check_pressed(1, gp_face3))
        event_user(1);
    if (keyboard_check_pressed(ord("I")))
    {
        infinite = !infinite;
        if (infinite)
            timer = lifetime;
        debug_print("infinite: " + string(infinite));
    }
    if (keyboard_check_pressed(ord("V")) || gamepad_button_check_pressed(0, gp_face4) || gamepad_button_check_pressed(1, gp_face4))
    {
        scroll = !scroll;
        debug_print("scroll: " + string(scroll));
    }
}
