var _x = 0;
var _y = 0;
var __alpha = 0;
var __alpha2 = 0;
var __alpha3 = 0;
if (introcon >= 3 || (introcon == 2 && introtimer > 90))
    siner += 0.16666666666666666;
if (introcon > 0)
{
}
if (introcon == 0)
{
    introtimer++;
    if (introtimer >= 0 && introtimer <= 30)
        __alpha = lerp(0, 1, introtimer / 30);
    else
        __alpha = 1;
    if (introtimer == 60)
    {
        introcon = 0.5;
        introtimer = 0;
    }
}
if (introcon == 0.5)
{
    introtimer++;
    if (introtimer == 1)
        snd_play_x(snd_motor_ghost, 1, 0.6);
    if (introtimer == 1)
        snd_play_x(snd_motor_ghost, 1, 0.6);
    __alpha = 1;
    if (introtimer >= 0 && introtimer <= 30)
        __alpha3 = lerp(0, 1, introtimer / 30);
    else
        __alpha3 = 1;
    if (introtimer == 60)
    {
        introcon = 1;
        introtimer = 0;
    }
}
if (introcon == 0.75)
{
    introtimer++;
    if (introtimer == 1)
        snd_play_x(snd_motor_ghost, 1, 0.8);
    if (introtimer == 1)
        snd_play_x(snd_motor_ghost, 1, 0.8);
    if (introtimer >= 0 && introtimer <= 30)
        __alpha2 = lerp(0, 1, introtimer / 30);
    else
        __alpha2 = 1;
    __alpha = 1;
    __alpha3 = 1;
    if (introtimer == 60)
    {
        introcon = 1;
        introtimer = 0;
    }
}
if (introcon == 1)
{
    __alpha2 = 1;
    __alpha = 1;
    __alpha3 = 1;
}
if (introcon == 2)
{
    introtimer++;
    if (introtimer == 1)
        snd_play_x(snd_ghostappear, 1, 1);
    if (introtimer == 1)
        snd_play_x(snd_ghostappear, 1, 1);
    if (introtimer >= 0 && introtimer <= 30)
        __alpha2 = lerp(1, 0, introtimer / 30);
    else
        __alpha2 = 0;
    if (introtimer >= 0 && introtimer <= 30)
        __alpha3 = lerp(1, 0, introtimer / 30);
    else
        __alpha3 = 0;
    if (introtimer >= 0)
    {
        __alpha = lerp(1, 0, introtimer / 30);
        image_alpha = 1;
    }
    else
    {
        __alpha = 0;
    }
    if (introtimer == 60)
    {
        introcon = 3;
        introtimer = 89;
    }
}
if (introcon == 2)
{
    introtimer++;
    if (introtimer == 90)
    {
        mus_volume(global.currentsong[1], 0, 90);
        snd_play(snd_titan_wingshut);
        drawstate = "undefense";
        drawstatetimer = 6;
    }
    if (introtimer == 150)
    {
        introcon = 3;
        introtimer = 0;
    }
}
if (drawstate == "idle")
{
    if (introcon > 0)
        draw_sprite_ext(spr_titan_0_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_0_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_titan_1_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_1_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_titan_2_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_2_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_titan_3_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_3_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x, y);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_monster_body_part(spr_titan_star_disappear, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_star_disappear, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_titan_5_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_5_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_titan_6_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_6_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_titan_7_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_7_backwing, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (__alpha2 > 0)
        draw_sprite_ext(spr_titan_star_disappear, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, image_xscale, image_yscale, image_angle, image_blend, __alpha2);
}
if (drawstate == "defense")
{
    x = xstart - 6;
    var _winger = max(0, drawstatetimer);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_0, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_0, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_1, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_1, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_2, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_2, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_3, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_3, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x, y);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_4, siner, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 6, x, y);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_titan_star_disappear, starshoottimer / 6, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_5, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_5, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_6, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_6, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_7, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_cover_wings_defense_layer_7, _winger, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (__alpha2 > 0 && draw_sprite_ext(spr_titan_star_disappear, starshoottimer / 6, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha2))
    {
        if (drawstatetimer < 1)
        {
            drawstatetimer += 0.16666666666666666;
        }
        else if (drawstatetimer < 2)
        {
            drawstatetimer += 0.2;
        }
        else if (drawstatetimer < 3)
        {
            drawstatetimer += 0.25;
        }
        else if (drawstatetimer < 4)
        {
            drawstatetimer += (1/3);
        }
        else if (drawstatetimer < 5)
        {
            drawstatetimer += 0.5;
        }
        else if (drawstatetimer < 6)
        {
            drawstatetimer += (1/3);
        }
        else
        {
            drawstate = "defense end";
            drawstatetimer = 0;
        }
    }
    if (drawstatetimer == 0.16666666666666666)
    {
        snd_play(snd_titan_wingshut);
        feathercon = 1;
    }
}
if (drawstate == "defense end")
{
    x = xstart - 6;
    if (spd < maxspd)
        spd += 0.2;
    var _spd = spd;
    var _distance = 4;
    var _xx = 0;
    var _yy = 0;
    var rotation2 = 0;
    if (introcon < 2)
        rotation += _spd;
    var _c = dcos(rotation2);
    var _s = dsin(rotation2);
    _x = _xx + (_c * _distance) + (_s * _distance);
    _y = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos(rotation2 * -1);
    _s = dsin(rotation2 * -1);
    var _x2 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y2 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    _c = dcos(rotation2 - 90);
    _s = dsin(rotation2 - 90);
    var _x3 = _xx + (_c * _distance) + (_s * _distance);
    var _y3 = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos((rotation2 - 90) * -1);
    _s = dsin((rotation2 - 90) * -1);
    var _x4 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y4 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    _c = dcos(rotation2 - 180);
    _s = dsin(rotation2 - 180);
    var _x5 = _xx + (_c * _distance) + (_s * _distance);
    var _y5 = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos((rotation2 - 180) * -1);
    _s = dsin((rotation2 - 180) * -1);
    var _x6 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y6 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    _c = dcos(rotation - 270);
    _s = dsin(rotation - 270);
    var _x7 = _xx + (_c * _distance) + (_s * _distance);
    var _y7 = _yy + (-_s * _distance) + (_c * _distance);
    _c = dcos((rotation2 - 270) * -1);
    _s = dsin((rotation2 - 270) * -1);
    var _x8 = (_xx + (_c * _distance) + (_s * _distance)) * -1;
    var _y8 = (_yy + (-_s * _distance) + (_c * _distance)) * -1;
    if (rotation > 359)
        rotation -= 360;
    siner += 0.16666666666666666;
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_0, 6, x + _x, y + _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_1, 6, x + _x2, y + _y2, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_2, 6, x + _x3, y + _y3, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_3, 6, x + _x4, y + _y4, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (introcon > 0)
        draw_monster_body_part(spr_cover_wings_defense_layer_4, siner, x, y);
    if (introcon > 0)
        draw_monster_body_part(spr_titan_star_idle, siner, x + _x7, y + _y7);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_5, 6, x + _x5, y + _y5, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_6, 6, x + _x6, y + _y6, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (introcon > 0)
        draw_sprite_ext(spr_cover_wings_defense_layer_7, 6, x + _x8, y + _y8, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (__alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_pixel_white, 0, x + 150, y - 150, 400, 400, image_angle, image_blend, __alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (__alpha3 > 0)
        draw_sprite_ext(spr_cover_wings_defense_highlight2, 0, x + _x + 210, y + _y + 80 + 30, image_xscale, image_yscale, image_angle, image_blend, __alpha3);
}
if (drawstate == "undefense")
{
    drawstatetimer -= 0.16666666666666666;
    if (drawstatetimer < 0.1)
        drawstatetimer = 0;
    if (introcon > 0 && drawstatetimer < 6)
    {
        var _index = drawstatetimer - (2/3);
        if (_index < 0.1)
            _index = 0;
        draw_sprite_ext(spr_cover_wings_defense_layer_0, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_1, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_2, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_3, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_4, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_titan_star_disappear, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_5, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_6, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        draw_sprite_ext(spr_cover_wings_defense_layer_7, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1/3);
        _index = drawstatetimer - (1/3);
        if (_index > 0)
        {
            draw_sprite_ext(spr_cover_wings_defense_layer_0, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_1, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_2, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_3, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_4, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_titan_star_disappear, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_5, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_6, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
            draw_sprite_ext(spr_cover_wings_defense_layer_7, _index, x, y, image_xscale, image_yscale, image_angle, image_blend, 2/3);
        }
        draw_sprite_ext(spr_cover_wings_defense_layer_0, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cover_wings_defense_layer_1, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cover_wings_defense_layer_2, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cover_wings_defense_layer_3, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_monster_body_part(spr_cover_wings_defense_layer_4, drawstatetimer, x, y);
        draw_monster_body_part(spr_titan_star_disappear, starshoottimer / 6, x, y);
        draw_sprite_ext(spr_cover_wings_defense_layer_5, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cover_wings_defense_layer_6, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        draw_sprite_ext(spr_cover_wings_defense_layer_7, drawstatetimer, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    }
    if (__alpha2 > 0)
        draw_sprite_ext(spr_titan_star_disappear, starshoottimer / 6, x, y, image_xscale, image_yscale, image_angle, image_blend, __alpha2);
    if (drawstatetimer < 2 && feathercon == 1)
        feathercon = 1;
    if (drawstatetimer < 1.4 && !i_ex(obj_afterimage_screen))
    {
        with (instance_create(camerax() + 460, cameray() + 200, obj_afterimage_screen))
            faderate = 0.05;
    }
    if (drawstatetimer < 0.1)
        drawstate = "idle";
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (feathercon == 1)
{
    feathertimer++;
    if (feathertimer == 5)
    {
        for (i = 0; i < 8; i++)
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
        for (i = 0; i < 8; i++)
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
