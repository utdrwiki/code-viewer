if (init == 0)
    exit;
timer++;
image_xscale = 2;
image_yscale = 2;
var tvheight = 40 * image_yscale;
var tvwidth = 40 * image_xscale;
var xx = x;
var yy = y;
draw_set_color(c_black);
ossafe_fill_rectangle(x, y, (x + (width * tvwidth)) - 1, (y + (height * tvheight)) - 1, false);
draw_set_color(c_white);
draw_set_blend_mode(bm_add);
for (var i = 0; i < array_length(_screen_list); i++)
{
    var screen = _screen_list[i];
    var screen_tile_pos = screen.get_tile_pos();
    var screen_tile_x = screen_tile_pos.x;
    var screen_tile_y = screen_tile_pos.y;
    var screen_sprite = screen.get_screen_sprite();
    var screen_image_index = screen.get_screen_image_index();
    var screen_offset = screen.get_screen_offset();
    draw_sprite_ext(screen_sprite, screen_image_index + screen_offset, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
draw_set_blend_mode(bm_normal);
for (var i = 0; i < array_length(_screen_list); i++)
{
    var screen = _screen_list[i];
    var screen_tile_pos = screen.get_tile_pos();
    var screen_tile_x = screen_tile_pos.x;
    var screen_tile_y = screen_tile_pos.y;
    if (drawborders)
        tvbasesprite = spr_dw_teevie_tv_base;
    draw_sprite_ext(tvbasesprite, 4, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, c_white, image_alpha);
    draw_sprite_ext(tvbasesprite, 1, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, screen.get_screen_color(), 0.6 + (sin((timer / 4) + screen_tile_x + screen_tile_y) * 0.1)), image_alpha);
    draw_sprite_ext(tvbasesprite, 2, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, merge_color(tvbasecolor, c_black, 0.5), image_alpha);
    draw_sprite_ext(tvbasesprite, 3, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, tvbasecolor, image_alpha);
    draw_sprite_ext(tvbasesprite, 5, x + (screen_tile_x * tvwidth), y + (screen_tile_y * tvheight), image_xscale, image_yscale, image_angle, c_white, image_alpha);
}
