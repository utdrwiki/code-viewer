var _x = 0;
var _y = 0;
if (i_ex(obj_shake))
    _x = obj_shake.shakex;
if (i_ex(obj_shake))
    _y = obj_shake.shakey;
x = ((camerastartx + camerawidth()) - 494) + _x;
y = (camerastarty - 88) + _y;
var _rumblealpha;
if (rumble)
{
    rumbletimer++;
    if ((rumbletimer % 2) == 0)
        x += shakepow;
    else
        x -= shakepow;
    _rumblealpha = 0.2 + (sin(rumbletimer * 0.2) * 0.2);
}
if (drawstate == "defense" || drawstate == "defense end")
{
    x = ((camerastartx + camerawidth()) - 500) + shakex + hurtspriteoffx + _x;
    y = (camerastarty - 88) + hurtspriteoffy + _y;
}
fsiner++;
var _sinerspeed = 0.16666666666666666;
if (slowdowncon == 1)
{
    slowdowntimer++;
    if (slowdowntimer < 90)
        _sinerspeed = lerp(0.16666666666666666, 0.05, slowdowntimer / 90);
    else
        _sinerspeed = 0.05;
}
if (rumble || pre_rumble)
    _sinerspeed = rumbler / 18;
siner += _sinerspeed;
var _chargeshakex = chargeshakex * chargeshakexsign;
if (chargeshakexsign == 1)
    chargeshakexsign = -1;
else
    chargeshakexsign = 1;
