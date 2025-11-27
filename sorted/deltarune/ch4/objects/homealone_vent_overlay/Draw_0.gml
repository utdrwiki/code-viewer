if (!is_active)
    exit;
if (!i_ex(obj_homealone_heart))
{
    if (room == room_lw_noellehouse_closet)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], 99, false);
        draw_set_color(c_white);
    }
    else if (room == room_lw_noellehouse_dess)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(0, 0, view_wport[0], 45, false);
        ossafe_fill_rectangle(0, cameray(), 19, view_hport[0], false);
        draw_set_color(c_white);
        gpu_set_blendenable(false);
        gpu_set_colorwriteenable(false, false, false, true);
        draw_set_alpha(0);
        ossafe_fill_rectangle(camerax() + 20, 46, 260, 219, false);
        ossafe_fill_rectangle(125, 220, 164, cameray() + view_hport[0], false);
        draw_set_alpha(1);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true, true, true, true);
        gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
        draw_set_color(c_white);
        d3d_set_fog(false, c_black, 0, 0);
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);
    }
    else if (room == room_lw_noellehouse_noelle)
    {
        gpu_set_blendenable(false);
        gpu_set_colorwriteenable(false, false, false, true);
        draw_sprite_ext(bg_noellehouse_noelle_mask, 0, 0, 0, 1, 1, 0, c_white, 1);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true, true, true, true);
        gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
        draw_set_color(c_black);
        ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
        draw_set_color(c_white);
        d3d_set_fog(false, c_black, 0, 0);
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);
    }
    else if (room == room_lw_noellehouse_bathroom)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(0, 0, camerax() + view_wport[0], 39, false);
        ossafe_fill_rectangle(0, 0, 78, cameray() + view_hport[0], false);
        draw_set_color(c_white);
    }
    else if (room == room_lw_noellehouse_kitchen)
    {
        draw_set_color(c_black);
        ossafe_fill_rectangle(0, 0, 79, room_height, false);
        ossafe_fill_rectangle(0, 0, room_width, 29, false);
        ossafe_fill_rectangle(0, 220, 119, room_height, false);
        ossafe_fill_rectangle(160, 220, room_width, room_height, false);
        ossafe_fill_rectangle(648, 29, room_width, room_height, false);
        draw_set_color(c_white);
    }
}
else
{
    if (!is_init)
    {
        is_init = true;
        if (room == room_lw_noellehouse_kitchen)
        {
            kitchen_exit = scr_marker(120, 220, spr_pixel_white);
            with (kitchen_exit)
            {
                image_blend = #201E33;
                image_xscale = 10;
                image_yscale = 10;
                depth = 999990;
            }
        }
    }
    if (room == room_lw_noellehouse_noelle)
        exit;
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    if (room == room_lw_noellehouse_noelle)
        draw_sprite_ext(bg_noellehouse_noelle_mask, 0, 0, 0, 1, 1, 0, c_white, 1);
    draw_set_alpha(0);
    if (obj_homealone_heart.visible)
    {
        d_circle(obj_homealone_heart.x + 4, obj_homealone_heart.y, circle_radius, false);
        draw_set_alpha(1);
        scr_draw_circle_lowres(obj_homealone_heart.x + 4, obj_homealone_heart.y, circle_radius, false, true);
        draw_set_alpha(0);
    }
    if (room == room_lw_noellehouse_closet)
        ossafe_fill_rectangle(camerax(), 100, camerax() + view_wport[0], cameray() + view_hport[0], false);
    if (room == room_lw_noellehouse_dess)
    {
        ossafe_fill_rectangle(20, 46, 260, 219, false);
        var block_door = (!scr_sideb_active() || global.plot > 63) && global.plot == 66;
        if (block_door)
            ossafe_fill_rectangle(125, 220, 164, cameray() + view_hport[0], false);
        if (i_ex(obj_homealone_dess_closet_controller))
        {
            if (obj_homealone_dess_closet_controller.con > 0)
                ossafe_fill_rectangle(108, 1, camerax() + view_wport[0], 120, false);
        }
    }
    if (room == room_lw_noellehouse_kitchen)
        ossafe_fill_rectangle(80, 30, 647, 219, false);
    if (room == room_lw_noellehouse_bathroom)
        ossafe_fill_rectangle(79, 40, 260, 240, false);
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + view_wport[0], cameray() + view_hport[0], false);
    draw_set_color(c_white);
    d3d_set_fog(false, c_black, 0, 0);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
}
if (room == room_lw_noellehouse_dess)
{
    if (global.plot >= 66)
    {
        draw_set_color(c_black);
        draw_set_alpha(0.5);
        ossafe_fill_rectangle(0, 45, 108, room_height, false);
        ossafe_fill_rectangle(109, 120, room_width + 200, room_height, false);
        draw_set_alpha(1);
        if (dess_closet_fade_in)
            dess_closet_alpha = scr_movetowards(dess_closet_alpha, dess_closet_alpha_target, 0.025);
        draw_set_alpha(dess_closet_alpha);
        ossafe_fill_rectangle(109, 45, room_width, 119, false);
        draw_set_alpha(1);
        ossafe_fill_rectangle(0, 0, 108, 45, false);
        draw_set_color(c_white);
    }
    if (dess_closet_cover)
    {
        draw_sprite_ext(spr_pixel_white, 0, x, -20, 100, 16.5, 0, c_black, 1);
        draw_sprite_ext(spr_pixel_white, 0, 260, y + 30, 30, 23, 0, c_black, 1);
    }
}
