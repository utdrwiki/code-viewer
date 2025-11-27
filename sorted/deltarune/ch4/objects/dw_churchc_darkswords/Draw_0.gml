if (con < 99)
{
    var _hx = obj_mainchara.x + 12 + 8;
    var _hy = obj_mainchara.y + 40 + 8;
    if (i_ex(cutscene_master) && i_ex(kr_actor))
    {
        _hx = kr_actor.x + 12 + 8;
        _hy = kr_actor.y + 40 + 8;
    }
    if (draw_heart_effect)
    {
        siner += 1.5;
        draw_sprite_ext(spr_heart_white, image_index, _hx, _hy, siner / 4, siner / 4, 0, c_white, 1.6 - (siner / 16));
        draw_sprite_ext(spr_heart_white, image_index, _hx, _hy, siner / 8, siner / 8, 0, c_white, 1.6 - (siner / 24));
        if ((siner / 24) > 1.6)
            draw_heart_effect = false;
    }
    if (i_ex(flash))
    {
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(spr_heart_white, image_index, _hx, _hy, 2, 2, 0, c_white, flash.image_alpha * 0.5);
        draw_sprite_ext(spr_heart_white, image_index, _hx, _hy, 3 + flash.image_alpha, 3 + flash.image_alpha, 0, c_white, flash.image_alpha * 0.3);
        gpu_set_blendmode(bm_normal);
    }
}
