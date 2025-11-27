if (i_ex(obj_darkener) && i_ex(obj_growtangle) && i_ex(obj_titan_enemy))
{
    depth = obj_growtangle.depth + 2;
    var _image_alpha = obj_darkener.darkamt / 20;
    var _chargeshakex = obj_titan_enemy.chargeshakex * obj_titan_enemy.chargeshakexsign;
    if (obj_titan_enemy.starshootcon > 0 || obj_titan_enemy.myattackchoice == 4)
    {
        draw_sprite_ext(spr_cover_wings_defense_layer_4, obj_titan_enemy.siner, obj_titan_enemy.x + obj_titan_enemy.shakex + obj_titan_enemy.hurtspriteoffx + _chargeshakex, obj_titan_enemy.y + obj_titan_enemy.hurtspriteoffy, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, 1);
        with (obj_titan_enemy)
        {
            if (global.turntimer < 1)
            {
                chargecon = 0;
                chargeshakex = 0;
                chargetimer = 0;
            }
            _chargeshakex = chargeshakex * chargeshakexsign;
            if (chargecon == 1)
            {
                chargetimer++;
                chargeshakex = lerp(7, 0, chargetimer / chargetimermax);
                if (chargetimer >= chargetimermax)
                {
                    chargecon = 1.5;
                    chargetimer = 0;
                    chargeshakex = 0;
                }
                draw_sprite_ext(spr_titan_charge, (chargetimer * 3) / chargetimermax, x + _chargeshakex, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            }
            if (chargecon == 1.5)
                draw_sprite_ext(spr_titan_charge, 2, x + _chargeshakex, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            if (chargecon == 2)
            {
                chargetimer++;
                chargeshakex = lerp(20, 0, chargetimer / 6);
                draw_sprite_ext(spr_titan_charge, 3 + (chargetimer / 3), x + _chargeshakex, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
                if (chargetimer >= 6)
                {
                    chargetimer = 0;
                    chargecon = 0;
                }
            }
        }
        draw_sprite_ext(spr_titan_5_backwing, obj_titan_enemy.siner, obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, 1);
        draw_sprite_ext(spr_titan_6_backwing, obj_titan_enemy.siner, obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, 1);
        draw_sprite_ext(spr_titan_7_backwing, obj_titan_enemy.siner, obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, 1);
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_5_backwing, obj_titan_enemy.siner, obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, _image_alpha);
        draw_sprite_ext(spr_titan_6_backwing, obj_titan_enemy.siner, obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, _image_alpha);
        draw_sprite_ext(spr_titan_7_backwing, obj_titan_enemy.siner, obj_titan_enemy.x, obj_titan_enemy.y, obj_titan_enemy.image_xscale, obj_titan_enemy.image_yscale, 0, c_white, _image_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
}
