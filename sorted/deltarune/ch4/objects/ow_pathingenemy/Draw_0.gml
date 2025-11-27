var dodraw = false;
var cx = camerax();
var cy = cameray();
var margin = 80;
if (x > (cx - margin) && x < (cx + 640 + margin) && y < (cy + 480 + margin) && y > (cy - margin))
    dodraw = true;
if (image_alpha < 0.1)
    dodraw = false;
if (dodraw)
{
    var count = 0;
    var dist = 999;
    if (instance_exists(obj_mainchara))
        dist = point_distance(x + 20, y + 20, obj_mainchara.x + 20, obj_mainchara.y + 40);
    var col = merge_color(c_white, c_black, clamp(dist / 140, 0, 0.85));
    image_blend = col;
    var spr = 2112;
    var scale = 1;
    var angle = idir * 90;
    var xoff = 20;
    var yoff = 20;
    if (sprite_index == spr_climb_chaseenemy_40_centercollision)
    {
        xoff = 0;
        yoff = 0;
        spr = sprite_index;
    }
    animindex += 0.25;
    if (neutralcon < 0)
        angle = image_angle + 90;
    var alpha = (1 - (dist / 80)) * image_alpha;
    if (dist < 80)
    {
        gpu_set_fog(1, c_red, 0, 0);
        draw_sprite_ext(spr, animindex, x + xoff + 2, y + yoff + 0, scale, scale, angle, c_white, alpha);
        draw_sprite_ext(spr, animindex, (x + xoff) - 2, y + yoff + 0, scale, scale, angle, c_white, alpha);
        draw_sprite_ext(spr, animindex, x + xoff + 0, y + yoff + 2, scale, scale, angle, c_white, alpha);
        draw_sprite_ext(spr, animindex, x + xoff + 0, (y + yoff) - 2, scale, scale, angle, c_white, alpha);
        draw_sprite_ext(spr, animindex, x + xoff + 4, y + yoff + 0, scale, scale, angle, c_white, alpha * 0.5);
        draw_sprite_ext(spr, animindex, (x + xoff) - 4, y + yoff + 0, scale, scale, angle, c_white, alpha * 0.5);
        draw_sprite_ext(spr, animindex, x + xoff + 0, y + yoff + 4, scale, scale, angle, c_white, alpha * 0.5);
        draw_sprite_ext(spr, animindex, x + xoff + 0, (y + yoff) - 4, scale, scale, angle, c_white, alpha * 0.5);
        gpu_set_fog(0, c_white, 0, 0);
    }
    var blend = merge_color(c_white, c_red, clamp(alpha, 0, 1));
    draw_sprite_ext(spr, animindex, x + xoff, y + yoff, scale, scale, angle, blend, image_alpha);
}
