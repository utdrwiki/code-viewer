if (is_active || inactive_cleanup)
{
    if inactive_cleanup
    {
        cleanup_timer++
        if (cleanup_timer >= 60 && frontshadOpacity <= 0)
            inactive_cleanup = 0
    }
    if (fade_in && (!fade_cleanup))
    {
        fade_timer++
        if (fade_timer == 1)
            scr_lerpvar_instance(id, "frontshadOpacity", 0, 0.6, 5)
        if (fade_timer == 25)
        {
            fade_in = 0
            fade_timer = 0
            scr_lerpvar_instance(id, "frontshadOpacity", 0.6, 0, 15)
        }
    }
    shadow_char[0].sprite_index = obj_mainchara.sprite_index
    shadow_char[0].image_xscale = obj_mainchara.image_xscale
    shadow_char[0].image_yscale = obj_mainchara.image_yscale
    shadow_char[0].x = obj_mainchara.x
    shadow_char[0].y = (obj_mainchara.y + 4)
    shadow_char[0].image_blend = frontShadowColor
    shadow_char[0].image_alpha = frontshadOpacity
    shadow_char[0].image_index = obj_mainchara.image_index
    shadow_char[0].depth = (obj_mainchara.depth - 1)
    if i_ex(obj_caterpillarchara)
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
            {
                var sus_x = x
                var sus_y = y
                var sus_sprite = sprite_index
                var sus_index = image_index
                var sus_depth = depth
            }
            if (name == "ralsei")
            {
                var ral_x = x
                var ral_y = y
                var ral_sprite = sprite_index
                var ral_index = image_index
                var ral_depth = depth
            }
        }
        if (sus_x != 0)
        {
            shadow_char[1].sprite_index = sus_sprite
            shadow_char[1].image_xscale = 2
            shadow_char[1].image_yscale = 2
            shadow_char[1].x = sus_x
            shadow_char[1].y = (sus_y + 4)
            shadow_char[1].image_blend = frontShadowColor
            shadow_char[1].image_alpha = frontshadOpacity
            shadow_char[1].image_index = sus_index
            shadow_char[1].depth = (sus_depth - 1)
        }
        if (ral_x != 0)
        {
            shadow_char[2].sprite_index = ral_sprite
            shadow_char[2].image_xscale = 2
            shadow_char[2].image_yscale = 2
            shadow_char[2].x = ral_x
            shadow_char[2].y = (ral_y + 4)
            shadow_char[2].image_blend = frontShadowColor
            shadow_char[2].image_alpha = frontshadOpacity
            shadow_char[2].image_index = ral_index
            shadow_char[2].depth = (ral_depth - 1)
        }
    }
    if i_ex(obj_interactablesolid)
    {
        with (obj_interactablesolid)
            var hacker_depth = depth
        shadow_char[(shadow_total - 1)].image_alpha = frontshadOpacity
        shadow_char[(shadow_total - 1)].depth = (hacker_depth - 1)
    }
}
