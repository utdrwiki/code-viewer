if (state == 0)
{
    draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, image_xscale, 2, 0, c_white, 1);
    if (eye_shine)
        draw_sprite_ext(spr_shine_white, eye_shine_anim, (x + 100 + 38) - 4, y + 16 + 8 + 4 + 2, 2, 2, 0, c_white, 1);
    if (undyne_catch)
    {
        undyne_anim += 0.3;
        draw_sprite_ext(spr_undyne_dw_caught, undyne_anim, x + 28, y + 26, 2, 2, 0, c_white, 1);
        if (!undyne_hat_release)
            draw_sprite_ext(spr_undyne_dw_hat, 0, x + 56, y + 30, 2, 2, 0, c_white, 1);
    }
    if (sword_active)
    {
        if (sword_appear)
        {
            alpha_siner += 1.5;
            if (sword_flash)
                current_alpha = sword_alpha + sin(alpha_siner);
            else
                current_alpha = 1;
            gpu_set_blendenable(false);
            gpu_set_colorwriteenable(false, false, false, true);
            draw_sprite_ext(spr_roaringknight_sword_mask, 0, x, y + y_base_pos, 2, 2, 0, c_white, current_alpha);
            draw_set_alpha(0);
            ossafe_fill_rectangle(x + 24 + 10, y + 58, x + 25 + 40 + 10, room_height, 0);
            draw_set_alpha(1);
            gpu_set_blendenable(true);
            gpu_set_colorwriteenable(true, true, true, true);
            gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
            gpu_set_alphatestenable(true);
            draw_sprite_ext(spr_roaringknight_sword, 0, x, y + y_base_pos, 2, 2, 0, c_white, 1);
            gpu_set_alphatestenable(false);
            gpu_set_blendmode(bm_normal);
        }
        else
        {
            draw_sprite_ext(spr_roaringknight_sword, 0, x, y + y_base_pos, 2, 2, 0, c_white, 1);
        }
    }
    if (grab_hand)
        draw_sprite_ext(spr_roaringknight_sword_grab_hand_new, image_index, x, y, 2, 2, 0, c_white, 1);
}
if (state == 1)
{
    draw_sprite_ext(reach_sprite, 3, x, y, 2, 2, 0, c_white, 1);
    if (susie_grab)
    {
        draw_sprite_ext(spr_susie_dw_fell_grab_no_hand, 0, susie_grab_x, susie_grab_y, 2, 2, 0, c_white, 1);
        susie_shake_timer--;
        if (susie_shake_timer <= 0)
        {
            susie_shake_timer = susie_shake_time;
            shake_offset = choose(0, 2);
        }
        draw_sprite_ext(spr_susie_dw_fell_grab_hand, 0, susie_grab_x + shake_offset, susie_grab_y, 2, 2, 0, c_white, 1);
    }
}
if (state == 6)
{
    draw_sprite_ext(spr_roaringknight_look_down_full, 0, x, y, 2, 2, 0, c_white, 1);
    if (susie_grab)
        draw_sprite_ext(spr_susie_dw_fell_grab, 0, susie_grab_x, susie_grab_y, 2, 2, 0, c_white, 1);
}
if (state >= 2)
    draw_sprite_ext(sprite_index, image_index, x + shakex, y + shakey, 2, 2, 0, c_white, 1);
