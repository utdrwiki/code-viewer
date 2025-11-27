var render_ypos = (494 - (round(yoffset / 40) - 12)) + round((obj_mainchara.y - 220) / 40);
var render_ypos_start = render_ypos - 14;
var render_ypos_end = render_ypos + 9;
if (render_ypos_end > 500)
    render_ypos_end = 500;
if (renderalt == true)
    render_ypos_start = render_ypos - 7;
var middlex = 320;
if (wide_tower)
    middlex = 300;
var towertilesprite = 2215;
with (obj_tower_falling_piece)
    image_index = obj_rotating_tower_controller.tower_image_index;
eyesmoketimer++;
if (shake_timer > 0)
{
    if (shake_timer == 30)
    {
        instance_create(x, y, obj_shake);
        snd_play(snd_screenshake);
    }
    if (shake_count == -1)
    {
        render_ypos_start_shake = render_ypos - 16;
        render_ypos_end_shake = render_ypos + 16;
        if (render_ypos_end_shake > 499)
            render_ypos_end_shake = 499;
        shake_count = render_ypos_end_shake + 1;
    }
    shake_timer--;
    if (shake_count > render_ypos_start_shake)
        shake_count--;
    for (i = render_ypos_end_shake; i > shake_count; i--)
    {
        tower_siner[i] += 5;
        tower_xoffset[i] = sin((100 - tower_siner[i]) / 6) * 14;
        if (render_ypos == i)
            obj_mainchara.tower_shake_xoffset = sin((100 - tower_siner[i]) / 6) * 14;
    }
}
else
{
    shake_timer--;
    if (shake_timer > -20)
    {
        for (i = render_ypos_start_shake; i < render_ypos_end_shake; i++)
        {
            tower_siner[i] = 0;
            tower_xoffset[i] = lerp(tower_xoffset[i], 0, 0.4);
            obj_mainchara.tower_shake_xoffset = lerp(obj_mainchara.tower_shake_xoffset, 0, 0.4);
        }
    }
    if (shake_timer == -20)
    {
        render_ypos_start_shake = 0;
        render_ypos_end_shake = 0;
        shake_count = -1;
    }
}
if (tower_falls_apart_con == 1)
{
    tower_falls_apart_timer++;
    if (tower_falls_apart_timer == 1)
    {
        if (tower_falls_apart_i == 0)
        {
            tower_falls_apart_i = render_ypos + 6;
            if (tower_falls_apart_i > 499)
                render_ypos_end_shake = 499;
            i = render_ypos + 7;
            while (i < 499)
            {
                tower_piece_sprite[i] = 4168;
                for (var _i = 0; _i < 8; _i++)
                    tower_object[i][_i] = 0;
                i++;
            }
            tower_object[i][7] = 0;
        }
        else
        {
            tower_falls_apart_i--;
        }
        for (var _i = 0; _i < 8; _i++)
        {
            if (tower_object[tower_falls_apart_i][_i] > 0)
            {
                inst1 = instance_create_depth(x, y, depth + 1, obj_tower_falling_piece_object);
                if (tower_object[tower_falls_apart_i][_i] == 1)
                    inst1.sprite_index = laddersprite;
                if (tower_object[tower_falls_apart_i][_i] == 2)
                    inst1.sprite_index = stepssprite;
                if (tower_object[tower_falls_apart_i][_i] == 3)
                    inst1.sprite_index = rocksprite;
                if (tower_object[tower_falls_apart_i][_i] == 4)
                    inst1.sprite_index = eyesprite;
                if (tower_object[tower_falls_apart_i][_i] == 5)
                    inst1.sprite_index = eyedripsprite;
                inst1.i = tower_falls_apart_i;
                inst1.ii = _i;
            }
        }
        inst1 = instance_create_depth(middlex, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst1.sprite_index = spr_tower_rotating_piece1_strip1;
        inst1.i = tower_falls_apart_i;
        inst2 = instance_create_depth(middlex, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst2.sprite_index = spr_tower_rotating_piece1_strip2;
        inst2.i = tower_falls_apart_i;
        inst3 = instance_create_depth(middlex, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst3.sprite_index = spr_tower_rotating_piece1_strip3;
        inst3.i = tower_falls_apart_i;
        inst4 = instance_create_depth(middlex, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst4.sprite_index = spr_tower_rotating_piece1_strip4;
        inst4.i = tower_falls_apart_i;
        var aaa = choose(1, 3, 2, 4);
        if (aaa == 1)
        {
            inst1.delay = 1;
            inst2.delay = 6;
            inst3.delay = 11;
            inst4.delay = 16;
        }
        if (aaa == 2)
        {
            inst1.delay = 16;
            inst2.delay = 11;
            inst3.delay = 6;
            inst4.delay = 1;
        }
        if (aaa == 3)
        {
            inst1.delay = 6;
            inst2.delay = 1;
            inst3.delay = 16;
            inst4.delay = 11;
        }
        if (aaa == 4)
        {
            inst1.delay = 11;
            inst2.delay = 16;
            inst3.delay = 1;
            inst4.delay = 6;
        }
        if (tower_falls_apart_i <= render_ypos && !instance_exists(obj_tower_falling_kris_falls))
        {
            snd_play_pitch(snd_fall, 0.8);
            krisfalls = instance_create_depth(obj_mainchara.x, obj_mainchara.y, obj_mainchara.depth, obj_tower_falling_kris_falls);
            krisfalls.image_index = obj_mainchara.image_index;
            krisfalls.fall_i = tower_falls_apart_i;
        }
        if (i_ex(obj_rotating_tower_controller) && i_ex(obj_tower_dog) && obj_rotating_tower_controller.yoffset > 4900 && obj_tower_dog.fallingoff == false && ((500 - tower_falls_apart_i) * 40) > (abs(obj_tower_dog.draw_y) - 20))
        {
            with (obj_tower_dog)
                fallingoff = true;
        }
    }
    if (tower_falls_apart_i < render_ypos && !instance_exists(obj_tower_falling_kris_falls))
    {
        snd_play_pitch(snd_fall, 0.8);
        krisfalls = instance_create_depth(obj_mainchara.x, obj_mainchara.y, obj_mainchara.depth, obj_tower_falling_kris_falls);
        krisfalls.image_index = obj_mainchara.image_index;
        krisfalls.fall_i = tower_falls_apart_i;
    }
    if (tower_falls_apart_timer == 2)
    {
        tower_piece_sprite[tower_falls_apart_i] = 4168;
        for (var _i = 0; _i < 8; _i++)
            tower_object[tower_falls_apart_i][_i] = tower_object[tower_falls_apart_i][_i] * -1;
    }
    if (!instance_exists(obj_tower_falling_kris_falls) && endclimb == false)
    {
        var fallfast = true;
        if (room == room_dw_church_dogclimb && yoffset > 2800 && yoffset < 4600 && obj_rotating_tower_controller.yoffset < 4900)
            fallfast = false;
        if ((abs(render_ypos - tower_falls_apart_i) > 3 && fallfast && tower_falls_apart_timer == 15) || tower_falls_apart_timer >= 60 || (yoffset >= 4600 && tower_falls_apart_i > 399) || (yoffset >= 4600 && tower_falls_apart_timer == 15))
            tower_falls_apart_timer = 0;
    }
}
if (room == room_dw_church_dogclimb && tower_falls_apart_con == 1)
{
    tower_falls_apart_timer_dog++;
    if (tower_falls_apart_timer_dog == 1)
    {
        if (tower_falls_apart_i_dog == 0)
        {
            tower_falls_apart_i_dog = render_ypos + 6;
            i = render_ypos + 7;
            while (i < 499)
            {
                tower_piece_sprite_dog[i] = 4168;
                i++;
            }
        }
        else
        {
            tower_falls_apart_i_dog--;
        }
        inst = instance_create_depth(x, y, depth - 1, obj_tower_falling_piece_object);
        inst.sprite_index = spr_tower_rotating_ladder;
        inst.i = tower_falls_apart_i_dog;
        inst.ii = 6;
        inst.dog = true;
        inst5 = instance_create_depth(560, ((40 * tower_falls_apart_i_dog) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst5.sprite_index = spr_tower_rotating_piece1_strip1;
        inst5.i = tower_falls_apart_i_dog;
        inst6 = instance_create_depth(560, ((40 * tower_falls_apart_i_dog) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst6.sprite_index = spr_tower_rotating_piece1_strip2;
        inst6.i = tower_falls_apart_i_dog;
        inst7 = instance_create_depth(560, ((40 * tower_falls_apart_i_dog) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst7.sprite_index = spr_tower_rotating_piece1_strip3;
        inst7.i = tower_falls_apart_i_dog;
        inst8 = instance_create_depth(560, ((40 * tower_falls_apart_i_dog) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst8.sprite_index = spr_tower_rotating_piece1_strip4;
        inst8.i = tower_falls_apart_i_dog;
        var aaa = choose(1, 3, 2, 4);
        if (aaa == 1)
        {
            inst5.delay = 16;
            inst6.delay = 11;
            inst7.delay = 6;
            inst8.delay = 1;
        }
        if (aaa == 2)
        {
            inst5.delay = 6;
            inst6.delay = 1;
            inst7.delay = 16;
            inst8.delay = 11;
        }
        if (aaa == 3)
        {
            inst5.delay = 11;
            inst6.delay = 16;
            inst7.delay = 1;
            inst8.delay = 6;
        }
        if (aaa == 4)
        {
            inst5.delay = 1;
            inst6.delay = 6;
            inst7.delay = 11;
            inst8.delay = 16;
        }
        if (i_ex(obj_rotating_tower_controller) && i_ex(obj_tower_dog) && obj_rotating_tower_controller.yoffset > 4900 && obj_tower_dog.fallingoff == false && ((500 - tower_falls_apart_i_dog) * 40) > (abs(obj_tower_dog.draw_y) - 20))
        {
            with (obj_tower_dog)
                fallingoff = true;
        }
    }
    if (i_ex(obj_rotating_tower_controller) && i_ex(obj_tower_dog) && obj_rotating_tower_controller.yoffset > 4900 && obj_tower_dog.fallingoff == false && ((500 - tower_falls_apart_i_dog) * 40) > (abs(obj_tower_dog.draw_y) - 20))
    {
        with (obj_tower_dog)
            fallingoff = true;
    }
    if (tower_falls_apart_timer_dog == 2)
        tower_piece_sprite_dog[tower_falls_apart_i_dog] = 4168;
    if (endclimb == false)
    {
        var fallfast = true;
        if (room == room_dw_church_dogclimb && yoffset > 2800 && yoffset < 4600 && obj_rotating_tower_controller.yoffset < 4900)
            fallfast = false;
        if ((abs(render_ypos - tower_falls_apart_i) > 3 && fallfast && tower_falls_apart_timer_dog == 15) || tower_falls_apart_timer_dog >= 60 || (yoffset >= 4600 && tower_falls_apart_i > 390 && tower_falls_apart_timer_dog == 2) || (yoffset >= 4600 && tower_falls_apart_timer_dog == 5))
            tower_falls_apart_timer_dog = 0;
    }
}
for (i = render_ypos_start; i < render_ypos_end; i++)
{
    if (((((40 * i) + yoffset) - (towerpiececount * 40)) > -40 || endclimb == false) && !wide_tower)
    {
        if (tower_image_index == 0)
            tower_image_index = 0;
        draw_sprite(tower_piece_sprite[i], tower_image_index, 320 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
        if (wide_tower && tower_piece_sprite[i] != 5316)
            draw_sprite(spr_tower_rotating_fountain_gradient, 0, 320 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
        if (room == room_dw_church_dogclimb)
            draw_sprite(tower_piece_sprite_dog[i], tower_image_index, 560 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
    }
    if (tower_type == 0)
    {
        if (wide_tower)
        {
            for (ii = 0; ii < (piececount + 1); ii++)
            {
                event_user(10);
                blend = merge_color(c_white, c_gray, abs(_x[i][ii]) / 130);
                towertilesprite = 5408;
                if (tower_object[i][ii] > 0 && tower_object[i][ii] < 4)
                    towertilesprite = 5279;
                var showtile = true;
                if (tower_piece_sprite[i] == 5316 && tower_object[i][ii] == 0)
                    showtile = false;
                if (_vis[i][ii] == false && mathtype[i][ii] == 0 && showtile)
                    draw_sprite_ext(towertilesprite, 1, 310 + _x[i][ii] + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), xscale[i][ii] / 40, 1, image_angle, blend, 1);
            }
        }
        if (wide_tower)
        {
            for (ii = 0; ii < (piececount + 1); ii++)
            {
                event_user(10);
                blend = merge_color(c_white, c_gray, abs(_x[i][ii]) / 130);
                towertilesprite = 5408;
                if (tower_object[i][ii] > 0 && tower_object[i][ii] < 4)
                    towertilesprite = 5279;
                var showtile = true;
                if (tower_piece_sprite[i] == 5316 && tower_object[i][ii] == 0)
                    showtile = false;
                if (_vis[i][ii] == false && mathtype[i][ii] == 1 && showtile)
                    draw_sprite_ext(towertilesprite, 1, 310 + _x[i][ii] + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), xscale[i][ii] / 40, 1, image_angle, blend, 1);
            }
        }
        if (tower_piece_sprite[i] == 5316)
            draw_sprite(tower_piece_sprite[i], tower_image_index, 320 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
        if (wide_tower)
        {
            for (ii = 0; ii < (piececount + 1); ii++)
            {
                event_user(10);
                blend = merge_color(c_white, c_gray, abs(_x[i][ii]) / 130);
                towertilesprite = 5408;
                if (tower_object[i][ii] > 0 && tower_object[i][ii] < 4)
                    towertilesprite = 5279;
                var showtile = true;
                if (tower_piece_sprite[i] == 5316 && tower_object[i][ii] == 0)
                    showtile = false;
                if (_vis[i][ii] == true && showtile)
                    draw_sprite_ext(towertilesprite, 1, 310 + _x[i][ii] + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), xscale[i][ii] / 40, 1, image_angle, blend, 1);
            }
        }
        if (!wide_tower)
        {
            for (ii = 0; ii < (piececount + 1); ii++)
            {
                if (tower_object[i][ii] > 0)
                {
                    event_user(10);
                    var _blend = 16777215;
                    if (wide_tower)
                        _blend = merge_color(c_white, c_black, abs(xx) / (piecemaxdistance * 1.2));
                    if (((((40 * i) + yoffset) - (towerpiececount * 40)) > -20 || endclimb == false) && vis == true)
                    {
                        if (tower_object[i][ii] == 1)
                            draw_sprite_ext(laddersprite, ladder_index, middlex + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), 1, 1, 0, _blend, 1);
                        if (tower_object[i][ii] == 2)
                            draw_sprite_ext(stepssprite, ladder_index, middlex + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), 1, 1, 0, _blend, 1);
                        if (tower_object[i][ii] == 3)
                            draw_sprite_ext(rocksprite, ladder_index, middlex + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), 1, 1, 0, _blend, 1);
                    }
                }
            }
        }
        for (ii = 0; ii < (piececount + 1); ii++)
        {
            eyecalculate = 1;
            event_user(10);
            eyecalculate = 0;
            if (((((40 * i) + yoffset) - (towerpiececount * 40)) > -20 || endclimb == false) && vis == true)
            {
                if (tower_object[i][ii] == 4)
                {
                    draw_sprite(eyesprite, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
                    if (ladder_index != 9 && (eyesmoketimer % 12) == 0)
                    {
                        if (xx > 0)
                            var extravar = lerp(0, 0, xx / 110);
                        if (xx < 0)
                            var extravar = lerp(0, 0, abs(xx) / 110);
                        inst = instance_create(320 + tower_xoffset[i], ((((40 * i) + yoffset) - (towerpiececount * 40)) + 30 + random(12)) - obj_rotating_tower_controller.yoffset, obj_fountainball);
                        inst.angle_position = (270 - tower_angle) + (xx / 1.9);
                    }
                }
                if (tower_eyedrip[i][ii] > 0)
                {
                    draw_sprite_ext(eyedripsprite, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40) - 2, 0.6, tower_eyedrip[i][ii] / 10, 0, c_black, 1);
                    if (tower_eyedrip[i][ii] < 10 && (render_ypos - 5) < i)
                    {
                        tower_eyedrip[i][ii]++;
                        if (tower_eyedrip[i][ii] == 10)
                            tower_eyedrip[i + 1][ii] = 1;
                    }
                }
            }
        }
    }
    if (room == room_dw_church_dogclimb)
    {
        for (ii = 0; ii < 8; ii++)
        {
            ladder_index = 4;
            xx = 0;
            if (ii == 6)
            {
                if (tower_angle >= 260 && tower_angle < 266)
                    ladder_index = 0;
                else if (tower_angle >= 267 && tower_angle < 282)
                    ladder_index = 1;
                else if (tower_angle >= 282 && tower_angle < 290)
                    ladder_index = 2;
                else if (tower_angle >= 290 && tower_angle < 335)
                    ladder_index = 3;
                else if (tower_angle >= 335 || tower_angle < 25)
                    ladder_index = 4;
                else if (tower_angle >= 25 && tower_angle < 70)
                    ladder_index = 5;
                else if (tower_angle >= 70 && tower_angle < 78)
                    ladder_index = 6;
                else if (tower_angle >= 78 && tower_angle < 93)
                    ladder_index = 7;
                else if (tower_angle >= 93 && tower_angle < 100)
                    ladder_index = 8;
                else
                    ladder_index = 9;
                if (tower_angle >= 260)
                    xx = lerp(-70, 0, (tower_angle - 260) / 100);
                if (tower_angle < 100)
                    xx = lerp(0, 70, tower_angle / 100);
                if (tower_piece_sprite_dog[i] != 4168)
                {
                    if ((((40 * i) + yoffset) - (towerpiececount * 40)) > -20 || endclimb == false)
                        draw_sprite(spr_tower_rotating_ladder, ladder_index, 560 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
                }
            }
        }
    }
}
moved = 0;
if (tower_angle_record[0] != obj_rotating_tower_controller.tower_angle)
    moved = 1;
if (yoffset_record[0] != obj_rotating_tower_controller.yoffset)
    moved = 1;
if (moved == 1)
{
    for (i = 75; i > 0; i -= 1)
    {
        tower_angle_record[i] = tower_angle_record[i - 1];
        yoffset_record[i] = yoffset_record[i - 1];
        var ex = 0;
        tower_angle_record[0] = tower_angle;
        yoffset_record[0] = yoffset - ex;
    }
}
if (room == room_dw_church_dogclimb)
{
    draw_sprite(spr_dogclimb_top2, 2, 262, -54);
    if (endclimb == false)
        draw_sprite(spr_dogclimb_top2, 2, 502, -54);
}
draw_set_color(c_white);
draw_text(camerax(), 20, "yoffset: " + string(yoffset));
draw_text(camerax(), 40, "tower_angle: " + string(tower_angle));
draw_text(camerax(), 60, "obj_mainchara.y: " + string(obj_mainchara.y));
draw_text(camerax(), 80, "cameray: " + string(cameray()));
