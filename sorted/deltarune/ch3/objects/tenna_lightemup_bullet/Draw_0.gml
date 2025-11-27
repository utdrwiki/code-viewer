if (i_ex(obj_lightemup_controller))
{
    if (mysprite == 1169)
    {
        var xoffset = 0;
        var yoffset = 0;
        var xoffset2 = 0;
        var yoffset2 = 0;
        var scale = image_xscale;
        if (targetsprite == 229)
        {
            xoffset = 2;
            yoffset = 1;
        }
        if (targetsprite == 3065)
        {
            xoffset = 4;
            yoffset = 6;
        }
        if (targetsprite == 3860)
        {
            xoffset = 4;
            yoffset = 0;
        }
        if (targetsprite == 4760)
        {
            image_angle += 4;
            xoffset = 8;
            yoffset = 8;
        }
        if (targetsprite == 667)
        {
            xoffset = 6;
            yoffset = 6;
        }
        if (sprite_index == spr_ball_collision_full2)
        {
            if (targetsprite == 3860)
            {
                xoffset = 3;
                yoffset = 5;
            }
            if (targetsprite == 667)
            {
                xoffset = 9;
                yoffset = 7;
            }
            xoffset2 = -4;
            yoffset2 = -4;
        }
        if (sprite_index == spr_ball_collision_full_3xscale)
        {
            if (targetsprite == 4670)
            {
                xoffset = -12;
                yoffset = -14;
            }
            if (targetsprite == 3897)
            {
                xoffset = -8;
                yoffset = -8;
            }
            if (targetsprite == 510)
            {
                xoffset = -10;
                yoffset = -8;
            }
            if (targetsprite == 3986)
            {
                xoffset = -4;
                yoffset = -6;
            }
            if (targetsprite == 3360)
            {
                xoffset = 0;
                yoffset = -9;
            }
            xoffset2 = -18;
            yoffset2 = -18;
        }
        if (spritechangecon == 0)
        {
            var thickness = 2;
            var wave_maxa = sprite_get_height(sprite_index);
            var wobbleamount = 1;
            var _shakex = 0;
            if (hittimer == 5)
                _shakex = 5;
            if (hittimer == 4)
                _shakex = -4;
            if (hittimer == 3)
                _shakex = 3;
            if (hittimer == 2)
                _shakex = -2;
            if (hittimer == 1)
                _shakex = 1;
            if (hittimer == 0)
                _shakex = 0;
            for (i = 0; i < wave_maxa; i += thickness)
                draw_sprite_part_ext(sprite_index, 0, 0, i * thickness, 400, thickness + 2, ((x + _shakex + xoffset2) - 18) + (sin((spritechangesiner + (i * 8)) / 30) * wobbleamount), ((y + yoffset2) - 21) + (i * thickness) + (sin(spritechangesiner / 16) * 3), image_xscale, image_yscale, image_blend, 0.7);
            wave_maxa = sprite_get_height(targetsprite) * scale;
            for (i = 0; i < wave_maxa; i += thickness)
                draw_sprite_part_ext(targetsprite, 0, 0, i * thickness, 400, thickness + 2, ((x + _shakex) - 18) + xoffset + (sin((spritechangesiner + (i * 8)) / 30) * wobbleamount), (y - 21) + yoffset + (i * thickness * scale) + (sin(spritechangesiner / 16) * 3), scale, scale, image_blend, image_alpha);
        }
        if (spritechangecon == 1)
        {
            var thickness = 2;
            var wave_maxa = sprite_get_height(sprite_index);
            var wobbleamount = 1;
            var progress = obj_shadowman_sharpshoot_target.tennahp / obj_shadowman_sharpshoot_target.tennahpmax;
            var _rate = lerp(35, 80, progress);
            var wobblespeed = round(_rate / 5);
            spritechangesiner += spritechangespeed;
            spritechangetimer++;
            if (spritechangetimer < wobblespeed)
            {
                wobbleamount = lerp(1, 12, spritechangetimer / wobblespeed);
                spritechangespeed = lerp(1, 20, spritechangetimer / wobblespeed);
            }
            if (spritechangetimer == (wobblespeed - 2))
            {
                with (obj_lightemup_controller)
                {
                    if (extra_timer < 10)
                        extra_timer = 9;
                }
            }
            if (spritechangetimer == wobblespeed)
            {
                wobbleamount = 12;
                event_user(1);
            }
            if (spritechangetimer > wobblespeed)
            {
                wobbleamount = lerp(12, 1, (spritechangetimer - 15) / wobblespeed);
                spritechangespeed = lerp(20, 1, (spritechangetimer - 15) / wobblespeed);
            }
            if (spritechangetimer == (wobblespeed * 2))
            {
                spritechangetimer = 0;
                spritechangecon = 0;
            }
            var _shakex = 0;
            if (hittimer == 5)
                _shakex = 5;
            if (hittimer == 4)
                _shakex = -4;
            if (hittimer == 3)
                _shakex = 3;
            if (hittimer == 2)
                _shakex = -2;
            if (hittimer == 1)
                _shakex = 1;
            if (hittimer == 0)
                _shakex = 0;
            for (i = 0; i < wave_maxa; i += thickness)
                draw_sprite_part_ext(sprite_index, 0, 0, i * thickness, 400, thickness + 2, ((x + _shakex + xoffset2) - 18) + (sin((spritechangesiner + (i * 8)) / 30) * wobbleamount), ((y + yoffset2) - 21) + (i * thickness) + (sin(spritechangesiner / 16) * 3), image_xscale, image_yscale, image_blend, 0.7);
            wave_maxa = sprite_get_height(targetsprite);
            for (i = 0; i < wave_maxa; i += thickness)
                draw_sprite_part_ext(targetsprite, 0, 0, i * thickness, 400, thickness + 2, ((x + _shakex) - 18) + xoffset + (sin((spritechangesiner + (i * 8)) / 30) * wobbleamount), (y - 21) + yoffset + (i * thickness) + (sin(spritechangesiner / 16) * 3), image_xscale, image_yscale, image_blend, image_alpha);
        }
    }
    else
    {
        var _shakex = 0;
        if (hittimer == 5)
            _shakex = 5;
        if (hittimer == 4)
            _shakex = -4;
        if (hittimer == 3)
            _shakex = 3;
        if (hittimer == 2)
            _shakex = -2;
        if (hittimer == 1)
            _shakex = 1;
        if (hittimer == 0)
            _shakex = 0;
        draw_sprite_ext(sprite_index, image_index, x + _shakex, y, image_xscale, image_yscale, image_angle, image_blend, 0.5);
        draw_set_color(c_orange);
        draw_sprite_ext(mysprite, timer, (x + _shakex) - (16 * image_xscale), y - (30 * image_yscale), image_yscale / 1.5, image_xscale / 1.5, 0, c_white, image_alpha);
    }
}
