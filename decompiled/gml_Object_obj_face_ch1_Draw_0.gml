facechange -= 1
if (nowface != global.fc)
    facechange = 3
if (facechange <= 0)
{
    if (global.fc == 1)
    {
        if (global.flag[29] == 0)
        {
            face = spr_face_s0_ch1
            if (global.fe == 1)
                face = spr_face_s1_ch1
            if (global.fe == 2)
                face = spr_face_s2_ch1
            if (global.fe == 3)
                face = spr_face_s3_ch1
            if (global.fe == 4)
                face = spr_face_s4_ch1
            if (global.fe == 5)
                face = spr_face_s5_ch1
            if (global.fe == 6)
                face = spr_face_s6_ch1
            if (global.fe == 7)
                face = spr_face_s7_ch1
            if (global.fe == 8)
                face = spr_face_s8_ch1
            if (global.fe == 9)
                face = spr_face_s9_ch1
            if (global.fe == 10)
                face = spr_face_sA_ch1
            if (global.fe == 11)
                face = spr_face_sB_ch1
            if (global.fe == 12)
                face = spr_face_sC_ch1
            if (global.fe == 13)
                face = spr_face_sD_ch1
            draw_sprite_ext(face, face_index, (x - 5), y, f, f, 0, c_white, 1)
        }
        else
        {
            face = spr_face_susie_alt_ch1
            face_index = global.fe
            draw_sprite_ext(face, face_index, (x - 5), y, f, f, 0, c_white, 1)
        }
    }
    if (global.fc == 2)
    {
        face = spr_face_r_dark_ch1
        if (global.flag[30] == 1)
            face = spr_face_r_hood_ch1
        if (global.flag[30] == 2)
            face = spr_face_r_nohat_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 15), (y - 10), f, f, 0, c_white, 1)
    }
    if (global.fc == 3)
    {
        face = spr_face_n_matome_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 12), (y - 10), f, f, 0, c_white, 1)
    }
    if (global.fc == 4)
    {
        draw_sprite_ext(spr_face_tbody_ch1, 0, (x - 7), (y + 29), f, f, 0, c_white, 1)
        face = spr_face_t0_ch1
        if (global.fe == 1)
            face = spr_face_t1_ch1
        if (global.fe == 2)
            face = spr_face_t2_ch1
        if (global.fe == 3)
            face = spr_face_t3_ch1
        if (global.fe == 4)
            face = spr_face_t4_ch1
        if (global.fe == 5)
            face = spr_face_t5_ch1
        if (global.fe == 6)
            face = spr_face_t6_ch1
        if (global.fe == 7)
            face = spr_face_t7_ch1
        if (global.fe == 8)
            face = spr_face_t8_ch1
        if (global.fe == 9)
            face = spr_face_t9_ch1
        draw_sprite_ext(face, face_index, x, y, f, f, 0, c_white, 1)
    }
    if (global.fc == 5)
    {
        face = spr_face_l0_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 15), (y - 10), f, f, 0, c_white, 1)
    }
    if (global.fc == 6)
    {
        face = spr_face_sans0_ch1
        if (global.fe == 1)
            face = spr_face_sans1_ch1
        if (global.fe == 2)
            face = spr_face_sans2_ch1
        if (global.fe == 3)
            face = spr_face_sans3_ch1
        if (global.fe == 4)
            face = spr_face_sans4_ch1
        if (global.fe == 5)
            face = spr_face_sans5_ch1
        draw_sprite_ext(face, face_index, x, y, f, f, 0, c_white, 1)
    }
    if (global.fc == 9)
    {
        face = spr_face_undyne_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 10)
    {
        face = spr_face_asgore0_ch1
        if (global.fe == 1)
            face = spr_face_asgore1_ch1
        if (global.fe == 2)
            face = spr_face_asgore2_ch1
        if (global.fe == 3)
            face = spr_face_asgore3_ch1
        if (global.fe == 4)
            face = spr_face_asgore4_ch1
        if (global.fe == 5)
            face = spr_face_asgore5_ch1
        if (global.fe == 6)
            face = spr_face_asgore6_ch1
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 11)
    {
        face = spr_alphysface_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 12)
    {
        face = spr_face_b0_ch1
        if (global.fe == 1)
            face = spr_face_b1_ch1
        if (global.fe == 2)
            face = spr_face_b2_ch1
        if (global.fe == 3)
            face = spr_face_b3_ch1
        if (global.fe == 4)
            face = spr_face_b4_ch1
        if (global.fe == 5)
            face = spr_face_b5_ch1
        if (global.fe == 6)
            face = spr_face_b1_ch1
        if (global.fe == 7)
            face = spr_face_b1_ch1
        if (global.fe == 8)
            face = spr_face_b1_ch1
        if (global.fe == 9)
            face = spr_face_b1_ch1
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 13)
    {
        face = spr_face_c0_ch1
        if (global.fe == 1)
            face = spr_face_c1_ch1
        if (global.fe == 2)
            face = spr_face_c2_ch1
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 14)
    {
        face = spr_face_jock0_ch1
        if (global.fe == 1)
            face = spr_face_jock1_ch1
        if (global.fe == 1)
            face = spr_face_jock2_ch1
        if (global.fe == 1)
            face = spr_face_jock3_ch1
        if (global.fe == 1)
            face = spr_face_jock4_ch1
        if (global.fe == 1)
            face = spr_face_jock5_ch1
        if (global.fe == 1)
            face = spr_face_jock6_ch1
        if (global.fe == 1)
            face = spr_face_jock7_ch1
        if (global.fe == 1)
            face = spr_face_jock8_ch1
        if (global.fe == 1)
            face = spr_face_jock9_ch1
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 15)
    {
        face = spr_face_rudy_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 12), (y - 10), f, f, 0, c_white, 1)
    }
    if (global.fc == 16)
    {
        face = spr_face_catty_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 17)
    {
        face = spr_face_bratty_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 5), (y + 2), f, f, 0, c_white, 1)
    }
    if (global.fc == 18)
    {
        face = spr_face_rurus_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 10), y, f, f, 0, c_white, 1)
    }
    if (global.fc == 19)
    {
        face = spr_face_burgerpants_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 5), (y - 5), f, f, 0, c_white, 1)
    }
    if (global.fc == 20)
    {
        face = spr_face_king_ch1
        face_index = global.fe
        draw_sprite_ext(face, face_index, (x - 5), (y - 5), f, f, 0, c_white, 1)
    }
}
nowface = global.fc
