if (ticks <= -42)
    gpu_set_fog(true, c_white, 0, 1000);
if (ticks >= 0 || (abs(ticks) % 15) > 11)
{
    if (scare_con >= 1)
    {
        draw_sprite_ext(head_sprite, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        if (scare_con == 2 && face_timer < 30)
            face_timer++;
        var _spimmer = scr_ease_out(face_timer / 30, -3) * 180;
        draw_sprite_ext(mouth_sprite, 0, x, y + 20, image_xscale, image_yscale, image_angle + _spimmer, image_blend, image_alpha);
    }
    else
    {
        draw_self();
    }
}
gpu_set_fog(false, c_white, 0, 1000);
