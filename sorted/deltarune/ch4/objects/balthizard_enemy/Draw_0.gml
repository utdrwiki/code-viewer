scr_enemy_drawhurt_generic();
shakehead.visible = false;
var _headindex = headindex;
if (eyesfollowgersonindex != -1)
    _headindex = eyesfollowgersonindex;
if (state == 0)
{
    if (flash == 1)
        fsiner++;
    siner += 0.16666666666666666;
    if (headflashtimer > 0)
    {
        headoffsetx += ((headflashtimer - (irandom(headflashtimer) * 2)) * 2);
        headoffsety += ((headflashtimer - (irandom(headflashtimer) * 2)) * 1);
    }
    if (headflashtimer > 0)
        headflashtimer--;
    if (headspeed > 2)
        headspeed -= headfriction;
    if (headspeed < -2)
        headspeed += headfriction;
    if (headoffsetx > 2)
    {
        headspeed -= headgravity;
    }
    else if (headoffsetx < -2)
    {
        headspeed += headgravity;
    }
    else
    {
        headoffsetx = 0;
        if (headspeed < 0.5 && headspeed > -0.5)
            headspeed = 0;
    }
    if (headoffsetx > 65)
    {
        headoffsetx = 65;
        headspeed = 0;
    }
    if (headoffsetx < -65)
    {
        headoffsetx = -65;
        headspeed = 0;
    }
    if (headspeed > 15)
        headspeed = 15;
    if (headspeed < -15)
        headspeed = -15;
    headoffsetx += headspeed;
    if (headoffsety > 0)
        headoffsety -= 0.5;
    if (headoffsety < 0)
        headoffsety += 0.5;
    if (eyedelay < 1)
        eyesiner++;
    animsiner++;
    if (acting == 20 && global.myfight == 3)
        headamplitude = lerp(headamplitude, 0, 0.25);
    else
        headamplitude = lerp(headamplitude, 5, 0.25);
    eyedelay--;
    if (eyesfollowgersonindex == -1 && eyedelay < 1)
        headindex = 7 + (sin(eyesiner / 12) * 5);
    draw_monster_body_part(spr_incense_turtle_tail, 1, x, y + (sin(animsiner / 8) * 4));
    draw_monster_body_part(spr_incense_turtle_leg1, 1, x, y);
    draw_monster_body_part(spr_incense_turtle_body, 1, x, y + (sin(animsiner / 8) * 2));
    draw_monster_body_part(spr_incense_turtle_leg2, 1, x, y);
    draw_monster_body_part(spr_incense_turtle_leg3, 1, x, y);
    if (lightup == true)
    {
        lightupfireframes += 0.25;
        draw_sprite_ext(spr_incense_turtle_head_fire, lightupfireframes, x + 26 + headoffsetx + (sin(animsiner / 8) * headamplitude), y + 46 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2), head_scale, head_scale, image_angle, image_blend, pieces_alpha2);
    }
    turthead = 5548;
    if (global.mercymod[myself] >= global.mercymax[myself])
        turthead = 3750;
    draw_monster_body_part(turthead, _headindex, x + 26 + headoffsetx + (sin(animsiner / 8) * headamplitude), y + 56 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2));
    if (global.myfight != 3 && acting != 20)
    {
        var spareable = 1;
        if (global.mercymod[myself] >= global.mercymax[myself])
            spareable = 2;
        if ((animsiner % 12) == 0 && lightup == false)
        {
            smoke = instance_create(((-6 + x + 26 + headoffsetx) - 14) + (sin(animsiner / 8) * headamplitude), (y + 56 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2)) - 20, obj_incense_turtle_shake_smoke);
            smoke.speed = choose(-1, -2, -3) + 1;
            smoke.mode = 1;
            smoke.image_xscale = 0.25;
            smoke.image_yscale = 0.25;
            smoke.image_alpha = 0.75;
            smoke.image_index = spareable;
        }
        if ((animsiner % 12) == 6 && lightup == false)
        {
            smoke = instance_create(6 + x + 26 + headoffsetx + 20 + (sin(animsiner / 8) * headamplitude), (y + 56 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2)) - 20, obj_incense_turtle_shake_smoke);
            smoke.speed = choose(1, 2, 3) - 1;
            smoke.mode = 1;
            smoke.image_xscale = 0.25;
            smoke.image_yscale = 0.25;
            smoke.image_alpha = 0.75;
            smoke.image_index = spareable;
        }
        if ((animsiner % 20) == 0)
        {
            smoke = instance_create(x + 126, y + 20 + (sin(animsiner / 8) * 4), obj_incense_turtle_shake_smoke);
            smoke.speed = choose(-1, 1);
            smoke.mode = 1;
            smoke.image_xscale = 0.35;
            smoke.image_yscale = 0.35;
            smoke.image_alpha = 0.75;
            smoke.image_index = spareable;
        }
    }
    if (acting == 20)
    {
        shakehead.x = x + 26 + headoffsetx;
        shakehead.y = y + 56 + headoffsety;
        shakehead.headflashtimer = headflashtimer;
        shakehead.visible = true;
        var xx1 = x + 26;
        var xx2 = x + 26 + headoffsetx;
        var flip = 1;
        if (headoffsetx < 0)
            flip = -1;
        draw_sprite_ext(spr_smallbullet, 0, xx1 + (point_distance(xx1, y, xx2, y) * 0.1 * flip), y + 56 + headoffsety, 1, 1, 0, neckcolor, 1);
        draw_sprite_ext(spr_smallbullet, 0, xx1 + (point_distance(xx1, y, xx2, y) * 0.33 * flip), y + 56 + headoffsety, 1, 1, 0, neckcolor, 1);
        draw_sprite_ext(spr_smallbullet, 0, xx1 + (point_distance(xx1, y, xx2, y) * 0.55 * flip), y + 56 + headoffsety, 1, 1, 0, neckcolor, 1);
    }
}
if (state == 10)
{
    if (transitioncon == 0)
    {
        transitiontimer++;
        if (transitiontimer == 1)
            snd_play(snd_equip);
        piece_xoffset[0] = lerp(0, -40, transitiontimer / 5);
        if (transitiontimer < 6)
            piece_index[1] += 1;
        piece_index[2] += 0.5;
        piece_index[3] += 0.5;
        piece_index[4] += 0.5;
        with (obj_incense_turtle_shake_smoke)
            image_alpha -= 0.2;
        headoffsety += 2;
        head_scale = lerp(2, 1.5, transitiontimer / 5);
        piece_xoffset[3] = lerp(0, 10, transitiontimer / 5);
        piece_xoffset[4] = lerp(0, 10, transitiontimer / 5);
        piece_yoffset[3] -= 1;
        piece_yoffset[4] -= 1;
        if (transitiontimer == 5)
        {
            transitiontimer = 0;
            transitioncon = 1;
        }
    }
    if (transitioncon == 1)
    {
        transitiontimer++;
        pieces_alpha = lerp(1, 0, transitiontimer / 5);
        darken_alpha = lerp(0, 1, transitiontimer / 5);
        piece_xoffset[1] = lerp(0, 20, transitiontimer / 5);
        piece_xoffset[3] = lerp(10, -10, transitiontimer / 5);
        piece_xoffset[4] = lerp(10, -15, transitiontimer / 5);
        headoffsetx = lerp(headoffsetx, 14, transitiontimer / 5);
        if (transitiontimer == 3)
            snd_play_x(snd_impact, 0.5, 2);
        if (transitiontimer == 4)
            piece_index[2] -= 1;
        if (transitiontimer == 5)
        {
            transitiontimer = 0;
            transitioncon = 2;
        }
    }
    if (transitioncon == 2)
    {
        transitiontimer++;
        if (piece_index[2] > 0)
            piece_index[2] -= 1;
        pieces_alpha2 = 0;
        darken_alpha = 0;
        if (transitiontimer == 1)
        {
            transitiontimer = 0;
            transitioncon = 3;
        }
    }
    if (transitioncon == 3)
    {
        transitiontimer++;
        if (transitiontimer == 1)
            piece_yoffset[2] += 3;
        if (transitiontimer == 2)
            piece_yoffset[2] -= 2;
        if (transitiontimer == 3)
            piece_yoffset[2] += 1;
        if (transitiontimer == 4)
            piece_yoffset[2] = 0;
    }
    if (transitioncon == 4)
    {
        transitiontimer++;
        if (piece_index[2] > 0)
            piece_index[2] += 1;
        if (transitiontimer == 2)
        {
            transitiontimer = 0;
            transitioncon = 5;
        }
    }
    if (transitioncon == 5)
    {
        transitiontimer++;
        if (transitiontimer == 1)
            snd_play(snd_equip);
        pieces_alpha = lerp(0, 1, transitiontimer / 5);
        darken_alpha = lerp(1, 0, transitiontimer / 5);
        piece_xoffset[1] = lerp(20, 0, transitiontimer / 5);
        piece_xoffset[3] = lerp(-10, 10, transitiontimer / 5);
        piece_xoffset[4] = lerp(-15, 10, transitiontimer / 5);
        headoffsetx = lerp(headoffsetx, 0, transitiontimer / 5);
        pieces_alpha2 = lerp(0, 1, transitiontimer / 5);
        if (transitiontimer == 1)
            piece_index[2] += 1;
        if (transitiontimer == 5)
        {
            transitiontimer = 0;
            transitioncon = 6;
        }
    }
    if (transitioncon == 6)
    {
        transitiontimer++;
        piece_xoffset[0] = lerp(-40, 0, transitiontimer / 5);
        if (transitiontimer < 6)
            piece_index[1] -= 1;
        if (piece_index[2] > 0)
            piece_index[2] -= 1;
        piece_index[3] -= 0.5;
        piece_index[4] -= 0.5;
        headoffsety += 2;
        head_scale = lerp(1.5, 2, transitiontimer / 5);
        piece_xoffset[3] = lerp(10, 0, transitiontimer / 5);
        piece_xoffset[4] = lerp(10, 0, transitiontimer / 5);
        piece_yoffset[3] += 1;
        piece_yoffset[4] += 1;
        if (transitiontimer == 5)
        {
            transitiontimer = 0;
            transitioncon = 0;
            state = 0;
            lineyoffset = -200;
        }
    }
    animsiner++;
    headamplitude = lerp(headamplitude, 5, 0.25);
    eyedelay--;
    if (eyesfollowgersonindex == -1 && eyedelay < 1)
        headindex = 7 + (sin(eyesiner / 12) * 5);
    if (stringcon == 0 && transitioncon < 4)
    {
        stringindex += 1;
        stringcount++;
        string_top_y -= 17;
        if (!i_ex(obj_incense_censer))
        {
            draw_sprite(spr_turtle_string_head, stringindex, string_top_x, string_top_y);
            var a = 0;
            repeat (stringcount)
            {
                draw_sprite(spr_turtle_string, stringindex, string_top_x, string_top_y + (a * 17));
                a++;
            }
        }
        if (string_top_y < (cameray() - 40))
            stringcon = 1;
    }
    if (lightup == true)
    {
        lightupfireframes += 0.25;
        draw_sprite_ext(spr_incense_turtle_head_fire, lightupfireframes, x + 26 + headoffsetx + (sin(animsiner / 8) * headamplitude), y + 46 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2), head_scale, head_scale, image_angle, image_blend, pieces_alpha2);
    }
    draw_sprite_ext(spr_incense_turtle_tail, piece_index[0], x + piece_xoffset[0], y + (sin(animsiner / 8) * 4) + piece_yoffset[0], image_xscale, image_yscale, image_angle, image_blend, pieces_alpha);
    draw_sprite_ext(spr_incense_turtle_leg1_transition, piece_index[1], x + piece_xoffset[1], y + piece_yoffset[1], image_xscale, image_yscale, image_angle, image_blend, pieces_alpha);
    if (!i_ex(obj_incense_censer))
        draw_sprite_ext(spr_incense_turtle_body_transition, piece_index[2], x + piece_xoffset[2], y + piece_yoffset[2], image_xscale, image_yscale, image_angle, image_blend, 1);
    else
        draw_sprite_ext(spr_incense_turtle_body_centered, piece_index[2], x + piece_xoffset[2] + 66, y + piece_yoffset[2] + 50, image_xscale, image_yscale, image_angle, image_blend, 1);
    draw_sprite_ext(spr_incense_turtle_leg3_transition, piece_index[4], x + piece_xoffset[4], y + piece_yoffset[4], image_xscale, image_yscale, image_angle, image_blend, pieces_alpha2);
    draw_sprite_ext(spr_incense_turtle_leg2_transition, piece_index[3], x + piece_xoffset[3], y + piece_yoffset[3], image_xscale, image_yscale, image_angle, image_blend, pieces_alpha2);
    turthead = 5548;
    if (global.mercymod[myself] >= global.mercymax[myself])
        turthead = 3750;
    draw_sprite_ext(turthead, _headindex, x + 26 + headoffsetx + (sin(animsiner / 8) * headamplitude), y + 56 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2), head_scale, head_scale, image_angle, image_blend, pieces_alpha2);
    if (darken_alpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(spr_incense_turtle_leg3_transition, piece_index[4], x + piece_xoffset[4], y + piece_yoffset[4], image_xscale, image_yscale, image_angle, image_blend, darken_alpha);
        draw_sprite_ext(spr_incense_turtle_leg2_transition, piece_index[3], x + piece_xoffset[3], y + piece_yoffset[3], image_xscale, image_yscale, image_angle, image_blend, darken_alpha);
        draw_sprite_ext(turthead, _headindex, x + 26 + headoffsetx + (sin(animsiner / 8) * headamplitude), y + 56 + headoffsety + ((cos(animsiner / 6) * headamplitude) / 2), head_scale, head_scale, image_angle, image_blend, darken_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (acting == 20)
{
    var b = 180 - shaketimer;
    ossafe_fill_rectangle_color(camerax() + 200, cameray() + 290, camerax() + 200 + b, cameray() + 300, c_aqua, c_aqua, c_aqua, c_aqua, 0);
    draw_sprite_ext(spr_poppup_hourglass, 1, camerax() + 200, cameray() + 295, 2, 2, 0, c_white, image_alpha);
}
