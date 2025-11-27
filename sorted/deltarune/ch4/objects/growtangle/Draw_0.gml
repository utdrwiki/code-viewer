if (global.chapter == 4 && instance_exists(obj_sound_of_justice_enemy) && obj_sound_of_justice_enemy.growtangleredcon > 0)
    draw_sprite_ext(spr_battlebg_0_whitebg, 1, x, y, image_xscale, image_yscale, image_angle, c_red, obj_sound_of_justice_enemy.growtangleredtimer / 10);
else
    draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if (customBox && growth && growcon != 2)
{
    var _scale = sizer * growscale;
    draw_sprite_ext(spr_custom_box, 0, x, y, _scale, _scale, image_angle, image_blend, image_alpha);
}
else
{
    draw_self();
}
if (global.chapter == 4)
{
    if (instance_exists(obj_sound_of_justice_enemy) && instance_exists(obj_spearblocker) && instance_exists(obj_heart))
    {
        var _r = lerp(0, 22, obj_spearblocker.shadowpower / 1);
        var _c = obj_spearblocker.light_green;
        draw_sprite_ext(spr_sneo_bigcircle, 0, obj_heart.x + 10, obj_heart.y + 10, _r / 25, _r / 25, 0, _c, 1);
    }
}
