ladder_index = 4;
xx = 0;
vis = false;
towerback = false;
piecemaxdistance = 70;
if (wide_tower)
    piecemaxdistance = 110;
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
    vis = true;
    _tower_angle = tower_angle;
    _tower_x_origin = 320 + tower_xoffset[i];
    if (tower_object[i][ii] == 4 && tower_eyeoffset[i] > 0)
    {
        tower_eyeoffset[i] += 2;
        if (tower_eyeoffset[i] >= 360)
            tower_eyeoffset[i] -= 360;
        _tower_angle = tower_angle + tower_eyeoffset[i];
        if (_tower_angle >= 360)
            _tower_angle -= 360;
    }
    if (ii == 0)
    {
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
        if (_tower_angle >= 25 && _tower_angle < 125)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 25) / 100) + 2;
        if (_tower_angle >= 125 && _tower_angle < 225)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 125) / 100) + 2;
        if (_tower_angle > 225 || _tower_angle < 25)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 2)
    {
        if (_tower_angle >= 60 && _tower_angle < 160)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 60) / 100);
        if (_tower_angle >= 160 && _tower_angle < 260)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 160) / 100);
        if (_tower_angle > 260 || _tower_angle < 60)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 3)
    {
        if (_tower_angle >= 95 && _tower_angle < 195)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 95) / 100);
        if (_tower_angle >= 195 && _tower_angle < 295)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 195) / 100);
        if (_tower_angle > 330 || _tower_angle < 130)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 4)
    {
        if (_tower_angle >= 130 && _tower_angle < 230)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 130) / 100);
        if (_tower_angle >= 230 && _tower_angle < 330)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 230) / 100);
        if (_tower_angle > 330 || _tower_angle < 130)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 5)
    {
        if (_tower_angle >= 165 && _tower_angle < 265)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 165) / 100);
        if (_tower_angle >= 265)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 265) / 100);
        if (_tower_angle <= 5)
            xx = lerp(0, piecemaxdistance, (95 + _tower_angle) / 100);
        if (_tower_angle > 5 && _tower_angle < 165)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 6)
    {
        if (_tower_angle >= 200 && _tower_angle < 300)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 200) / 100);
        if (_tower_angle >= 300)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 300) / 100);
        if (_tower_angle <= 40)
            xx = lerp(0, piecemaxdistance, (60 + _tower_angle) / 100);
        if (_tower_angle > 40 && _tower_angle < 200)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 7)
    {
        if (_tower_angle >= 235 && _tower_angle < 335)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 235) / 100);
        if (_tower_angle >= 335)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 335) / 100);
        if (_tower_angle <= 75)
            xx = lerp(0, piecemaxdistance, (25 + _tower_angle) / 100);
        if (_tower_angle > 75 && _tower_angle < 235)
        {
            vis = false;
            towerback = true;
        }
    }
    if (ii == 8)
    {
        if (_tower_angle >= 270)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 270) / 100) - 2;
        if (_tower_angle <= 10)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 10) / 100) - 2;
        if (_tower_angle >= 10 && _tower_angle <= 110)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 10) / 100) - 2;
        if (_tower_angle > 110 && _tower_angle < 270)
        {
            vis = false;
            towerback = true;
            if (_tower_angle >= 110 && _tower_angle < 190)
                xx = lerp(piecemaxdistance, 0, (_tower_angle - 110) / 80) + 2;
            if (_tower_angle >= 190 && _tower_angle < 270)
                xx = lerp(0, piecemaxdistance * -1, (_tower_angle - 190) / 80) + 2;
        }
    }
    if (ii == 9)
    {
        if (_tower_angle >= 305)
            xx = lerp(piecemaxdistance * -1, 0, (_tower_angle - 305) / 100) - 4;
        if (_tower_angle <= 45)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 45) / 100) - 4;
        if (_tower_angle >= 45 && _tower_angle <= 145)
            xx = lerp(0, piecemaxdistance, (_tower_angle - 45) / 100) - 4;
        if (_tower_angle > 145 && _tower_angle < 305)
        {
            vis = false;
            towerback = true;
            if (_tower_angle >= 145 && _tower_angle < 225)
                xx = lerp(piecemaxdistance, 0, (_tower_angle - 145) / 80) + 2;
            if (_tower_angle >= 225 && _tower_angle < 305)
                xx = lerp(0, piecemaxdistance * -1, (_tower_angle - 225) / 80) + 2;
        }
    }
    if (xx < (piecemaxdistance * -0.93))
        ladder_index = 0;
    else if (xx < (piecemaxdistance * -0.7))
        ladder_index = 1;
    else if (xx < (piecemaxdistance * -0.65))
        ladder_index = 2;
    else if (xx < (piecemaxdistance * -0.44))
        ladder_index = 3;
    else if (xx < (piecemaxdistance * 0.44))
        ladder_index = 4;
    else if (xx < (piecemaxdistance * 0.65))
        ladder_index = 5;
    else if (xx < (piecemaxdistance * 0.78))
        ladder_index = 6;
    else if (xx <= (piecemaxdistance * 0.93))
        ladder_index = 7;
    else if (xx > (piecemaxdistance * 0.93))
        ladder_index = 8;
    else
        ladder_index = 9;
}
