var _cw = 640;
var _ch = 480;
var _cx = camerax();
var _cy = cameray();
if (!surface_exists(surf))
{
    _cw = camera_get_view_width(view_camera[0]);
    _ch = camera_get_view_height(view_camera[0]);
    surf = surface_create(_cw, _ch);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    ossafe_fill_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
}
else if (surface_exists(surf))
{
    surface_set_target(surf);
    draw_set_color(c_black);
    draw_set_alpha(1);
    ossafe_fill_rectangle(0, 0, _cw, _ch, 0);
    gpu_set_blendmode(bm_subtract);
    var lay_id = layer_get_id("TILES_FLOOR_0");
    var map_id = layer_tilemap_get_id(lay_id);
    draw_tilemap(map_id, 0 - _cx, 0 - _cy);
    with (obj_caterpillarchara)
    {
        image_alpha = 0;
        if (name == "susie")
        {
            gpu_set_blendmode(bm_normal);
            draw_sprite_ext(sprite_index, image_index, x - _cx, (y - _cy) + (sprite_height * 2) + 10, image_xscale, -image_yscale, 0, c_black, 0.65);
            gpu_set_blendmode(bm_normal);
            d3d_set_fog(true, c_purple, 0, 0);
            draw_sprite_ext(sprite_index, image_index, x - _cx, y - _cy, image_xscale, image_yscale, 0, c_white, 1);
            gpu_set_blendmode(bm_normal);
            d3d_set_fog(true, c_black, 0, 0);
            draw_sprite_ext(sprite_index, image_index, x - _cx, (y - _cy) + 4, image_xscale, image_yscale, 0, c_white, 1);
            d3d_set_fog(false, c_black, 0, 0);
        }
        if (name == "ralsei")
        {
            gpu_set_blendmode(bm_normal);
            draw_sprite_ext(sprite_index, image_index, x - _cx, (y - _cy) + (sprite_height * 2) + 10, image_xscale, -image_yscale, 0, c_black, 0.65);
            gpu_set_blendmode(bm_normal);
            d3d_set_fog(true, c_green, 0, 0);
            draw_sprite_ext(sprite_index, image_index, x - _cx, y - _cy, image_xscale, image_yscale, 0, c_white, 1);
            gpu_set_blendmode(bm_normal);
            d3d_set_fog(true, c_black, 0, 0);
            draw_sprite_ext(sprite_index, image_index, x - _cx, (y - _cy) + 4, image_xscale, image_yscale, 0, c_white, 1);
            d3d_set_fog(false, c_black, 0, 0);
        }
    }
    with (obj_mainchara)
    {
        gpu_set_blendmode(bm_normal);
        draw_sprite_ext(sprite_index, image_index, x - _cx, ((y - _cy) + (sprite_height * 2)) - 4, image_xscale, -image_yscale, 0, c_black, 0.65);
        gpu_set_blendmode(bm_normal);
        d3d_set_fog(true, c_blue, 0, 0);
        draw_sprite_ext(sprite_index, image_index, x - _cx, y - _cy, image_xscale, image_yscale, 0, c_white, 1);
        gpu_set_blendmode(bm_normal);
        d3d_set_fog(true, c_black, 0, 0);
        draw_sprite_ext(sprite_index, image_index, x - _cx, (y - _cy) + 4, image_xscale, image_yscale, 0, c_white, 1);
        d3d_set_fog(false, c_black, 0, 0);
    }
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    surface_reset_target();
    draw_surface(surf, _cx, _cy);
}