if (drawstate == "idle" || drawstate == "rumble" || drawstate == "crack" || drawstate == "crack2")
{
    draw_sprite_ext(spr_titan_0_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_0_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_titan_1_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_1_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_titan_2_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_2_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_titan_3_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_3_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (starshootcon == 0)
    {
        if (shakex == 0 && drawstate != "crack" && !rumble)
        {
            draw_monster_body_part(spr_titan_4_backwing, siner, x, y);
        }
        else if ((shakex != 0 && drawstate == "crack") || rumble)
        {
            draw_monster_body_part(spr_titan_hurt, hurt_index, x + shakex + hurtspriteoffx, y + hurtspriteoffy);
            if (redflashtimer > 0)
            {
                d3d_set_fog(true, c_red, 0, 1);
                draw_sprite_ext(spr_titan_hurt, hurt_index, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, redflashtimer / 10);
                d3d_set_fog(false, c_black, 0, 0);
                redflashtimer--;
            }
        }
        else if (drawstate == "crack")
        {
            draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx + _chargeshakex, y + hurtspriteoffy);
            if (greenflashtimer > 0)
            {
                d3d_set_fog(true, c_lime, 0, 1);
                draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx + _chargeshakex, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
                d3d_set_fog(false, c_black, 0, 0);
            }
        }
        else if (starshootcon == 0 && shakex != 0 && drawstate != "crack" && drawstate != "crack2")
        {
            draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x, y);
        }
        else
        {
            draw_monster_body_part(spr_titan_4_backwing, siner, x, y);
        }
        if (darktimer > 0)
        {
            darktimer++;
            d3d_set_fog(true, c_black, 0, 1);
            if (darktimer < 30)
                draw_sprite_ext(spr_titan_4_backwing, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, lerp(0, 0.8, darktimer / 30));
            if (darktimer >= 30 && darktimer < 60)
                draw_sprite_ext(spr_titan_4_backwing, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, 0.8);
            if (darktimer >= 60 && darktimer < 90)
                draw_sprite_ext(spr_titan_4_backwing, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, lerp(0.8, 0, (darktimer - 60) / 30));
            d3d_set_fog(false, c_black, 0, 0);
            if (darktimer >= 90)
                darktimer = 0;
        }
        if (greenflashtimer > 0)
            greenflashtimer--;
    }
    if (starshootcon > 0)
    {
        var _color = merge_color(c_red, c_white, redflashtimer / 10);
        redsiner++;
        if (shakex == 0 && !rumble)
        {
            if (drawstate == "rumble")
                draw_monster_body_part(spr_titan_rumble, siner, x + shakex + hurtspriteoffx + _chargeshakex, y + hurtspriteoffy);
            else if (drawstate == "crack")
                draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx + _chargeshakex, y + hurtspriteoffy);
            else
                draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx + _chargeshakex, y + hurtspriteoffy);
            if (redflashtimer > 0)
            {
                d3d_set_fog(true, _color, 0, 1);
                draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, redflashtimer / 10);
                d3d_set_fog(false, c_black, 0, 0);
            }
            if (greenflashtimer > 0)
            {
                d3d_set_fog(true, c_lime, 0, 1);
                draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
                d3d_set_fog(false, c_black, 0, 0);
            }
            d3d_set_fog(true, c_red, 0, 1);
            draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, 0.1 + (sin(redsiner * 0.1) * 0.1));
            d3d_set_fog(false, c_black, 0, 0);
        }
        if (shakex != 0 || rumble)
        {
            draw_monster_body_part(spr_titan_hurt, hurt_index, x + shakex + hurtspriteoffx, y + hurtspriteoffy);
            if (redflashtimer > 0)
            {
                d3d_set_fog(true, _color, 0, 1);
                draw_sprite_ext(spr_titan_hurt, hurt_index, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, redflashtimer / 10);
                d3d_set_fog(false, c_black, 0, 0);
            }
            d3d_set_fog(true, c_red, 0, 1);
            draw_sprite_ext(spr_titan_hurt, hurt_index, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, 0.1 + (sin(redsiner * 0.1) * 0.1));
            d3d_set_fog(false, c_black, 0, 0);
        }
        if (redflashtimer > 0)
            redflashtimer--;
        if (greenflashtimer > 0)
            greenflashtimer--;
    }
    if (starshootcon == 0 && shakex != 0 && drawstate != "crack" && drawstate != "crack2")
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 6, x + shakex + hurtspriteoffx, y + hurtspriteoffy);
    if (starshootcon == 1)
    {
        draw_monster_body_part(spr_titan_star_dissolve, starshoottimer / 3, x + shakex + hurtspriteoffx, y + hurtspriteoffy);
        gpu_set_blendmode(bm_add);
        draw_sprite_ext(spr_titan_star_dissolve, starshoottimer / 3, x + shakex + hurtspriteoffx + (irandom_range(-2, 2) * 2), y + hurtspriteoffy + (irandom_range(-2, 2) * 2), image_xscale, image_yscale, image_angle, #444444, image_alpha);
        draw_sprite_ext(spr_titan_star_dissolve, starshoottimer / 3, x + shakex + hurtspriteoffx + (irandom_range(-2, 2) * 2), y + hurtspriteoffy + (irandom_range(-2, 2) * 2), image_xscale, image_yscale, image_angle, #444444, image_alpha);
        gpu_set_blendmode(bm_normal);
    }
    if (starshootcon == 3)
        draw_monster_body_part(spr_titan_star_appear, starshoottimer / 3, x + shakex + hurtspriteoffx, y + hurtspriteoffy);
    if (drawstate == "crack2")
    {
        hurttimer2++;
        if (hurttimer2 == 1)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_red, image_alpha);
        if (hurttimer2 == 2)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_red, image_alpha);
        if (hurttimer2 == 3)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        if (hurttimer2 == 4)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
        if (hurttimer2 == 5)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_black, image_alpha);
        if (hurttimer2 == 6)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_black, image_alpha);
        if (hurttimer2 > 6)
            draw_sprite_ext(spr_titan_star_break, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    }
    draw_sprite_ext(spr_titan_5_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_5_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_titan_6_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_6_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_titan_7_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (rumble)
    {
        d3d_set_fog(true, c_red, 0, 1);
        draw_sprite_ext(spr_titan_7_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, _rumblealpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (i_ex(obj_darkener))
    {
        draw_sprite_ext(spr_titan_5_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_titan_6_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_titan_7_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
}
if (drawstate == "defense")
{
    draw_sprite_ext(spr_cover_wings_defense_layer_0, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_1, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_2, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_3, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part(spr_titan_hurt, hurt_index, x, y);
    if (starshootcon == 0)
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 6, x, y);
    if (starshootcon == 3)
        draw_monster_body_part(spr_titan_star_appear, starshoottimer / 3, x, y);
    draw_sprite_ext(spr_cover_wings_defense_layer_5, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_6, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_7, defense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (defense_timer < 1)
    {
        defense_timer += 0.16666666666666666;
    }
    else if (defense_timer < 2)
    {
        defense_timer += 0.2;
    }
    else if (defense_timer < 3)
    {
        defense_timer += 0.25;
    }
    else if (defense_timer < 4)
    {
        defense_timer += (1/3);
    }
    else if (defense_timer < 5)
    {
        defense_timer += 0.5;
    }
    else if (defense_timer < 6)
    {
        defense_timer += (1/3);
    }
    else
    {
        drawstate = "defense end";
        defense_timer = 0;
    }
    if (defense_timer == 1)
        snd_play(snd_titan_wingshut);
    if (defense_timer == 2)
    {
        feathercon = 1;
        with (obj_heroparent)
        {
            var _adder = scr_add_instance_var(id, "siner", 4, 0, 30);
            _adder.roundvar = true;
        }
    }
}
if (drawstate == "defense end")
{
    if (spd < maxspd)
        spd += 0.2;
    var _spd = spd;
    var _distance = 4;
    var _xx = 0;
    var _yy = 0;
    rotation += _spd;
    var _c = dcos(rotation);
    var _s = dsin(rotation);
    _x = _xx + (_c * _distance) + (_s * _distance);
    _y = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos(rotation * -1);
    _s = dsin(rotation * -1);
    var _x2 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y2 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    _c = dcos(rotation - 90);
    _s = dsin(rotation - 90);
    var _x3 = _xx + (_c * _distance) + (_s * _distance);
    var _y3 = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos((rotation - 90) * -1);
    _s = dsin((rotation - 90) * -1);
    var _x4 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y4 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    _c = dcos(rotation - 180);
    _s = dsin(rotation - 180);
    var _x5 = _xx + (_c * _distance) + (_s * _distance);
    var _y5 = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos((rotation - 180) * -1);
    _s = dsin((rotation - 180) * -1);
    var _x6 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y6 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    _c = dcos(rotation - 270);
    _s = dsin(rotation - 270);
    var _x7 = _xx + (_c * _distance) + (_s * _distance);
    var _y7 = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos((rotation - 270) * -1);
    _s = dsin((rotation - 270) * -1);
    var _x8 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y8 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    if (rotation > 359)
        rotation -= 360;
    var __alpha = 0;
    if (darktimer > 0 && (phase == 8 || (phase == 7 && phaseturn == 3)))
    {
        if (darktimer > 0)
            darktimer++;
        if (darktimer >= 150)
            darktimer = 0;
        if (darktimer > 0 && darktimer < 100)
            __alpha = lerp(0, 0.9, darktimer / 100);
        if (darktimer >= 100 && darktimer < 110)
            __alpha = 0.9;
        if (darktimer >= 110 && darktimer < 120)
            __alpha = lerp(0.9, 0, (darktimer - 110) / 10);
    }
    else
    {
        if (darktimer > 0)
            darktimer++;
        if (darktimer >= 90)
            darktimer = 0;
        if (darktimer > 0 && darktimer < 70)
            __alpha = lerp(0, 0.9, darktimer / 70);
        if (darktimer >= 70 && darktimer < 80)
            __alpha = 0.9;
        if (darktimer >= 80 && darktimer < 90)
            __alpha = lerp(0.9, 0, (darktimer - 80) / 10);
    }
    draw_sprite_ext(spr_cover_wings_defense_layer_0, 6, x + _x, y + _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_0, 6, x + _x, y + _y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_0, 6, x + _x, y + _y, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_cover_wings_defense_layer_1, 6, x + _x2, y + _y2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_1, 6, x + _x2, y + _y2, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_1, 6, x + _x2, y + _y2, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_cover_wings_defense_layer_2, 6, x + _x3, y + _y3, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_2, 6, x + _x3, y + _y3, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_2, 6, x + _x3, y + _y3, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_cover_wings_defense_layer_3, 6, x + _x4, y + _y4, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_3, 6, x + _x4, y + _y4, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_3, 6, x + _x4, y + _y4, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x + _x7, y + _y7);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x + _x7, y + _y7, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x + _x7, y + _y7, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (starshootcon == 0)
    {
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 6, x + _x7, y + _y7);
        if (darktimer > 0)
        {
            d3d_set_fog(true, c_black, 0, 1);
            draw_sprite_ext(spr_titan_star_disappear, starshoottimer / 6, x + _x7, y + _y7, image_xscale, image_yscale, image_angle, image_blend, __alpha);
            d3d_set_fog(false, c_black, 0, 0);
        }
        if (greenflashtimer > 0)
        {
            d3d_set_fog(true, c_lime, 0, 1);
            draw_sprite_ext(spr_titan_star_disappear, starshoottimer / 6, x + _x7, y + _y7, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
            d3d_set_fog(false, c_black, 0, 0);
        }
    }
    if (starshootcon == 1)
        draw_monster_body_part(spr_titan_star_dissolve, starshoottimer / 3, x + _x7, y + _y7);
    if (starshootcon == 3)
        draw_monster_body_part(spr_titan_star_appear, starshoottimer / 3, x + _x7, y + _y7);
    draw_sprite_ext(spr_cover_wings_defense_layer_5, 6, x + _x5, y + _y5, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_5, 6, x + _x5, y + _y5, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_5, 6, x + _x5, y + _y5, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_cover_wings_defense_layer_6, 6, x + _x6, y + _y6, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_6, 6, x + _x6, y + _y6, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_6, 6, x + _x6, y + _y6, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    draw_sprite_ext(spr_cover_wings_defense_layer_7, 6, x + _x8, y + _y8, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_7, 6, x + _x8, y + _y8, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_7, 6, x + _x8, y + _y8, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
    with (obj_titan_wing_marker)
    {
        if (wing_layer == 5)
        {
            xoff = _x5;
            yoff = _y5;
        }
        if (wing_layer == 6)
        {
            xoff = _x6;
            yoff = _y6;
        }
        if (wing_layer == 7)
        {
            xoff = _x8;
            yoff = _y8;
        }
        fog_alpha = __alpha;
    }
    if (greenflashtimer > 0)
        greenflashtimer--;
}
if (drawstate == "undefense")
{
    rumble = false;
    starshootcon = 3;
    undefense_timer -= (1/3);
    draw_sprite_ext(spr_cover_wings_defense_layer_0, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_1, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_2, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_3, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_monster_body_part(spr_cover_wings_defense_layer_4, undefense_timer, x, y);
    if (starshootcon == 0)
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 6, x, y);
    if (starshootcon == 1)
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 3, x, y);
    if (starshootcon == 3)
        draw_monster_body_part(spr_titan_star_appear, starshoottimer / 3, x, y);
    draw_sprite_ext(spr_cover_wings_defense_layer_5, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_6, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_cover_wings_defense_layer_7, undefense_timer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (undefense_timer < 0.1)
    {
        undefense_timer = 6;
        drawstate = "idle";
    }
}
if (starshootcon == 1)
{
    starshoottimer++;
    if (starshoottimer == 28)
    {
        starshoottimer = 0;
        starshootcon = 2;
        var _dissolve = instance_create(x, y, obj_titan_star_dissolve);
        _dissolve.depth = depth - 1;
        _dissolve.con = 1;
    }
}
if (starshootcon == 3)
{
    starshoottimer++;
    if (starshoottimer == 18)
    {
        starshoottimer = 0;
        starshootcon = 0;
    }
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (feathercon == 1)
{
    feathertimer++;
    if (feathertimer == 5)
    {
        for (i = 0; i < 16; i++)
        {
            o = instance_create_depth(camerax() + 280 + irandom(100), cameray() + 120 + irandom(180), depth + 1, obj_titan_feather);
            o.direction = 130 + irandom(60);
            o.speed = random_range(5, 10);
            o.image_index = 2 + irandom(2);
        }
    }
    if (feathertimer >= 5)
    {
        feathercon = 0;
        feathertimer = 0;
    }
}
if (feathercon == 2)
{
    feathertimer++;
    if (feathertimer == 15)
    {
        for (i = 0; i < 10; i++)
        {
            o = instance_create_depth(camerax() + 280 + irandom(50), cameray() + 120 + irandom(180), depth + 1, obj_titan_feather);
            o.direction = 130 + irandom(60);
            o.speed = random_range(5, 7);
            o.image_index = 2 + irandom(2);
        }
    }
    if (feathertimer >= 20)
    {
        feathercon = 0;
        feathertimer = 0;
    }
}
