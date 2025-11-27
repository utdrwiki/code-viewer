var render_ypos = (494 - (round(yoffset / 40) - 12)) + round((obj_mainchara.y - 220) / 40);
var render_ypos_start = render_ypos - 14;
var render_ypos_end = render_ypos + 9;
if (render_ypos_end > 500)
    render_ypos_end = 500;
if (renderalt == true)
    render_ypos_start = render_ypos - 7;
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
    for (var i = render_ypos_end_shake; i > shake_count; i--)
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
        for (var i = render_ypos_start_shake; i < render_ypos_end_shake; i++)
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
            var i = render_ypos + 7;
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
                    inst1.sprite_index = spr_tower_rotating_ladder;
                if (tower_object[tower_falls_apart_i][_i] == 2)
                    inst1.sprite_index = spr_tower_rotating_steps;
                if (tower_object[tower_falls_apart_i][_i] == 3)
                    inst1.sprite_index = spr_tower_rotating_rocks;
                if (tower_object[tower_falls_apart_i][_i] == 4)
                    inst1.sprite_index = spr_tower_rotating_eye;
                if (tower_object[tower_falls_apart_i][_i] == 5)
                    inst1.sprite_index = spr_tower_rotating_eye_drip;
                inst1.i = tower_falls_apart_i;
                inst1.ii = _i;
            }
        }
        inst1 = instance_create_depth(320, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst1.sprite_index = spr_tower_rotating_piece1_strip1;
        inst1.i = tower_falls_apart_i;
        inst2 = instance_create_depth(320, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst2.sprite_index = spr_tower_rotating_piece1_strip2;
        inst2.i = tower_falls_apart_i;
        inst3 = instance_create_depth(320, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
        inst3.sprite_index = spr_tower_rotating_piece1_strip3;
        inst3.i = tower_falls_apart_i;
        inst4 = instance_create_depth(320, ((40 * tower_falls_apart_i) + yoffset) - (towerpiececount * 40), depth + 1, obj_tower_falling_piece);
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
            var i = render_ypos + 7;
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
for (var i = render_ypos_start; i < render_ypos_end; i++)
{
    if ((((40 * i) + yoffset) - (towerpiececount * 40)) > -40 || endclimb == false)
    {
        if (tower_image_index == 0)
            tower_image_index = 0;
        draw_sprite(tower_piece_sprite[i], tower_image_index, 320 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
        if (tower_piece_sprite[i] != 5316)
            draw_sprite(spr_tower_rotating_fountain_gradient, 0, 320 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
        if (room == room_dw_church_dogclimb)
            draw_sprite(tower_piece_sprite_dog[i], tower_image_index, 560 + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
    }
}
with (obj_tower_falling_piece)
    image_index = obj_rotating_tower_controller.tower_image_index;
var piecemaxdistance = 70;
var piececount = 7;
if (wide_tower)
{
    piecemaxdistance = 110;
    piececount = 9;
}
eyesmoketimer++;
if (tower_type == 0)
{
    for (var i = render_ypos_start; i < render_ypos_end; i++)
    {
        for (var ii = 0; ii < (piececount + 1); ii++)
        {
            piecemaxdistance = 70;
            piececount = 7;
            if (wide_tower)
            {
                piecemaxdistance = 110;
                piececount = 9;
            }
            if (tower_object[i][ii] == 1 || tower_object[i][ii] == 2 || tower_object[i][ii] == 3 || tower_object[i][ii] == 4)
            {
                var ladder_index = 4;
                var xx = 0;
                var vis = false;
                if (tower_object[i][ii] == 3 || tower_object[i][ii] == 4)
                    piecemaxdistance = 100;
                if (wide_tower == false)
                {
                    vis = true;
                    if (ii == 0)
                    {
                        if (tower_angle >= 350 && tower_angle < 357)
                            ladder_index = 0;
                        else if (tower_angle >= 357 || tower_angle < 12)
                            ladder_index = 1;
                        else if (tower_angle >= 12 && tower_angle < 20)
                            ladder_index = 2;
                        else if (tower_angle >= 20 && tower_angle < 65)
                            ladder_index = 3;
                        else if (tower_angle >= 65 && tower_angle < 115)
                            ladder_index = 4;
                        else if (tower_angle >= 115 && tower_angle < 160)
                            ladder_index = 5;
                        else if (tower_angle >= 160 && tower_angle < 168)
                            ladder_index = 6;
                        else if (tower_angle >= 168 && tower_angle < 183)
                            ladder_index = 7;
                        else if (tower_angle >= 183 && tower_angle < 190)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 350)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 350) / 100);
                        if (tower_angle < 90)
                            xx = lerp(piecemaxdistance * -1, 0, (10 + tower_angle) / 100);
                        if (tower_angle >= 90 && tower_angle < 190)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 90) / 100);
                    }
                    if (ii == 1)
                    {
                        if (tower_angle >= 35 && tower_angle < 42)
                            ladder_index = 0;
                        else if (tower_angle >= 42 && tower_angle < 57)
                            ladder_index = 1;
                        else if (tower_angle >= 57 && tower_angle < 65)
                            ladder_index = 2;
                        else if (tower_angle >= 65 && tower_angle < 110)
                            ladder_index = 3;
                        else if (tower_angle >= 110 && tower_angle < 160)
                            ladder_index = 4;
                        else if (tower_angle >= 160 && tower_angle < 205)
                            ladder_index = 5;
                        else if (tower_angle >= 205 && tower_angle < 213)
                            ladder_index = 6;
                        else if (tower_angle >= 213 && tower_angle < 228)
                            ladder_index = 7;
                        else if (tower_angle >= 228 && tower_angle < 235)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 35 && tower_angle < 135)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 35) / 100);
                        if (tower_angle >= 135 && tower_angle < 235)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 135) / 100);
                    }
                    if (ii == 2)
                    {
                        if (tower_angle >= 80 && tower_angle < 87)
                            ladder_index = 0;
                        else if (tower_angle >= 87 && tower_angle < 102)
                            ladder_index = 1;
                        else if (tower_angle >= 102 && tower_angle < 110)
                            ladder_index = 2;
                        else if (tower_angle >= 110 && tower_angle < 155)
                            ladder_index = 3;
                        else if (tower_angle >= 155 && tower_angle < 205)
                            ladder_index = 4;
                        else if (tower_angle >= 205 && tower_angle < 250)
                            ladder_index = 5;
                        else if (tower_angle >= 250 && tower_angle < 258)
                            ladder_index = 6;
                        else if (tower_angle >= 258 && tower_angle < 273)
                            ladder_index = 7;
                        else if (tower_angle >= 273 && tower_angle < 280)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 80 && tower_angle < 180)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 80) / 100);
                        if (tower_angle >= 180 && tower_angle < 280)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 180) / 100);
                    }
                    if (ii == 3)
                    {
                        if (tower_angle >= 125 && tower_angle < 132)
                            ladder_index = 0;
                        else if (tower_angle >= 132 && tower_angle < 147)
                            ladder_index = 1;
                        else if (tower_angle >= 147 && tower_angle < 155)
                            ladder_index = 2;
                        else if (tower_angle >= 155 && tower_angle < 200)
                            ladder_index = 3;
                        else if (tower_angle >= 200 && tower_angle < 250)
                            ladder_index = 4;
                        else if (tower_angle >= 250 && tower_angle < 295)
                            ladder_index = 5;
                        else if (tower_angle >= 295 && tower_angle < 303)
                            ladder_index = 6;
                        else if (tower_angle >= 303 && tower_angle < 318)
                            ladder_index = 7;
                        else if (tower_angle >= 318 && tower_angle < 325)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 125 && tower_angle < 225)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 125) / 100);
                        if (tower_angle >= 225 && tower_angle < 325)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 225) / 100);
                    }
                    if (ii == 4)
                    {
                        if (tower_angle >= 170 && tower_angle < 177)
                            ladder_index = 0;
                        else if (tower_angle >= 177 && tower_angle < 192)
                            ladder_index = 1;
                        else if (tower_angle >= 192 && tower_angle < 200)
                            ladder_index = 2;
                        else if (tower_angle >= 200 && tower_angle < 245)
                            ladder_index = 3;
                        else if (tower_angle >= 245 && tower_angle < 295)
                            ladder_index = 4;
                        else if (tower_angle >= 295 && tower_angle < 340)
                            ladder_index = 5;
                        else if (tower_angle >= 340 && tower_angle < 348)
                            ladder_index = 6;
                        else if (tower_angle >= 348 || tower_angle < 3)
                            ladder_index = 7;
                        else if (tower_angle >= 3 && tower_angle < 10)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 170 && tower_angle < 270)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 170) / 100);
                        if (tower_angle >= 270)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 270) / 100);
                        if (tower_angle <= 10)
                            xx = lerp(0, piecemaxdistance, (90 + tower_angle) / 100);
                    }
                    if (ii == 5)
                    {
                        if (tower_angle >= 215 && tower_angle < 222)
                            ladder_index = 0;
                        else if (tower_angle >= 222 && tower_angle < 237)
                            ladder_index = 1;
                        else if (tower_angle >= 237 && tower_angle < 245)
                            ladder_index = 2;
                        else if (tower_angle >= 245 && tower_angle < 290)
                            ladder_index = 3;
                        else if (tower_angle >= 290 && tower_angle < 340)
                            ladder_index = 4;
                        else if (tower_angle >= 340 || tower_angle < 25)
                            ladder_index = 5;
                        else if (tower_angle >= 25 && tower_angle < 33)
                            ladder_index = 6;
                        else if (tower_angle >= 33 && tower_angle < 48)
                            ladder_index = 7;
                        else if (tower_angle >= 48 && tower_angle < 55)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 215 && tower_angle < 315)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 215) / 100);
                        if (tower_angle >= 315)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 315) / 100);
                        if (tower_angle <= 55)
                            xx = lerp(0, piecemaxdistance, (45 + tower_angle) / 100);
                    }
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
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 260) / 100);
                        if (tower_angle < 100)
                            xx = lerp(0, piecemaxdistance, tower_angle / 100);
                    }
                    if (ii == 7)
                    {
                        if (tower_angle >= 305 && tower_angle < 312)
                            ladder_index = 0;
                        else if (tower_angle >= 312 && tower_angle < 327)
                            ladder_index = 1;
                        else if (tower_angle >= 327 && tower_angle < 335)
                            ladder_index = 2;
                        else if (tower_angle >= 335 || tower_angle < 20)
                            ladder_index = 3;
                        else if (tower_angle >= 20 && tower_angle < 70)
                            ladder_index = 4;
                        else if (tower_angle >= 70 && tower_angle < 115)
                            ladder_index = 5;
                        else if (tower_angle >= 115 && tower_angle < 123)
                            ladder_index = 6;
                        else if (tower_angle >= 123 && tower_angle < 138)
                            ladder_index = 7;
                        else if (tower_angle >= 138 && tower_angle < 145)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (tower_angle >= 305)
                            xx = lerp(piecemaxdistance * -1, 0, (tower_angle - 305) / 100);
                        if (tower_angle < 45)
                            xx = lerp(piecemaxdistance * -1, 0, (45 + tower_angle) / 100);
                        if (tower_angle >= 45 && tower_angle < 145)
                            xx = lerp(0, piecemaxdistance, (tower_angle - 45) / 100);
                    }
                }
                if (wide_tower == true)
                {
                    var _tower_angle = tower_angle;
                    var _tower_x_origin = 320 + tower_xoffset[i];
                    if (tower_object[i][ii] == 4 && tower_eyeoffset[i] > 0)
                    {
                        tower_eyeoffset[i]++;
                        if (tower_eyeoffset[i] >= 360)
                            tower_eyeoffset[i] -= 360;
                        _tower_angle = tower_angle + tower_eyeoffset[i];
                        if (_tower_angle >= 360)
                            _tower_angle -= 360;
                    }
                    if (ii == 0)
                    {
                        vis = true;
                        if (_tower_angle >= 350 && _tower_angle < 353)
                            ladder_index = 0;
                        else if (_tower_angle >= 353 || _tower_angle < 6)
                            ladder_index = 1;
                        else if (_tower_angle >= 6 && _tower_angle < 20)
                            ladder_index = 2;
                        else if (_tower_angle >= 20 && _tower_angle < 50)
                            ladder_index = 3;
                        else if (_tower_angle >= 50 && _tower_angle < 130)
                            ladder_index = 4;
                        else if (_tower_angle >= 130 && _tower_angle < 160)
                            ladder_index = 5;
                        else if (_tower_angle >= 160 && _tower_angle < 173)
                            ladder_index = 6;
                        else if (_tower_angle >= 173 && _tower_angle < 187)
                            ladder_index = 7;
                        else if (_tower_angle >= 187 && _tower_angle < 190)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 350)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 350) / 100) + 4;
                        if (_tower_angle < 90)
                            xx = lerp(piecemaxdistance * -1, 0, (10 + _tower_angle) / 100) + 4;
                        if (_tower_angle >= 90 && _tower_angle < 190)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 90) / 100) + 4;
                        if (_tower_angle > 190 && _tower_angle < 350)
                            vis = false;
                    }
                    if (ii == 1)
                    {
                        vis = true;
                        if (_tower_angle >= 25 && _tower_angle < 28)
                            ladder_index = 0;
                        else if (_tower_angle >= 28 && _tower_angle < 41)
                            ladder_index = 1;
                        else if (_tower_angle >= 41 && _tower_angle < 55)
                            ladder_index = 2;
                        else if (_tower_angle >= 55 && _tower_angle < 85)
                            ladder_index = 3;
                        else if (_tower_angle >= 85 && _tower_angle < 165)
                            ladder_index = 4;
                        else if (_tower_angle >= 165 && _tower_angle < 195)
                            ladder_index = 5;
                        else if (_tower_angle >= 195 && _tower_angle < 209)
                            ladder_index = 6;
                        else if (_tower_angle >= 209 && _tower_angle < 222)
                            ladder_index = 7;
                        else if (_tower_angle >= 222 && _tower_angle < 225)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 25 && _tower_angle < 125)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 25) / 100) + 2;
                        if (_tower_angle >= 125 && _tower_angle < 225)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 125) / 100) + 2;
                        if (_tower_angle > 225 || _tower_angle < 25)
                            vis = false;
                    }
                    if (ii == 2)
                    {
                        vis = true;
                        if (_tower_angle >= 60 && _tower_angle < 63)
                            ladder_index = 0;
                        else if (_tower_angle >= 63 && _tower_angle < 76)
                            ladder_index = 1;
                        else if (_tower_angle >= 76 && _tower_angle < 90)
                            ladder_index = 2;
                        else if (_tower_angle >= 90 && _tower_angle < 120)
                            ladder_index = 3;
                        else if (_tower_angle >= 120 && _tower_angle < 200)
                            ladder_index = 4;
                        else if (_tower_angle >= 200 && _tower_angle < 230)
                            ladder_index = 5;
                        else if (_tower_angle >= 230 && _tower_angle < 244)
                            ladder_index = 6;
                        else if (_tower_angle >= 244 && _tower_angle < 257)
                            ladder_index = 7;
                        else if (_tower_angle >= 257 && _tower_angle < 260)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 60 && _tower_angle < 160)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 60) / 100);
                        if (_tower_angle >= 160 && _tower_angle < 260)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 160) / 100);
                        if (_tower_angle > 260 || _tower_angle < 60)
                            vis = false;
                    }
                    if (ii == 3)
                    {
                        vis = true;
                        if (_tower_angle >= 95 && _tower_angle < 98)
                            ladder_index = 0;
                        else if (_tower_angle >= 98 && _tower_angle < 111)
                            ladder_index = 1;
                        else if (_tower_angle >= 111 && _tower_angle < 125)
                            ladder_index = 2;
                        else if (_tower_angle >= 125 && _tower_angle < 155)
                            ladder_index = 3;
                        else if (_tower_angle >= 155 && _tower_angle < 235)
                            ladder_index = 4;
                        else if (_tower_angle >= 235 && _tower_angle < 265)
                            ladder_index = 5;
                        else if (_tower_angle >= 265 && _tower_angle < 279)
                            ladder_index = 6;
                        else if (_tower_angle >= 279 && _tower_angle < 292)
                            ladder_index = 7;
                        else if (_tower_angle >= 292 && _tower_angle < 295)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 95 && _tower_angle < 195)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 95) / 100);
                        if (_tower_angle >= 195 && _tower_angle < 295)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 195) / 100);
                        if (_tower_angle > 330 || _tower_angle < 130)
                            vis = false;
                    }
                    if (ii == 4)
                    {
                        vis = true;
                        if (_tower_angle >= 130 && _tower_angle < 133)
                            ladder_index = 0;
                        else if (_tower_angle >= 133 && _tower_angle < 146)
                            ladder_index = 1;
                        else if (_tower_angle >= 146 && _tower_angle < 160)
                            ladder_index = 2;
                        else if (_tower_angle >= 160 && _tower_angle < 190)
                            ladder_index = 3;
                        else if (_tower_angle >= 190 && _tower_angle < 270)
                            ladder_index = 4;
                        else if (_tower_angle >= 270 && _tower_angle < 300)
                            ladder_index = 5;
                        else if (_tower_angle >= 300 && _tower_angle < 314)
                            ladder_index = 6;
                        else if (_tower_angle >= 314 && _tower_angle < 327)
                            ladder_index = 7;
                        else if (_tower_angle >= 327 && _tower_angle < 330)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 130 && _tower_angle < 230)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 130) / 100);
                        if (_tower_angle >= 230 && _tower_angle < 330)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 230) / 100);
                        if (_tower_angle > 330 || _tower_angle < 130)
                            vis = false;
                    }
                    if (ii == 5)
                    {
                        vis = true;
                        if (_tower_angle >= 165 && _tower_angle < 168)
                            ladder_index = 0;
                        else if (_tower_angle >= 168 && _tower_angle < 181)
                            ladder_index = 1;
                        else if (_tower_angle >= 181 && _tower_angle < 195)
                            ladder_index = 2;
                        else if (_tower_angle >= 195 && _tower_angle < 225)
                            ladder_index = 3;
                        else if (_tower_angle >= 225 && _tower_angle < 305)
                            ladder_index = 4;
                        else if (_tower_angle >= 305 && _tower_angle < 335)
                            ladder_index = 5;
                        else if (_tower_angle >= 335 && _tower_angle < 349)
                            ladder_index = 6;
                        else if (_tower_angle >= 349 || _tower_angle < 2)
                            ladder_index = 7;
                        else if (_tower_angle >= 2 && _tower_angle < 5)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 165 && _tower_angle < 265)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 165) / 100);
                        if (_tower_angle >= 265)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 265) / 100);
                        if (_tower_angle <= 5)
                            xx = lerp(0, piecemaxdistance, (95 + _tower_angle) / 100);
                        if (_tower_angle > 5 && _tower_angle < 165)
                            vis = false;
                    }
                    if (ii == 6)
                    {
                        vis = true;
                        if (_tower_angle >= 200 && _tower_angle < 203)
                            ladder_index = 0;
                        else if (_tower_angle >= 203 && _tower_angle < 216)
                            ladder_index = 1;
                        else if (_tower_angle >= 216 && _tower_angle < 230)
                            ladder_index = 2;
                        else if (_tower_angle >= 230 && _tower_angle < 260)
                            ladder_index = 3;
                        else if (_tower_angle >= 260 && _tower_angle < 340)
                            ladder_index = 4;
                        else if (_tower_angle >= 340 || _tower_angle < 10)
                            ladder_index = 5;
                        else if (_tower_angle >= 10 && _tower_angle < 24)
                            ladder_index = 6;
                        else if (_tower_angle >= 24 && _tower_angle < 37)
                            ladder_index = 7;
                        else if (_tower_angle >= 37 && _tower_angle < 40)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 200 && _tower_angle < 300)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 200) / 100);
                        if (_tower_angle >= 300)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 300) / 100);
                        if (_tower_angle <= 40)
                            xx = lerp(0, piecemaxdistance, (60 + _tower_angle) / 100);
                        if (_tower_angle > 40 && _tower_angle < 200)
                            vis = false;
                    }
                    if (ii == 7)
                    {
                        vis = true;
                        if (_tower_angle >= 235 && _tower_angle < 238)
                            ladder_index = 0;
                        else if (_tower_angle >= 238 && _tower_angle < 251)
                            ladder_index = 1;
                        else if (_tower_angle >= 251 && _tower_angle < 265)
                            ladder_index = 2;
                        else if (_tower_angle >= 265 && _tower_angle < 295)
                            ladder_index = 3;
                        else if (_tower_angle >= 295 || _tower_angle < 15)
                            ladder_index = 4;
                        else if (_tower_angle >= 15 && _tower_angle < 45)
                            ladder_index = 5;
                        else if (_tower_angle >= 45 && _tower_angle < 59)
                            ladder_index = 6;
                        else if (_tower_angle >= 59 && _tower_angle < 72)
                            ladder_index = 7;
                        else if (_tower_angle >= 72 && _tower_angle < 75)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 235 && _tower_angle < 335)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 235) / 100);
                        if (_tower_angle >= 335)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 335) / 100);
                        if (_tower_angle <= 75)
                            xx = lerp(0, piecemaxdistance, (25 + _tower_angle) / 100);
                        if (_tower_angle > 75 && _tower_angle < 235)
                            vis = false;
                    }
                    if (ii == 8)
                    {
                        vis = true;
                        if (_tower_angle >= 270 && _tower_angle < 273)
                            ladder_index = 0;
                        else if (_tower_angle >= 273 && _tower_angle < 286)
                            ladder_index = 1;
                        else if (_tower_angle >= 286 && _tower_angle < 300)
                            ladder_index = 2;
                        else if (_tower_angle >= 300 && _tower_angle < 330)
                            ladder_index = 3;
                        else if (_tower_angle >= 330 || _tower_angle < 50)
                            ladder_index = 4;
                        else if (_tower_angle >= 50 && _tower_angle < 80)
                            ladder_index = 5;
                        else if (_tower_angle >= 80 && _tower_angle < 94)
                            ladder_index = 6;
                        else if (_tower_angle >= 94 && _tower_angle < 107)
                            ladder_index = 7;
                        else if (_tower_angle >= 107 && _tower_angle < 110)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 270)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 270) / 100) - 2;
                        if (_tower_angle <= 10)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 10) / 100) - 2;
                        if (_tower_angle >= 10 && _tower_angle <= 110)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 10) / 100) - 2;
                        if (_tower_angle > 110 && _tower_angle < 270)
                            vis = false;
                    }
                    if (ii == 9)
                    {
                        vis = true;
                        if (_tower_angle >= 305 && _tower_angle < 308)
                            ladder_index = 0;
                        else if (_tower_angle >= 308 && _tower_angle < 321)
                            ladder_index = 1;
                        else if (_tower_angle >= 321 && _tower_angle < 335)
                            ladder_index = 2;
                        else if (_tower_angle >= 335 || _tower_angle < 5)
                            ladder_index = 3;
                        else if (_tower_angle >= 5 && _tower_angle < 85)
                            ladder_index = 4;
                        else if (_tower_angle >= 85 && _tower_angle < 115)
                            ladder_index = 5;
                        else if (_tower_angle >= 115 && _tower_angle < 129)
                            ladder_index = 6;
                        else if (_tower_angle >= 129 && _tower_angle < 142)
                            ladder_index = 7;
                        else if (_tower_angle >= 142 && _tower_angle < 145)
                            ladder_index = 8;
                        else
                            ladder_index = 9;
                        if (_tower_angle >= 305)
                            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 305) / 100) - 4;
                        if (_tower_angle <= 45)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 45) / 100) - 4;
                        if (_tower_angle >= 45 && _tower_angle <= 145)
                            xx = lerp(0, piecemaxdistance, (_tower_angle - 45) / 100) - 4;
                        if (_tower_angle > 145 && _tower_angle < 305)
                            vis = false;
                    }
                }
                if (((((40 * i) + yoffset) - (towerpiececount * 40)) > -20 || endclimb == false) && vis == true)
                {
                    if (tower_piece_sprite[i] == 5316)
                    {
                        var bg_index = ladder_index;
                        if (bg_index == 9)
                        {
                        }
                        draw_sprite_ext(spr_tower_rotating_bg, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), 1.1, 1, 0, c_white, 1);
                    }
                    if (tower_object[i][ii] == 1)
                        draw_sprite(spr_tower_rotating_ladder, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
                    if (tower_object[i][ii] == 2)
                        draw_sprite(spr_tower_rotating_steps, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
                    if (tower_object[i][ii] == 3)
                        draw_sprite(spr_tower_rotating_rocks, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
                    if (tower_object[i][ii] == 4)
                    {
                        draw_sprite(spr_tower_rotating_eye, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40));
                        if (ladder_index != 9 && (eyesmoketimer % 8) == 0)
                            inst = instance_create(((320 + xx + tower_xoffset[i]) - 18) + random(36), (((40 * i) + yoffset) - (towerpiececount * 40)) + 16 + random(12), obj_fountainball);
                    }
                    if (tower_eyedrip[i][ii] > 0)
                    {
                        draw_sprite_ext(spr_tower_rotating_bg, ladder_index, 320 + xx + tower_xoffset[i], ((40 * i) + yoffset) - (towerpiececount * 40), 0.6, tower_eyedrip[i][ii] / 10, 0, c_black, 1);
                        if (tower_eyedrip[i][ii] < 10)
                        {
                            tower_eyedrip[i][ii]++;
                            if (tower_object[i][ii] == 10)
                                tower_eyedrip[i + 1][ii] = 1;
                        }
                    }
                }
            }
        }
    }
}
if (room == room_dw_church_dogclimb)
{
    for (var i = render_ypos_start; i < render_ypos_end; i++)
    {
        for (var ii = 0; ii < 8; ii++)
        {
            var ladder_index = 4;
            var xx = 0;
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
    for (var i = 75; i > 0; i -= 1)
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
