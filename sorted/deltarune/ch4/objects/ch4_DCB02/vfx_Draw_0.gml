if (mode == 2)
{
    var window_offset = 40;
    draw_sprite_ext(spr_dw_church_windows_lightning, 0, 365, -26, 2, 2, 0, c_white, shadow_alpha);
    draw_sprite_ext(spr_dw_church_windows_lightning, 0, 495, -26, 2, 2, 0, c_white, shadow_alpha);
    draw_sprite_ext(spr_dw_church_windows_lightning, 0, 625, -26, 2, 2, 0, c_white, shadow_alpha);
    var tileMapA = layer_tilemap_get_id(layer_get_id("FLOORTILES"));
    draw_tilemap(tileMapA, 0, 0);
    draw_set_color(c_black);
    draw_set_alpha(shadow_alpha);
    ossafe_fill_rectangle(160, 280, 364, 320, false);
    ossafe_fill_rectangle(755, 280, room_width, 320, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    for (var i = 0; i < array_length_1d(target_characters); i++)
    {
        var character = target_characters[i];
        if (character != -4 && character.visible)
            draw_sprite_ext(character.sprite_index, character.image_index, character.x, character.y, 2, 2, 0, c_black, 1);
    }
    for (var i = 0; i < array_length_1d(target_characters); i++)
    {
        var character = target_characters[i];
        if (character != -4 && character.visible)
        {
            pal_swap_set(spr_palette_krs_statue, chara_palette_index, false);
            draw_sprite_ext(character.sprite_index, character.image_index, character.x, character.y, 2, 2, 0, c_white, silhouette_alpha);
            pal_swap_reset();
        }
    }
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false, false, false, true);
    for (var i = 0; i < array_length_1d(lightning_areas); i++)
    {
        var area = lightning_areas[i];
        draw_sprite_ext(spr_pixel_white, 0, area.x, area.y, area.image_xscale * 10, area.image_yscale * 10, 0, c_white, 0);
    }
    for (var i = 0; i < array_length_1d(lightning_mask_areas); i++)
    {
        var area = lightning_mask_areas[i];
        draw_sprite_ext(spr_pixel_white, 0, area.x, area.y, area.image_xscale * 10, area.image_yscale * 10, 0, c_white, shadow_alpha);
    }
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true, true, true, true);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
    gpu_set_alphatestenable(true);
    for (var i = 0; i < array_length_1d(target_characters); i++)
    {
        var character = target_characters[i];
        if (character != -4 && character.visible)
            draw_sprite_ext(character.sprite_index, character.image_index, character.x, character.y, 2, 2, 0, c_black, 1);
    }
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
}
if (follow_mode)
{
    if (party_kris == -4)
    {
        depth = 100000;
        var _kris = kris_target;
        party_kris = instance_create(_kris.x, _kris.y, obj_marker_palette);
        party_kris.current_palette = 4425;
        party_kris.palette_index = 1;
        party_kris.sprite_index = _kris.sprite_index;
        party_kris.image_index = _kris.image_index;
        party_kris.image_speed = 0;
        with (party_kris)
        {
            image_xscale = 2;
            image_yscale = 2;
            scr_stickto(_kris, -1);
        }
        var _ralsei = ralsei_target;
        party_ralsei = instance_create(_ralsei.x, _ralsei.y, obj_marker_palette);
        party_ralsei.current_palette = 4425;
        party_ralsei.palette_index = 1;
        party_ralsei.sprite_index = _ralsei.sprite_index;
        party_ralsei.image_index = _ralsei.image_index;
        party_ralsei.image_speed = 0;
        with (party_ralsei)
        {
            image_xscale = 2;
            image_yscale = 2;
            scr_stickto(_ralsei, -1);
        }
        var _susie = susie_target;
        party_susie = instance_create(_susie.x, _susie.y, obj_marker_palette);
        party_susie.current_palette = 4425;
        party_susie.palette_index = 1;
        party_susie.sprite_index = _susie.sprite_index;
        party_susie.image_index = _susie.image_index;
        party_susie.image_speed = 0;
        with (party_susie)
        {
            image_xscale = 2;
            image_yscale = 2;
            scr_stickto(_susie, -2);
        }
        var _statue = statue_target;
        var party_statue = instance_create(_statue.x, _statue.y, obj_marker_palette);
        party_statue.current_palette = 4425;
        party_statue.palette_index = 1;
        party_statue.sprite_index = _statue.sprite_index;
        with (party_statue)
        {
            image_xscale = 2;
            image_yscale = 2;
            scr_stickto(_statue, -1);
        }
    }
    party_kris.sprite_index = kris_target.sprite_index;
    party_kris.image_index = kris_target.image_index;
    party_kris.depth = kris_target.depth - 1;
    party_ralsei.sprite_index = ralsei_target.sprite_index;
    party_ralsei.image_index = ralsei_target.image_index;
    party_ralsei.depth = ralsei_target.depth - 1;
    party_susie.sprite_index = susie_target.sprite_index;
    party_susie.image_index = susie_target.image_index;
    party_susie.depth = susie_target.depth - 1;
}
