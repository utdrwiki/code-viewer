draw_set_color(c_black);
ossafe_fill_rectangle(-80, cameray(), 0, room_height, 0);
draw_set_color(c_white);
if (split_start)
{
    x_pos = scr_movetowards(x_pos, target_x_pos, 2);
    interval_size = scr_movetowards(interval_size, target_interval_size, 2);
    var xx = camerax() + x_pos;
    draw_set_color(c_black);
    ossafe_fill_rectangle((xx + interval_size) - 1, cameray(), xx + interval_size + 1, room_height, 0);
    draw_set_color(c_white);
    draw_set_color(c_black);
    ossafe_fill_rectangle((xx + interval_size) - 1, cameray(), xx + 240, room_height, 0);
    draw_set_color(c_white);
    draw_set_color(c_black);
    ossafe_fill_rectangle((xx + 320) - 80 - 1, cameray(), ((xx + 320) - interval_size) + 1, room_height, 0);
    draw_set_color(c_white);
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    draw_set_alpha(0);
    ossafe_fill_rectangle(xx, cameray(), xx + interval_size, room_height, 0);
    draw_set_alpha(1);
    draw_set_alpha(0);
    ossafe_fill_rectangle(xx + 320, cameray(), (xx + 320) - interval_size, room_height, 0);
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    draw_sprite_ext(bg_myroom_dark, 0, xx, cameray(), 1, 1, 0, c_white, 1);
    draw_sprite_ext(kris_sprite, kris_index, xx + 155, cameray() + 68, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_kris_phone_floor, phone_index, (xx + 204) - 20, (cameray() + 168) - 47, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_kris_bed, 0, xx + 233, cameray() + 88, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_kris_bed_pillow_messy, 0, xx + 244, cameray() + 97, 1, 1, 0, c_white, 1);
    if (scr_flag_get(747) > 0)
    {
        draw_sprite_ext(spr_krisroom_star_dark, 0, xx + 247, cameray() + 42, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_pixel_white, 0, xx + 122, cameray() + 45, 3, 2, 0, #598291, 1);
    }
    if (scr_flag_get(748) > 0)
        draw_sprite_ext(spr_pixel_white, 0, xx + 264, cameray() + 160, 4, 5, 0, #004D64, 1);
    draw_sprite(spr_wheelbarrow_parts_dark, 4, xx + wagon_x + 5, cameray() + wagon_y + 1);
    draw_sprite(spr_wheelbarrow_parts_dark, 3, (xx + wagon_x + 5 + heartx + random(cageamt * 2)) - random(cageamt * 2), (cameray() + wagon_y + 1 + hearty + random(cageamt * 2)) - random(cageamt * 2));
    draw_sprite(spr_wheelbarrow_parts_dark, 2, (xx + wagon_x + 5 + random(cageamt)) - random(cageamt), (cameray() + wagon_y + 1 + random(cageamt)) - random(cageamt));
    draw_sprite(spr_wheelbarrow_parts_dark, 1, xx + wagon_x + 5, cameray() + wagon_y + 1);
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
}
else
{
    draw_sprite_ext(bg_myroom_dark, 0, camerax(), cameray(), 1, 1, 0, c_white, 1);
    draw_sprite_ext(kris_sprite, 0, camerax() + 155, cameray() + 68, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_kris_phone_floor, 0, (camerax() + 204) - 20, (cameray() + 168) - 47, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_kris_bed, 0, camerax() + 233, cameray() + 88, 1, 1, 0, c_white, 1);
    draw_sprite_ext(spr_kris_bed_pillow_messy, 0, camerax() + 244, cameray() + 97, 1, 1, 0, c_white, 1);
    if (scr_flag_get(747) > 0)
    {
        draw_sprite_ext(spr_krisroom_star_dark, 0, camerax() + 247, cameray() + 42, 1, 1, 0, c_white, 1);
        draw_sprite_ext(spr_pixel_white, 0, camerax() + 122, cameray() + 45, 3, 2, 0, #598291, 1);
    }
    if (scr_flag_get(748) > 0)
        draw_sprite_ext(spr_pixel_white, 0, camerax() + 264, cameray() + 160, 4, 5, 0, #004D64, 1);
    draw_sprite(spr_wheelbarrow_parts_dark, 4, camerax() + wagon_x + 5, cameray() + wagon_y + 1);
    draw_sprite(spr_wheelbarrow_parts_dark, 3, (camerax() + wagon_x + 5 + heartx + random(cageamt * 2)) - random(cageamt * 2), (cameray() + wagon_y + 1 + hearty + random(cageamt * 2)) - random(cageamt * 2));
    draw_sprite(spr_wheelbarrow_parts_dark, 2, (camerax() + wagon_x + 5 + random(cageamt)) - random(cageamt), (cameray() + wagon_y + 1 + random(cageamt)) - random(cageamt));
    draw_sprite(spr_wheelbarrow_parts_dark, 1, camerax() + wagon_x + 5, cameray() + wagon_y + 1);
}
