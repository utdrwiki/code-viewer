var _descent = 10;
var _spread = scr_ease_inout(clamp01(timer / 20), 4) * 20;
var _length = 360 + (sin((_spread / 180) * pi) * 20);
var _width = lengthdir_x(_length, 270 + (_spread / 2));
var _spotlight_height = (ystart - 300) + 360;
draw_set_color(#FFCF6D);
draw_set_alpha(image_alpha / 2);
d_ellipse(xstart - _width, _spotlight_height - (_width / 4), xstart + _width, _spotlight_height + (_width / 4), false);
if (timer == _descent)
{
    var _sparkle = snd_play(snd_sparkle_glock);
    snd_pitch(_sparkle, 1.1);
    var _feather = instance_create_depth(xstart - 10, ystart - 50, depth + 10, obj_cherub_feathers);
    _feather.direction = 270 + irandom_range(-30, -50);
    _feather = instance_create_depth(xstart, ystart - 50, depth + 10, obj_cherub_feathers);
    _feather.direction = 270 + irandom_range(-10, 10);
    _feather = instance_create_depth(xstart + 10, ystart - 50, depth + 10, obj_cherub_feathers);
    _feather.direction = 270 + irandom_range(30, 50);
}
d3d_set_fog(true, #FFB56C, 0, 1);
draw_sprite_ext(target_char.sprite_index, target_char.image_index, target_char.x, target_char.y - 2, 2, 2, 0, #FFB56C, _spread * image_alpha);
d3d_set_fog(false, c_black, 0, 1);
draw_sprite_ext(target_char.sprite_index, target_char.image_index, target_char.x, target_char.y, 2, 2, 0, #807976, _spread * image_alpha);
with (obj_cherub_feathers)
    draw_self();
surface_set_target(silhouette_surf);
draw_clear_alpha(c_black, 0);
draw_sprite_ext(target_char.sprite_index, target_char.image_index, target_char.x - (xstart - 64), target_char.y - (ystart - 300) - 2, 2, 2, 0, #807976, 1);
draw_sprite_ext(target_char.sprite_index, target_char.image_index, target_char.x - (xstart - 64), target_char.y - (ystart - 300), 2, 2, 0, #807976, 1);
gpu_set_alphatestenable(true);
draw_set_blend_mode(bm_subtract);
with (obj_cherub_feathers)
    draw_self_surfacespace(other.xstart - 64, other.ystart - 300);
gpu_set_alphatestenable(false);
surface_reset_target();
surface_set_target(light_surf);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_normal);
scr_draw_beam(64, 0, _length, _spread, 270, c_white, 1, false);
draw_set_alpha(1);
d3d_set_fog(true, c_white, 0, 1);
d_ellipse(64 - _width, 360 - (_width / 4), 64 + _width, 360 + (_width / 4), false);
draw_set_alpha(1);
draw_set_blend_mode(bm_subtract);
gpu_set_alphatestenable(true);
draw_surface(silhouette_surf, 0, 0);
gpu_set_alphatestenable(false);
draw_set_blend_mode(bm_normal);
d3d_set_fog(false, c_black, 0, 1);
surface_reset_target();
draw_surface_ext(light_surf, xstart - 64, ystart - 300, 1, 1, 0, #FFB56C, image_alpha * 0.5);
if (timer >= (_descent + 24))
{
    x = xstart;
    y = ystart;
    if (timer == (_descent + 24))
    {
        var d = instance_create(xstart + 30 + xoff, ystart + yoff, obj_animation);
        d.sprite_index = sprite_index;
        d.image_yscale = 2;
        d.image_xscale = 2;
    }
    else if (timer == (_descent + 48))
    {
    }
    else if (timer >= (_descent + 48))
    {
        image_alpha -= 0.1;
        if (image_alpha <= 0)
        {
            surface_free(silhouette_surf);
            surface_free(light_surf);
            instance_destroy();
        }
    }
}
else if (timer >= _descent && timer <= (_descent + 24))
{
    x = xstart;
    var _ylerp = timer - _descent;
    y = lerp(yspawn, ystart + yoff, clamp(_ylerp / 25, 0, 1));
    if ((timer % 2) == 0)
    {
        var d = instance_create(x + (cos((timer / 3) + offset) * 30), y + (sin((timer / 3) + offset) * 10), obj_animation);
        d.sprite_index = spr_sparestar_anim;
        d.image_speed = 0.5;
        d.image_blend = choose(#FFE04D, #FFB56C);
        d.image_xscale = 2;
        d.image_yscale = 2;
    }
}
timer++;
