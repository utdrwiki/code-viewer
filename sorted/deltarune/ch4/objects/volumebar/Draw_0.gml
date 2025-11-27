if (!surface_exists(volume_surf))
    volume_surf = surface_create(96, 250);
if (global.is_console || onSteamDeck())
{
    var xx = x - 14;
    var loc = 
    {
        lx: xx - 10,
        ly: y - 25,
        rx: xx + 36,
        ry: y - 25,
        sx: xx + 20,
        sy: y - 30,
        l: "L",
        r: "R"
    };
    var col = 8421504;
    if (!onSteamDeck())
    {
        if (scr_shoulder_lb() || scr_shoulder_rb())
            col = 16777215;
    }
    else
    {
        if (scr_shoulder_lb() || scr_shoulder_rb())
            col = 16777215;
        loc = 
        {
            lx: ((xx - 10) + 4) - 4,
            ly: ((y - 25) + 4) - 9,
            rx: (xx + 36 + 4) - 4,
            ry: ((y - 25) + 4) - 9,
            sx: xx + 20 + 4,
            sy: (y - 30) + 4,
            l: "L",
            r: "R"
        };
    }
    if (os_type == os_ps4 || os_type == os_ps5)
    {
        loc = 
        {
            lx: xx - 10 - 4,
            ly: y - 25 - 12,
            rx: (xx + 36) - 4,
            ry: y - 25 - 12,
            sx: xx + 20,
            sy: y - 30,
            l: "L",
            r: "R"
        };
    }
    col = merge_color(c_gray, c_white, clamp(obj_mike_controller.microphone_volume2 / 50, 0, 1));
    if (global.input_g[4] != gp_shoulderrb)
    {
        draw_set_color(col);
        draw_sprite_ext(scr_getbuttonsprite(loc.r, true), 0, lerp(loc.lx, loc.rx, 0.5), loc.ly, 2, 2, 0, col, 1);
    }
    else if (obj_gamecontroller.gamepad_shoulderlb_reassign)
    {
        draw_set_color(col);
        draw_sprite_ext(scr_getbuttonsprite(loc.l, true), 0, lerp(loc.lx, loc.rx, 0.5), loc.ly, 2, 2, 0, col, 1);
    }
    draw_set_color(-1);
}
surface_set_target(volume_surf);
draw_clear_alpha(c_white, 0);
draw_set_halign(fa_left);
draw_sprite(spr_tensionbar, 1, 0, 0);
var vol_x = 3;
var vol_y = 0;
var vol_w = 18;
var vol_h = 195;
draw_set_colour(merge_colour(c_red, c_black, 0.75));
ossafe_fill_rectangle(vol_x, vol_y, vol_x + vol_w, vol_y + (vol_h * 0.1), 0);
draw_set_colour(merge_colour(c_yellow, c_black, 0.75));
ossafe_fill_rectangle(vol_x, vol_y + (vol_h * 0.1), vol_x + vol_w, vol_y + (vol_h * 0.4), 0);
draw_set_colour(merge_colour(c_green, c_black, 0.75));
ossafe_fill_rectangle(vol_x, vol_y + (vol_h * 0.4), vol_x + vol_w, vol_y + (vol_h * 0.9), 0);
draw_set_colour(merge_colour(c_aqua, c_black, 0.75));
ossafe_fill_rectangle(vol_x, vol_y + (vol_h * 0.9), vol_x + vol_w, vol_y + vol_h, 0);
with (obj_mike_controller)
    microphone_volume2 += ((microphone_volume - microphone_volume2) * 0.25);
var vol_colour = 16776960;
if (obj_mike_controller.microphone_volume2 > 10)
    vol_colour = 65280;
if (obj_mike_controller.microphone_volume2 > 60)
    vol_colour = 65535;
if (obj_mike_controller.microphone_volume2 > 90)
    vol_colour = 255;
draw_set_colour(vol_colour);
ossafe_fill_rectangle(vol_x, vol_y + 1 + vol_h, vol_x + vol_w, ((vol_y - 2) + vol_h) - min(vol_h, (obj_mike_controller.microphone_volume2 / 100) * vol_h), 0);
gpu_set_blendmode(bm_subtract);
draw_sprite_ext(spr_tensionbar_cutout, 0, 0, 0, 1, 1, 0, c_white, 1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(volume_surf, x, y);
draw_sprite(spr_volume_logo, 0, x - 30, y + 30);
draw_set_color(c_white);
scr_84_set_draw_font("mainbig");
temp = round(obj_mike_controller.microphone_volume2);
if (temp < 100)
{
    draw_text(x - 30, y + 70, string(temp));
    draw_text(x - 25, y + 95, "%");
}
else
{
    draw_set_color(c_yellow);
    draw_text(x - 28, y + 70, "M");
    draw_text(x - 24, y + 90, "A");
    draw_text(x - 20, y + 110, "X");
}
