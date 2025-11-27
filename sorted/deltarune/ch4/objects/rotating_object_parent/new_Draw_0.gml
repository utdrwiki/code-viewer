var camy = cameray();
if (dodraw == true)
{
    if (x > obj_rotating_tower_controller_new.tower_circumference)
        x -= obj_rotating_tower_controller_new.tower_circumference;
    depth = obj_rotating_tower_controller_new.depth - 10;
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
else if ((y + sprite_height) >= camy && y <= (camy + cameraheight()) && darken_alpha < 1)
{
    var col = merge_color(image_blend, c_black, darken_alpha);
    draw_sprite_ext(sprite_index, image_index, tower_x, y, image_xscale, image_yscale, image_angle, col, image_alpha);
}
