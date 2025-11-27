if (golden_mode)
    pal_swap_set(palette_sprite, 1, false);
if (facing == "r")
    reversal = 1;
if (facing == "l")
    reversal = 0;
facing = "d";
siner += speedscale;
siner0 += speedscale;
siner1 += speedscale;
siner2 += speedscale;
if (!scaled_bounce)
{
    if (bounce == 1)
    {
        image_yscale = 2.5;
        image_xscale = (image_xscale < 0) ? -1.5 : 1.5;
        bounce = 2;
    }
    if (bounce == 2)
    {
        var target_scale = (image_xscale < 0) ? -2 : 2;
        scr_lerpvar("image_xscale", image_xscale, target_scale, 16, -2, "out");
        scr_lerpvar("image_yscale", image_yscale, 2, 16, -2, "out");
        bounce = 3;
    }
    if (bounce == 3)
    {
        if (image_yscale <= 2.01)
        {
            image_yscale = 2;
            bounce = 0;
        }
    }
}
else
{
    if (bounce == 1)
    {
        cur_xscale = image_xscale;
        cur_yscale = image_yscale;
        bounce = 2;
    }
    if (bounce == 2)
    {
        image_yscale = cur_yscale * 1.25;
        image_xscale = cur_xscale * 0.75;
        bounce = 3;
    }
    if (bounce == 3)
    {
        scr_lerpvar("image_xscale", image_xscale, cur_xscale, 16, -2, "out");
        scr_lerpvar("image_yscale", image_yscale, cur_yscale, 16, -2, "out");
        bounce = 4;
    }
    if (bounce == 4)
    {
        if (image_yscale <= (cur_yscale + 0.1))
        {
            image_yscale = cur_yscale;
            bounce = 0;
        }
    }
}
if (preset != -1)
{
    drawtype = 0;
    if (preset == 0)
    {
        image_speed = 0;
        wobblestate = 0;
        wobbletime = 0;
        wobbleamt = 0;
        drawtype = 1;
    }
    if (preset == 1)
    {
        sprite_index = spr_tenna_laugh_pose;
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 10;
    }
    if (preset == 2)
    {
        sprite_index = spr_tenna_point_up;
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 8;
    }
    if (preset == -2)
    {
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 8;
    }
    if (preset == -3)
    {
        sprite_index = spr_tenna_pose_podium;
        image_index = 1;
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 8;
    }
    if (preset == 2.5)
    {
        sprite_index = spr_tenna_point_top;
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 8;
    }
    if (preset == 3)
    {
        sprite_index = spr_tenna_listening;
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 30;
    }
    if (preset == 4)
    {
        sprite_index = spr_tenna_laugh_pose;
        wobblestate = 3;
        wobbletime = 3;
        wobbleamt = 15;
    }
    if (preset == 5)
    {
        reversal = 0;
        animchangetimer = 8;
        wobblestate = 4;
        wobbleamt = 40;
        wobbletime = 4;
        changespeed = 20;
    }
    if (preset == 6)
    {
        sprite_index = spr_tenna_bow;
        image_speed = 0.25;
        wobblestate = 5;
        wobbletime = 3;
        wobbleamt = 10;
    }
    if (preset == 7)
    {
        sprite_index = spr_tenna_sad;
        wobblestate = 6;
        wobbletime = 12;
        wobbleamt = 20;
    }
    if (preset == 8)
    {
        wobblestate = 6;
        wobbletime = 1;
        wobbleamt = 2;
    }
    if (preset == 9)
    {
        wobblestate = 7;
        wobbletime = 0.5;
        wobbleamt = 2;
    }
    if (preset == 10)
    {
        wobblestate = 0;
        wobbletime = 0;
        wobbleamt = 0;
        drawtype = 1;
    }
    if (preset == 11)
    {
        sprite_index = spr_tenna_bow;
        image_speed = 0.5;
        wobblestate = 8;
        wobbletime = 1;
        wobbleamt = 10;
    }
    if (preset == 12)
    {
        sprite_index = spr_tenna_grasp_anim;
        image_speed = 0.35;
        wobblestate = 1;
        wobbletime = 2;
        wobbleamt = 20;
    }
    if (preset == 13)
    {
        sprite_index = spr_tenna_grasp_anim_b;
        image_speed = 0.5;
        wobblestate = 6;
        wobbletime = 2;
        wobbleamt = 20;
        drawtype = 1;
    }
    if (preset == 14)
    {
        sprite_index = spr_tenna_evil;
        wobblestate = 7;
        wobbletime = 1;
        wobbleamt = 2;
    }
    if (preset == 15)
    {
        wobblestate = 6;
        wobbletime = 0.5;
        wobbleamt = 6;
    }
    if (preset == 16)
    {
        wobblestate = 10;
        wobbletime = 3;
        wobbleamt = 30;
    }
    if (preset == 17)
    {
        sprite_index = spr_tenna_dance_cane;
        wobblestate = 0;
        wobbletime = 0;
        wobbleamt = 0;
        drawtype = 1;
    }
    if (preset == 18)
    {
        reversal = 0;
        animchangetimer = 4;
        wobblestate = 4;
        wobbleamt = 20;
        wobbletime = 4;
    }
    if (preset == 19)
    {
        rosecon = 1;
        rosetimer = 0;
        drawtype = 3;
        image_xscale = 0.5 * sign(image_xscale);
        image_yscale = 0.5;
        image_speed = 0;
        image_index = 0;
    }
    if (preset == 20)
    {
        wobblestate = 5;
        wobbletime = 3;
        wobbleamt = 30;
    }
    if (preset == 21)
    {
        wobblestate = 12;
        wobbleamt = 7;
        wobbletime = 4.5;
        drawtype = 0;
        image_speed = 0;
        sprite_index = spr_tenna_point_at_screen;
    }
    if (preset == -21)
    {
        wobblestate = 12;
        wobbleamt = 7;
        wobbletime = 4.5;
        drawtype = 0;
    }
    if (preset == 22)
    {
        wobblestate = 7;
        wobbleamt = 5.9;
        wobbletime = 2.4;
        drawtype = 0;
        image_speed = 0;
        sprite_index = spr_tenna_pose;
    }
    if (preset == 23)
    {
        wobblestate = 8;
        wobbleamt = 7.7;
        wobbletime = 6;
        drawtype = 0;
        image_speed = 0.25;
        sprite_index = spr_tenna_blossom_animation;
    }
    if (preset == 24)
    {
        wobblestate = 8;
        wobbleamt = 7.7;
        wobbletime = 6;
        drawtype = 0;
        image_speed = 0.25;
        sprite_index = spr_tenna_dance_cabbage;
    }
    if (preset == 25)
    {
        wobblestate = 8;
        wobbleamt = 7.7;
        wobbletime = 6;
        drawtype = 0;
        image_speed = 0.25;
        sprite_index = spr_tenna_dance_cane;
    }
    if (preset == 26)
    {
        wobblestate = 5.5;
        wobbletime = 10;
        wobbleamt = 40;
        siner = 1.5707963267948966 * wobbletime;
    }
    if (preset == 27)
    {
        sprite_index = spr_tenna_hooray;
        image_index = 0;
        image_speed = 0;
        bounce = 0;
    }
    if (preset == 28)
    {
        sprite_index = spr_tenna_hooray;
        image_index = 3;
        image_speed = 0;
        wobbleamt = 30;
        wobblestate = 1;
        wobbletime = 10;
        bounce = 1;
    }
    if (preset == 30)
    {
        wobblestate = 0;
        wobbleamt = 0;
        wobbletime = 0;
        drawtype = 1;
        image_speed = 1;
        sprite_index = spr_tenna_twirl;
    }
    if (preset == 31)
    {
        wobbleamt = 15;
        wobblestate = 12;
        wobbletime = 5;
        bounce = 0;
    }
    if (preset == 32)
    {
        wobblestate = 12;
        wobbleamt = 7;
        wobbletime = 4.5;
        drawtype = 0;
        image_speed = 0;
        sprite_index = spr_tenna_pose;
    }
    if (preset == -32)
    {
        wobblestate = 12;
        wobbleamt = 7;
        wobbletime = 4.5;
        drawtype = 0;
    }
    if (preset == 33)
    {
        reversal = 0;
        wobblestate = 8;
        wobbleamt = 40;
        wobbletime = 4;
    }
    if (preset == 34)
    {
        reversal = 0;
        wobblestate = 13;
        changespeed = 15;
        animchangetimer = 0;
        pointcon = 0;
        wobbleamt = 10;
        wobbletime = 4;
    }
    if (preset == 35)
    {
        reversal = 0;
        wobblestate = -1;
        rate = 2;
        shtimer = 0;
        drawtype = 2;
    }
    if (preset == 36)
    {
        reversal = 0;
        drawtype = 0;
        siner = 0;
        wobbleamt = 10;
        wobblestate = 16;
    }
    if (preset == 37)
    {
        reversal = 0;
        drawtype = 0;
        siner = 0;
        wobbleamt = 10;
        wobblestate = 14;
    }
    if (preset == 69)
    {
        wobblestate = 6;
        wobbleamt = 20;
        wobbletime = 4;
        drawtype = 0;
        image_speed = 0.25;
        sprite_index = spr_tenna_bulletin;
    }
    preset = -1;
}
x1 = x - sprite_xoffset;
y1 = y - sprite_yoffset;
x2 = (x - sprite_xoffset) + sprite_width;
y2 = y - sprite_yoffset;
x3 = (x - sprite_xoffset) + sprite_width;
y3 = (y - sprite_yoffset) + sprite_height;
x4 = x - sprite_xoffset;
y4 = (y - sprite_yoffset) + sprite_height;
var reversalsign = 1;
if (reversal == 1)
    reversalsign = -1;
if (wobblestate == 1)
{
    x1 += (abs(sin(siner / wobbletime) * wobbleamt) * reversalsign);
    x2 += (abs(sin(siner / wobbletime) * wobbleamt) * reversalsign);
    y1 -= abs(sin(siner / wobbletime) * wobbleamt);
    y2 += abs(sin(siner / wobbletime) * wobbleamt);
}
if (wobblestate == 2)
{
    x1 += (sin(siner / wobbletime) * 10 * reversalsign);
    x2 += (sin(siner / wobbletime) * 10 * reversalsign);
    y1 -= (sin((siner / wobbletime) * 0.9) * 14);
    y2 += (sin((siner / wobbletime) * 1.1) * 14);
}
if (wobblestate == 3)
{
    if (sin(siner / wobbletime) < 0)
        reversal = 1;
    else
        reversal = 0;
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (reversal == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
}
var _keep_pivot = false;
if (wobblestate == 4)
{
    siner -= (speedscale - 1);
    animchangetimer += speedscale;
    if (animchangetimer >= changespeed && pointcon == 0)
    {
        reversal = 0;
        sprite_index = spr_tenna_point_left;
        bounce = 1;
        pointcon++;
    }
    if (animchangetimer >= (changespeed * 2) && pointcon == 1)
    {
        reversal = 0;
        sprite_index = spr_tenna_point_up;
        x1 = x - sprite_xoffset;
        y1 = y - sprite_yoffset;
        x2 = (x - sprite_xoffset) + sprite_width;
        y2 = y - sprite_yoffset;
        x3 = (x - sprite_xoffset) + sprite_width;
        y3 = (y - sprite_yoffset) + sprite_height;
        x4 = x - sprite_xoffset;
        y4 = (y - sprite_yoffset) + sprite_height;
        bounce = 1;
        pointcon++;
    }
    if (animchangetimer >= (changespeed * 3) && pointcon == 2)
    {
        sprite_index = spr_tenna_point_left;
        reversal = 1;
        bounce = 1;
        pointcon++;
    }
    if (animchangetimer >= (changespeed * 4) && !i_ex(obj_elnina_lanino_controller))
    {
        reversal = 1;
        sprite_index = spr_tenna_point_up;
        x1 = x - sprite_xoffset;
        y1 = y - sprite_yoffset;
        x2 = (x - sprite_xoffset) + sprite_width;
        y2 = y - sprite_yoffset;
        x3 = (x - sprite_xoffset) + sprite_width;
        y3 = (y - sprite_yoffset) + sprite_height;
        x4 = x - sprite_xoffset;
        y4 = (y - sprite_yoffset) + sprite_height;
        bounce = 1;
        animchangetimer = 0;
        pointcon = 0;
    }
    if (pointcon == 3)
        _keep_pivot = true;
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (reversal == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
}
if (wobblestate == 5)
{
    if (sin(siner / wobbletime) < 0)
        reversal = 1;
    else
        reversal = 0;
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (reversal == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
}
if (wobblestate > 5 && wobblestate < 6)
{
    if (wobblestate == 5.5)
    {
        x1 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
        x2 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
        y1 -= (abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt);
        y2 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) / 2);
        if (sin((siner + 1) / wobbletime) <= 0.5)
        {
            wobblestate = 5.6;
            sprite_index = spr_tenna_sad;
        }
    }
    if (wobblestate == 5.6)
    {
        x1 += ((abs(sin(siner / wobbletime) * wobbleamt) - (wobbleamt / 2)) * reversalsign);
        x2 += ((abs(sin(siner / wobbletime) * wobbleamt) - (wobbleamt / 2)) * reversalsign);
        y1 -= (abs(sin(siner / wobbletime) * wobbleamt) - (wobbleamt / 2));
        y2 += ((abs(sin(siner / wobbletime) * wobbleamt) - (wobbleamt / 2)) / 2);
        if (sin((siner + 1) / wobbletime) <= 0)
            preset = 7;
    }
}
if (wobblestate == 6)
{
    x1 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
    x2 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
    y1 -= (abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt);
    y2 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) / 2);
}
if (wobblestate == 7)
{
    x1 += (sin(siner / wobbletime) * wobbleamt * reversalsign);
    x2 += (sin(siner / wobbletime) * wobbleamt * reversalsign);
    y1 -= (((sin((siner / wobbletime) * 0.5) * wobbleamt) / 2) * -1);
    y2 += ((sin((siner / wobbletime) * 0.5) * wobbleamt) / 3);
}
if (wobblestate == 8)
{
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (reversal == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
}
if (wobblestate == 9)
{
    y1 -= (sin((siner / wobbletime) * wobbleamt * 0.9) * 14);
    y2 += (sin((siner / wobbletime) * wobbleamt * 1.1) * 14);
}
if (wobblestate == 10)
{
    var localReverse = 0;
    if (sin(siner / wobbletime) < 0)
        localReverse = 1;
    else
        localReverse = 0;
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (localReverse == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
}
if (wobblestate == 11)
{
    siner -= (speedscale - 1);
    animchangetimer += speedscale;
    if (animchangetimer >= changespeed && pointcon == 0)
    {
        reversal = 0;
        sprite_index = spr_tenna_point_left;
        bounce = 1;
        pointcon++;
    }
    if (animchangetimer >= (changespeed * 2) && pointcon == 1)
    {
        reversal = 0;
        sprite_index = spr_tenna_point_at_screen;
        x1 = x - sprite_xoffset;
        y1 = y - sprite_yoffset;
        x2 = (x - sprite_xoffset) + sprite_width;
        y2 = y - sprite_yoffset;
        x3 = (x - sprite_xoffset) + sprite_width;
        y3 = (y - sprite_yoffset) + sprite_height;
        x4 = x - sprite_xoffset;
        y4 = (y - sprite_yoffset) + sprite_height;
        bounce = 1;
        pointcon++;
    }
    if (animchangetimer >= (changespeed * 3) && pointcon == 2)
    {
        sprite_index = spr_tenna_salute_b;
        reversal = 0;
        bounce = 1;
        pointcon++;
    }
    if (animchangetimer >= (changespeed * 4))
    {
        reversal = 1;
        sprite_index = spr_tenna_point_up;
        x1 = x - sprite_xoffset;
        y1 = y - sprite_yoffset;
        x2 = (x - sprite_xoffset) + sprite_width;
        y2 = y - sprite_yoffset;
        x3 = (x - sprite_xoffset) + sprite_width;
        y3 = (y - sprite_yoffset) + sprite_height;
        x4 = x - sprite_xoffset;
        y4 = (y - sprite_yoffset) + sprite_height;
        bounce = 1;
        animchangetimer = 0;
        pointcon = 0;
    }
    if (pointcon == 3)
        _keep_pivot = true;
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (reversal == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
}
if (wobblestate == 12)
{
    var amt = abs(sin(siner / wobbletime) * wobbleamt);
    var amt2 = abs(cos(siner / wobbletime) * wobbleamt);
    x1 += amt;
    x2 += (amt2 / 2);
    y1 += amt;
    y2 += amt;
}
if (wobblestate == 13)
{
    siner -= (speedscale - 1);
    animchangetimer += speedscale;
    if (pointcon == 0)
    {
        sprite_index = spr_tenna_laugh_pose_alt;
        x1 = x - sprite_xoffset;
        y1 = y - sprite_yoffset;
        x2 = (x - sprite_xoffset) + sprite_width;
        y2 = y - sprite_yoffset;
        x3 = (x - sprite_xoffset) + sprite_width;
        y3 = (y - sprite_yoffset) + sprite_height;
        x4 = x - sprite_xoffset;
        y4 = (y - sprite_yoffset) + sprite_height;
        timediff = 0;
        pointcon++;
        wobbletime = 1;
        wobbleamt = 2;
    }
    if (pointcon == 1)
    {
        x1 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
        x2 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
        y1 -= (abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt);
        y2 += ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) / 2);
        timediff = animchangetimer / changespeed;
        x1 -= (timediff * 10);
        x2 += (timediff * 10);
        x4 -= (timediff * 10);
        x3 += (timediff * 10);
        y1 = (y1 - 10) + (timediff * 20);
        y2 = (y2 - 10) + (timediff * 20);
        if (animchangetimer >= changespeed)
            pointcon++;
    }
    if (pointcon == 99)
    {
        timediff = animchangetimer / changespeed;
        scr_debug_print(string(timediff));
        x1 -= (timediff * 20);
        x2 += (timediff * 20);
        x4 -= (timediff * 20);
        x3 += (timediff * 20);
        y1 += (timediff * 10);
        y2 += (timediff * 10);
        if (animchangetimer >= changespeed)
            pointcon++;
    }
    if (pointcon == 2)
    {
        reversal = 0;
        sprite_index = spr_tenna_hooray_armsup;
        bounce = 1;
        pointcon++;
    }
    if (pointcon == 3)
    {
        if (animchangetimer >= (changespeed * 2))
        {
            animchangetimer = 0;
            pointcon = 0;
        }
    }
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
}
if (wobblestate == 14)
{
    sprite_index = spr_tenna_frightened;
    shakex = sin(siner / 4) * sin(siner / 3) * 12;
    shakey = -abs(cos(siner / 2) * cos(siner / 1.5) * 28);
    drawtype = 0;
    siner = floor(siner);
    image_index = (sin(siner / 4) * 3) + 3;
}
if (wobblestate == 15)
{
    sprite_index = spr_tenna_freakout;
    shakex = sin(siner / 4) * sin(siner / 3) * 12;
    shakey = -abs(cos(siner / 2) * cos(siner / 1.5) * 28);
    drawtype = 0;
    siner = floor(siner);
    image_index = (sin(siner / 4) * 16) + 48;
}
if (wobblestate == 16)
{
    sprite_index = spr_tenna_freakout;
    shakex = sin(siner / 4) * sin(siner / 3) * 12;
    shakey = -abs(cos(siner / 2) * cos(siner / 1.5) * 28);
    drawtype = 0;
    siner = floor(siner);
    if (frame < 10)
        frame = 10;
    if ((siner % 40) == 0)
    {
        frame = floor(random(63)) + 10;
        wobbleamt = 3 + floor(random(10));
    }
    image_index = frame + (sin(siner / 2) * wobbleamt);
}
if (wobblestate == 17)
{
    x1 -= ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
    x2 -= ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) * reversalsign);
    y1 += (abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt);
    y2 -= ((abs(sin(siner / wobbletime) * wobbleamt) - wobbleamt) / 2);
}
if (reversal == 1)
{
    var remx1 = x1;
    var remx2 = x2;
    var remx3 = x3;
    var remx4 = x4;
    x1 = remx2;
    x2 = remx1;
    x3 = remx4;
    x4 = remx3;
    if (_keep_pivot)
    {
        x1 += (sprite_width - sprite_xoffset);
        x2 += (sprite_width - sprite_xoffset);
        x3 += (sprite_width - sprite_xoffset);
        x4 += (sprite_width - sprite_xoffset);
    }
}
if (drawtype == 0)
{
    if (xscale != 2)
    {
        x1 = x + ((x1 - x) * (xscale / 2));
        x2 = x + ((x2 - x) * (xscale / 2));
        x3 = x + ((x3 - x) * (xscale / 2));
        x4 = x + ((x4 - x) * (xscale / 2));
    }
    if (yscale != 2)
    {
        y1 = y + ((y1 - y) * (yscale / 2));
        y2 = y + ((y2 - y) * (yscale / 2));
        y3 = y + ((y3 - y) * (yscale / 2));
        y4 = y + ((y4 - y) * (yscale / 2));
    }
    if (shakex != 0)
    {
        x1 += shakex;
        x2 += shakex;
        x3 += shakex;
        x4 += shakex;
    }
    if (shakey != 0 && !i_ex(obj_tenna_board4_enemy))
    {
        y1 += shakey;
        y2 += shakey;
        y3 += shakey;
        y4 += shakey;
    }
    if (outline)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_pos(sprite_index, image_index, x1 - 2, y1, x2 - 2, y2, x3 - 2, y3, x4 - 2, y4, 1);
        draw_sprite_pos(sprite_index, image_index, x1, y1 - 2, x2, y2 - 2, x3, y3 - 2, x4, y4 - 2, 1);
        draw_sprite_pos(sprite_index, image_index, x1, y1 + 2, x2, y2 + 2, x3, y3 + 2, x4, y4 + 2, 1);
        draw_sprite_pos(sprite_index, image_index, x1 + 2, y1, x2 + 2, y2, x3 + 2, y3, x4 + 2, y4, 1);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (dropshadow)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_pos(sprite_index, image_index, x1 + dropdist, y1 + dropdist, x2 + dropdist, y2 + dropdist, x3 + dropdist, y3 + dropdist, x4 + dropdist, y4 + dropdist, 1);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (i_ex(obj_shadowman_sharpshoot_target) && threepartmode == true && !i_ex(obj_tenna_enemy))
    {
        var _color = 16777215;
        draw_sprite_ext(spr_tenna_point_top2, image_index, x - 6, y - 82, 2, 2, nose_rotation * -0.2, _color, 1);
        draw_sprite_ext(spr_tenna_point_pants, image_index, x - 4, y - 82, 2, 2, 0, _color, 1);
        draw_sprite_ext(spr_tenna_point_top, image_index, x - 4, y - 82, 2, 2, nose_rotation * -0.2, _color, 1);
        draw_sprite_ext(spr_tenna_point_up_nose, image_index, x + 4 + lengthdir_x(86, 90 + (nose_rotation * -0.2)), (y - 82) + lengthdir_y(86, 90 + (nose_rotation * -0.2)), 2, 2, nose_rotation * -1, _color, 1);
        if (hitflash > 0)
        {
            d3d_set_fog(true, c_white, 0, 0);
            draw_sprite_ext(spr_tenna_point_up_headonly, image_index, x - 4, y - 82, 2, 2, nose_rotation * -0.2, _color, 1);
            d3d_set_fog(false, c_white, 0, 0);
            hitflash--;
        }
        nose_sintimer++;
        nose_magnitude *= 0.85;
        nose_rotation = sin(nose_sintimer / 4) * nose_magnitude;
        flashsiner++;
    }
    else if ((i_ex(obj_tenna_enemy) && obj_tenna_enemy.minigametransition_con == 0) || (i_ex(obj_tvturnoff_manager) && global.encounterno != 135))
    {
        var _color;
        if (i_ex(obj_shadowman_sharpshoot_target))
        {
            var _b = (obj_shadowman_sharpshoot_target.tennahp + 0.3) / obj_shadowman_sharpshoot_target.tennahpmax;
            if (_b < 0.2)
                _b = 0.2;
            _color = merge_color(c_red, c_white, _b);
        }
        else
        {
            _color = 16777215;
        }
        if (!i_ex(obj_lightemup_controller) || (lightemupcon == 0 || lightemupcon == 1 || lightemupcon == 2))
        {
            animsiner++;
            var bx = sin(animsiner / 6) * 5;
            var by = -abs(cos(animsiner / 4)) * 5;
            var armx = sin(animsiner / 6) * 9;
            var army = cos(animsiner / 6) * 6;
            var headx = sin(animsiner / 6) * 8;
            var heady = (sin(animsiner / 6) * 6) + 4;
            var legx = sin((animsiner + 4) / 6) * 5;
            var legy = cos(animsiner / 6) * 2;
            animsinerb++;
            var image = animsiner / 6;
            var loopimage = 1.5 + (sin(image) * 1.5);
            var loopimage1 = 1 + (sin(image) * 1);
            var tailimage = image;
            armshake *= -1;
            armshakesiner++;
            var chargingup = 1;
            var armshakevalue = clamp((sin((armshakesiner / 18) - 1) * 1.5) - 1, 0, 4);
            var armshakey = armshakevalue * armshake;
            var headimage = 2;
            if (chargingup == 0)
            {
                armshakey = 0;
                armshakevalue = 0;
            }
            draw_monster_body_part_ext(spr_tenna_battle_leg_l, image, x - legx, y + legy, image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_leg_r, image, x + legx, y - (legy / 4), image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_tails, tailimage, (x + (bx / 2)) - 4, y + by, image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_arm_back, 3 - loopimage, ((x + bx) - (armx * 1.5)) + 12, (y + by) - army, image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_torso, 0, x + bx, y + by, image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_tie, 0, x + bx, y + by, image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_face, headimage - (armshakevalue * 5), ((x + bx) - headx) + 2 + (armshakey / 2), (y + by + heady) - 2 - (armshakey / 2), image_xscale, image_yscale, image_angle, _color, image_alpha);
            draw_monster_body_part_ext(spr_tenna_battle_arm_front, loopimage, ((x + bx) - armx) + armshakey, y + by + army + armshakey, image_xscale, image_yscale, image_angle, _color, image_alpha);
            if (i_ex(obj_shadowman_sharpshoot_target))
            {
                obj_shadowman_sharpshoot_target.x = ((x + bx) - headx) + 2 + (armshakey / 2);
                obj_shadowman_sharpshoot_target.y = y + by + army + armshakey;
            }
            if (hitflash > 0)
            {
                d3d_set_fog(true, c_white, 0, 0);
                draw_monster_body_part_ext(spr_tenna_battle_face, headimage - (armshakevalue * 5), ((x + bx) - headx) + 2 + (armshakey / 2), (y + by + heady) - 2 - (armshakey / 2), image_xscale, image_yscale, 0 + (nose_rotation * -0.2), image_blend, image_alpha);
                d3d_set_fog(false, c_white, 0, 0);
                hitflash--;
            }
            if (pinkflash > 0)
            {
                d3d_set_fog(true, make_color_rgb(248, 173, 227), 0, 0);
                draw_monster_body_part_ext(spr_tenna_battle_leg_l, image, x - legx, y + legy, image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_leg_r, image, x + legx, y - (legy / 4), image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_tails, tailimage, (x + (bx / 2)) - 4, y + by, image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_arm_back, 3 - loopimage, ((x + bx) - (armx * 1.5)) + 12, (y + by) - army, image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_torso, 0, x + bx, y + by, image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_tie, 0, x + bx, y + by, image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_face, headimage - (armshakevalue * 5), ((x + bx) - headx) + 2 + (armshakey / 2), (y + by + heady) - 2 - (armshakey / 2), image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                draw_monster_body_part_ext(spr_tenna_battle_arm_front, loopimage, ((x + bx) - armx) + armshakey, y + by + army + armshakey, image_xscale, image_yscale, image_angle, _color, pinkflash / 30);
                d3d_set_fog(false, make_color_rgb(248, 173, 227), 0, 0);
                pinkflash -= 2;
            }
        }
        if (i_ex(obj_lightemup_controller) && obj_shadowman_sharpshoot_target.type == 4)
        {
            bullet_timer++;
            var pattern = 5;
            var bulletnum = 3;
            var bulletthick = 0;
            var _geteasierifhaventhadchannelchange = 0;
            create_defeat_tenna_text_timer++;
            if (create_defeat_tenna_text_timer == 1)
            {
                with (obj_tenna_enemy)
                    stopshoot = 1;
            }
            if (create_defeat_tenna_text_timer == 43)
            {
                minigametext = instance_create_depth(x, y - 150, depth - 9999999, obj_tenna_enemy_minigametext);
                minigametext.mystring = stringsetloc("DEFEAT TENNA!", "obj_screen_channel_change_slash_Other_12_gml_122_0");
                minigametext.lightemup = 1;
            }
            pacetimer++;
            geteasiertimer++;
            if (geteasiertimer > 300)
                geteasiertimer = 300;
            var progress = obj_shadowman_sharpshoot_target.tennahp / obj_shadowman_sharpshoot_target.tennahpmax;
            if (lightemupcon == 0)
            {
                if (geteasiertimer > 30)
                    _geteasierifhaventhadchannelchange = round(lerp(0, 70, (geteasiertimer - 30) / 300));
                if (_geteasierifhaventhadchannelchange > 100)
                    _geteasierifhaventhadchannelchange = 100;
                _rate = round(lerp(40 + _geteasierifhaventhadchannelchange, 82 + _geteasierifhaventhadchannelchange, progress));
                lightemuptargetx = xstart + choose(-50 + random(30), 50 + random(30));
                lightemuptargety = (ystart - 40) + random(70);
                lightemuptimer++;
                if (lightemuptimer == 60)
                    lightemupcon = 1;
            }
            if (progress < 1.01)
            {
                pattern = 5;
                bulletnum = 3;
                bulletthick = 0;
            }
            if (progress <= 0.92)
            {
                pattern = 5;
                bulletnum = 4;
                bulletthick = 0;
            }
            if (progress <= 0.83)
            {
                pattern = 5;
                bulletnum = 3;
                bulletthick = 1;
            }
            if (progress <= 0.74)
            {
                pattern = 5;
                bulletnum = 3;
                bulletthick = 1;
                if (bullet_count > 1)
                    pattern = 4;
            }
            if (progress <= 0.65)
            {
                pattern = 5;
                bulletnum = 5;
                bulletthick = 0;
            }
            if (progress <= 0.56)
            {
                pattern = 5;
                bulletnum = 5;
                bulletthick = 0;
            }
            if (progress <= 0.49)
            {
                pattern = 6;
                bulletnum = 3;
                bulletthick = 0;
            }
            if (progress <= 0.41)
            {
                pattern = 6;
                bulletnum = 3;
                bulletthick = 0;
            }
            if (progress <= 0.33)
            {
                pattern = choose(4, 5, 6);
                if (pattern == 4)
                    bulletnum = 1;
                if (pattern == 5)
                    bulletnum = 5;
                if (pattern == 6)
                    bulletnum = 4;
                bulletthick = 0;
            }
            if (progress <= 0.2)
            {
                pattern = 7;
                bulletnum = 6;
                bulletthick = 0;
            }
            if (progress <= 0.1)
            {
                pattern = 8;
                bulletnum = 8;
                bulletthick = 0;
            }
            progress = obj_shadowman_sharpshoot_target.tennahp / obj_shadowman_sharpshoot_target.tennahpmax;
            var _jumpspeed = round(_rate / 5);
            var _movespeed = round(_rate / 10);
            var _waitspeed = round(_rate / 10);
            var _graspspeed = 2 + round(_rate / 4);
            if (lightemupcon == 3 && lightemuptimer < _jumpspeed)
            {
                draw_sprite_ext(spr_tenna_attack, 0, x - 4, y + 30, 2, 2, 0, _color, 1);
                if (hitflash > 0)
                {
                    d3d_set_fog(true, c_white, 0, 0);
                    draw_sprite_ext(spr_tenna_attack_justhead, 0, x - 4, y + 30, 2, 2, 0, _color, 1);
                    d3d_set_fog(false, c_white, 0, 0);
                    hitflash--;
                }
            }
            if (lightemupcon == 3 && lightemuptimer >= _jumpspeed)
            {
                var _index = lightemuptimer - _jumpspeed;
                if (_index >= 3)
                    _index = 3;
                draw_sprite_ext(spr_tenna_attack_clapvfx, _index, x - 4, y + 30, 2, 2, 0, _color, 1);
                if (hitflash > 0)
                {
                    d3d_set_fog(true, c_white, 0, 0);
                    draw_sprite_ext(spr_tenna_attack_justhead, 1, x - 4, y + 30, 2, 2, 0, _color, 1);
                    d3d_set_fog(false, c_white, 0, 0);
                    hitflash--;
                }
            }
            if (lightemupcon == 4 || lightemupcon == 5)
            {
                var _yy = y - 130;
                var _xshake = 0;
                shaketimer++;
                if (shaketimer == 2)
                    _xshake = 6;
                if (shaketimer == 3)
                    _xshake = -5;
                if (shaketimer == 4)
                    _xshake = 4;
                if (shaketimer == 5)
                    _xshake = -3;
                if (shaketimer == 6)
                    _xshake = 2;
                if (shaketimer == 7)
                    _xshake = -1;
                if (lightemuptimer < 51)
                {
                    draw_sprite_ext(spr_tenna_hurt, 0, (x - 4) + _xshake, _yy + 124, 2, 2, 0, _color, 1);
                }
                else
                {
                    if (shaketimer < 14)
                        draw_sprite_ext(spr_tenna_grasp_zoom_static, lightemuptimer / 2, (x - 4) + _xshake, _yy - 24, 2, 2, 0, c_white, 1);
                    else
                        draw_sprite_ext(spr_tenna_grasp_zoom, lightemuptimer / 2, (x - 4) + _xshake, _yy - 24, 2, 2, 0, c_white, 1);
                    if (hitflash > 0)
                    {
                        d3d_set_fog(true, c_white, 0, 0);
                        draw_sprite_ext(spr_tenna_grasp_headonly, 1, x + _xshake, (_yy + 154) - 24, 2, 2, 0, c_white, 1);
                        d3d_set_fog(false, c_white, 0, 0);
                        hitflash--;
                    }
                }
            }
            if (lightemupcon == 1)
            {
                lightemuptimer++;
                if (obj_shadowman_sharpshoot_target.tennahp < 1)
                {
                    lightemup_endingcon = 1;
                    x = lerp(x, xstart - 90, lightemuptimer / _movespeed);
                    y = lerp(y, ystart + 0, lightemuptimer / _movespeed);
                }
                else if (_waitspeed <= 4)
                {
                    x = lerp(x, lightemuptargetx, lightemuptimer / _movespeed);
                    y = lerp(y, lightemuptargety, lightemuptimer / _movespeed);
                }
                else
                {
                    x = lerp(x, lightemuptargetx, 0.2);
                    y = lerp(y, lightemuptargety, 0.2);
                }
                if (lightemuptimer >= _movespeed)
                {
                    lightemuptimer = 0;
                    lightemupcon = 2;
                }
            }
            if (lightemupcon == 2)
            {
                lightemuptimer++;
                if (obj_lightemup_controller.transitioninit == 1)
                {
                    lightemuptimer = 0;
                    if (lightemup_endingcon == 1)
                    {
                        with (obj_tenna_lightemup_bullet)
                            vanish = 1;
                        with (obj_afterimage)
                            instance_destroy();
                        with (obj_afterimage_grow)
                            instance_destroy();
                        with (obj_shadowman_sharpshoot_heart)
                            instance_destroy();
                        lightemupcon = 5;
                        snd_stop(snd_tv_static);
                        with (obj_lightemup_controller)
                            shooting_enabled = false;
                        shaketimer = 1;
                    }
                }
                if (bullet_timer > (_rate - _jumpspeed))
                {
                    if (ligthemupmovefullcount < 3)
                        ligthemupmovefullcount++;
                    else
                        ligthemupmovefullcount = 0;
                    lightemupmovecount = 0;
                    lightemupcon = 3;
                    lightemuptimer = 0;
                    startjump = false;
                    snd_play(snd_jump);
                }
                else if (lightemuptimer == _waitspeed)
                {
                    lightemuptargetx = xstart + choose(-70 + random(70), 50 + random(30));
                    lightemuptargety = (ystart - 45) + random(55);
                    if ((bullet_timer + _movespeed + _waitspeed) > (_rate - _jumpspeed) || _waitspeed <= 4)
                    {
                        lightemuptargetx = xstart + 80;
                        lightemuptargety = ystart;
                    }
                    lightemuptimer = 0;
                    lightemupcon = 1;
                    lightemupmovecount++;
                }
            }
            if (lightemupcon == 3)
            {
                lightemuptimer++;
                if (lightemuptimer <= _jumpspeed)
                {
                    var ydestination = lerp(-200, 180, lightemuptimer / _jumpspeed);
                    x = lerp(lightemuptargetx, 436, lightemuptimer / _jumpspeed);
                    y = lerp(ystart, ydestination, lightemuptimer / _jumpspeed);
                }
                if (lightemuptimer == (_jumpspeed - 4))
                    snd_play(snd_whip_hard);
                if (lightemuptimer == _jumpspeed)
                {
                    y = 127;
                    scr_shakeobj();
                    repeat (10)
                    {
                        var afterimage = scr_afterimage();
                        afterimage.x = x - 24;
                        afterimage.y = y + 30;
                        afterimage.sprite_index = spr_rabbick_dustorb;
                        afterimage.direction = random(360);
                        afterimage.image_alpha = 0.8;
                        afterimage.speed = 3 + random(5);
                        afterimage.image_xscale = 1.5;
                        afterimage.image_yscale = 1.5;
                        afterimage.friction = 0.334;
                        afterimage.depth = depth - 1000;
                    }
                    if (pattern == 4)
                    {
                        var i = 0;
                        scr_shakescreen();
                        var timevalue = 140 + floor(random(20)) + (i * 15);
                        bul = instance_create_depth(x - 24, y + 30, depth + 1, obj_tenna_lightemup_bullet);
                        scr_lerpvar_instance(bul, "x", bul.x, camerax() + 140, timevalue, 0, "out");
                        bul.damagetimer = timevalue;
                        bul.vspeed = (1 + random(3)) * choose(-1, 1);
                        bul.gravity = -bul.vspeed / (timevalue / 2);
                        bul.sprite_index = spr_ball_collision_full_3xscale;
                        bul.hp = 13;
                        with (bul)
                            event_user(1);
                        i++;
                        bullet_count = 0;
                    }
                    if (pattern == 5)
                    {
                        var i = 0;
                        scr_shakescreen();
                        repeat (bulletnum)
                        {
                            bul = instance_create_depth(x - 24, y + 30, depth + 1, obj_tenna_lightemup_bullet);
                            bul.specialmovement = 1;
                            bul.specialmovementwaittime = 6 + (i * 2) + random(6);
                            bul.specialmovementattacktime = 40 + (i * 4) + random(15);
                            bul.image_xscale = 1;
                            bul.image_yscale = 1;
                            bul.hp = 3;
                            i++;
                        }
                        if (bulletthick == 1)
                        {
                            bul = instance_create_depth(x - 24, y + 30, depth + 1, obj_tenna_lightemup_bullet);
                            bul.specialmovement = 1;
                            bul.specialmovementexpansiontime = 10 + random(4);
                            bul.specialmovementwaittime = 2 + (i * 2) + random(6);
                            bul.specialmovementattacktime = 40 + (i * 4) + random(15);
                            bul.sprite_index = spr_ball_collision_full2;
                            bul.hp = 6;
                            i++;
                        }
                        bullet_count++;
                    }
                    if (pattern == 6)
                    {
                        var i = 0;
                        scr_shakescreen();
                        repeat (bulletnum)
                        {
                            bul = instance_create_depth(x - 24, y + 30, depth + 1, obj_tenna_lightemup_bullet);
                            bul.specialmovement = 1;
                            bul.specialmovementexpansiontime = 10 + random(4);
                            bul.specialmovementwaittime = 2 + (i * 2) + random(6);
                            bul.specialmovementattacktime = 40 + (i * 4) + random(15);
                            bul.sprite_index = spr_ball_collision_full2;
                            bul.hp = 6;
                            i++;
                        }
                    }
                    if (pattern == 7)
                    {
                        var i = 0;
                        scr_shakescreen();
                        repeat (bulletnum)
                        {
                            if (instance_number(obj_tenna_lightemup_bullet) < 10)
                            {
                                bul = instance_create_depth(x - 24, y + 30, depth + 1, obj_tenna_lightemup_bullet);
                                bul.specialmovement = 1;
                                bul.specialmovementwaittime = 0 + (i * 1) + random(1);
                                bul.specialmovementattacktime = 20 + (i * 4) + random(4);
                                bul.hp = 1;
                                bul.spreadtype = 1;
                                i++;
                            }
                        }
                        bullet_count++;
                    }
                    if (pattern == 8)
                    {
                        var i = 0;
                        scr_shakescreen();
                        repeat (bulletnum)
                        {
                            if (instance_number(obj_tenna_lightemup_bullet) < 14)
                            {
                                bul = instance_create_depth(x - 24, y + 30, depth + 1, obj_tenna_lightemup_bullet);
                                bul.specialmovement = 1;
                                bul.specialmovementwaittime = 0 + (i * 1) + random(1);
                                bul.specialmovementattacktime = 20 + (i * 4) + random(4);
                                bul.hp = 1;
                                bul.spreadtype = 1;
                                i++;
                            }
                        }
                        bullet_count++;
                    }
                    bullet_timer = 0;
                }
                if (lightemuptimer >= (_jumpspeed + 10))
                    gravity = lerp(10, 1, _jumpspeed / 21);
                if (lightemuptimer >= (_jumpspeed + 14) && y >= (ystart - 40))
                {
                    if (geteasiertimer > 60)
                        _geteasierifhaventhadchannelchange = round(lerp(0, 70, (geteasiertimer - 60) / 600));
                    if (_geteasierifhaventhadchannelchange > 100)
                        _geteasierifhaventhadchannelchange = 100;
                    _rate = round(lerp(35 + _geteasierifhaventhadchannelchange, 82 + _geteasierifhaventhadchannelchange, progress));
                    scr_shakeobj();
                    snd_play(snd_impact);
                    y = ystart;
                    gravity = 0;
                    vspeed = 0;
                    lightemuptimer = 0;
                    lightemupcon = 2;
                    if (obj_shadowman_sharpshoot_target.tennahp < 1)
                        lightemupcon = 1;
                }
            }
            if (lightemupcon == 4)
            {
                lightemuptimer++;
                if (lightemuptimer == 1)
                    scr_shakeobj();
                if (lightemuptimer == 2 && !audio_is_playing(snd_tv_static))
                    snd_play(snd_tv_static);
                if (lightemuptimer == round(_graspspeed / 2))
                {
                    obj_lightemup_controller.transitioninit = 2;
                    obj_lightemup_controller.extra_timer = 0;
                }
                if (lightemuptimer >= _graspspeed)
                {
                    snd_stop(snd_tv_static);
                    bullet_timer = 0;
                    shaketimer = 0;
                    pacetimer = 0;
                    lightemuptimer = 0;
                    lightemupcon = 2;
                }
            }
            if (lightemupcon == 5)
            {
                lightemuptimer++;
                var ending_length = 300;
                with (obj_tenna_enemy)
                    staticfadetimermax = ending_length - 100;
                if (lightemuptimer == 1)
                {
                    snd_stop(snd_tv_static);
                    if (!audio_is_playing(snd_tv_static))
                        mus_volume(global.batmusic[1], 0, 0);
                    snd_play(snd_explosion);
                    scr_fadeout(20);
                    with (obj_fadeout)
                    {
                        image_blend = c_white;
                        depth = obj_tenna_minigame_ui.depth - 100;
                    }
                    with (obj_tenna_enemy_bg)
                    {
                        speedup = 0;
                        slowdown = 1;
                    }
                }
                if (lightemuptimer == 120)
                {
                    scr_fadein(60);
                    with (obj_fadein)
                    {
                        image_blend = c_white;
                        depth = obj_tenna_minigame_ui.depth - 100;
                    }
                }
                if (lightemuptimer == 121)
                {
                    with (obj_fadeout)
                        instance_destroy();
                }
                if (lightemuptimer == 240)
                {
                    snd_play_x(snd_noise, 1.8, 1);
                    obj_lightemup_controller.transitioninit = 2;
                    obj_lightemup_controller.extra_timer = 9;
                    shaketimer = 1;
                }
                changechanneltimermax = lerp(65, 3, (lightemuptimer - 240) / 300);
                if (changechanneltimermax < 3)
                    changechanneltimermax = 3;
                if (lightemuptimer >= 240 && !i_ex(obj_tvturnoff_manager))
                {
                    changechanneltimer++;
                    if (changechanneltimer >= changechanneltimermax)
                    {
                        snd_play_x(snd_noise, 1.8, 1 + pitchchange);
                        obj_lightemup_controller.transitioninit = 2;
                        obj_lightemup_controller.extra_timer = 9;
                        shaketimer = 1;
                        changechanneltimer = 0;
                        if (changechanneltimermax < 4)
                        {
                            if (lightemuptimer < 1000)
                                lightemuptimer = 1000;
                        }
                        pitchchange += 0.02;
                    }
                }
                if (lightemuptimer == 1090)
                {
                    snd_stop(snd_tv_static);
                    inst = instance_create(x, y, obj_tvturnoff_manager);
                    inst.depth = obj_battlecontroller.depth - 100;
                    inst.tennaending = true;
                    inst.kind = 1;
                }
            }
        }
    }
    else
    {
        draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
    }
    if (mad)
    {
        flash = true;
        image_blend = c_red;
    }
    if (flash)
    {
        flashsiner++;
        d3d_set_fog(true, image_blend, 0, 1);
        draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, (-cos(flashsiner / 5) * 0.4) + 0.6);
        d3d_set_fog(false, c_black, 0, 0);
    }
}
if (drawtype == 1)
{
    if (dropshadow)
        draw_sprite_ext(sprite_index, image_index, x + dropdist, y + dropdist, image_xscale, image_yscale, image_angle, c_black, image_alpha);
    draw_self();
    if (flash)
    {
        flashsiner++;
        d3d_set_fog(true, image_blend, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, (-cos(flashsiner / 5) * 0.4) + 0.6);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (darkenalpha > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_black, darkenalpha);
        d3d_set_fog(false, c_black, 0, 0);
        darkenalpha -= 0.01;
    }
}
if (drawtype == 2)
{
    shtimer++;
    draw_sprite_ext(spr_tenna_laugh_pose_segmented_leftarm, 0, x + ((sin(shtimer / rate) * 4) + 6), y + (cos(shtimer / rate) * 4), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_tenna_laugh_pose_segmented_body, 0, x, y, 2, 2 + (sin(shtimer / rate) * 0.1), 0, c_white, 1);
    draw_sprite_ext(spr_tenna_laugh_pose_segmented_rightarm, 0, x - (sin(shtimer / rate) * 4), y - (-cos(shtimer / rate) * 4), 2, 2, 0, c_white, 1);
}
if (drawtype == 3)
{
    if (rosecon == 1)
    {
        rosetimer++;
        if (rosetimer == 1)
        {
            image_speed = 0;
            image_index = 0;
            rosetennasprite = 3002;
            scr_lerpvar("image_xscale", image_xscale, sign(image_xscale) * 2, 30, -1, "out");
            scr_lerpvar("image_yscale", image_yscale, 2, 30, -1, "out");
        }
        if (rosetimer == 12)
        {
            rosetennasprite = 1571;
            image_index = 0;
        }
        if (rosetimer >= 16)
            image_index = 1;
        if (rosetimer >= 19)
            image_index = 2;
        if (rosetimer >= 22)
            image_index = 3;
        if (rosetimer == 29)
        {
            image_index = 3;
            image_speed = 0;
            sprite_index = rosetennasprite;
            drawtype = 0;
            wobblestate = 7;
            wobbletime = 2;
            wobbleamt = 6;
            siner = 0;
            timer = 0;
            rosecon = 2;
        }
    }
    draw_sprite_ext(rosetennasprite, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);
}
if (nose_bloom)
{
    var blossom_x_offset = (image_xscale < 0) ? -36 : 36;
    draw_sprite_ext(spr_tenna_blossom, nose_bloom_index, x1 + blossom_x_offset, y1 + 36, nose_bloom_scale_x, nose_bloom_scale_y, image_angle, c_white, image_alpha);
}
if (communication > 0)
{
    if (communication == 1)
    {
        communicationtimer = 0;
        communication = 2;
    }
    if (communication == 2)
    {
        var antennax1 = x + (6 * xscale);
        var antennay1 = y - (120 * yscale);
        var antennax2 = x + (24 * xscale);
        var antennay2 = y - (116 * yscale);
        if (sprite_index == spr_tenna_communication)
        {
            if (image_index >= 1)
            {
                antennax1 = x + (30 * xscale);
                antennay1 = y - (95 * yscale);
                antennax2 = x + (48 * xscale);
                antennay2 = y - (90 * yscale);
            }
        }
        if (sprite_index == spr_tenna_hurt)
        {
            antennax1 = x + (20 * xscale);
            antennay1 = y - (105 * yscale);
            antennax2 = x + (42 * xscale);
            antennay2 = y - (108 * yscale);
        }
        if (sprite_index == spr_tenna_sad_turned_b)
        {
            antennax1 = x + (1 * xscale);
            antennay1 = y - (100 * yscale);
            antennax2 = x - (20 * xscale);
            antennay2 = y - (102 * yscale);
        }
        if (sprite_index == spr_tenna_faceaway)
        {
            antennax1 = x - 22;
            antennay1 = y - 242;
            antennax2 = x + 20;
            antennay2 = y - 242;
        }
        if ((communicationtimer % 90) == 0)
        {
            snd_play_x(snd_sonar, 0.8, 0.8);
            snd_play_x(snd_sonar, 0.8, 0.8 + random(0.05));
            for (var i = 0; i < 3; i++)
            {
                var _x = antennax1;
                var _y = antennay1;
                repeat (2)
                {
                    var lightningmarker = scr_marker(_x, _y, spr_shutta_lightning);
                    lightningmarker.image_speed = 0.5;
                    lightningmarker.image_alpha = 0;
                    lightningmarker.depth = depth - 1;
                    scr_lerp_var_instance(lightningmarker, "image_alpha", 2, 0, 18 + random(6));
                    with (lightningmarker)
                    {
                        image_xscale = 0.5;
                        image_yscale = 0.5;
                        direction = 60 + (i * 30) + random_range(-10, 10);
                        image_angle = direction;
                        speed = 3 + random(1);
                        friction = 0.2;
                        scr_doom(id, 20);
                        image_blend = c_yellow;
                    }
                    _x = antennax2;
                    _y = antennay2;
                }
            }
        }
        communicationtimer++;
    }
}
var lineshow = 0;
if (lineshow)
{
    draw_line(x1, y1, x2, y2);
    draw_line(x2, y2, x3, y3);
    draw_line(x1, y1, x4, y4);
    draw_line(x4, y4, x3, y3);
    draw_circle(x, y, 0.5, 1);
    draw_text(camerax(), (cameray() + 480) - 15, "wobblestate=" + string(wobblestate));
}
if (golden_mode)
    pal_swap_reset();
