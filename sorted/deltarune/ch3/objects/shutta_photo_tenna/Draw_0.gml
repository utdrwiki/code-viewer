if (facing == "r")
    reversal = 1;
if (facing == "l")
    reversal = 0;
facing = "d";
siner++;
siner2++;
if (bounce == 1)
{
    image_yscale = 2.5;
    image_xscale = 1.5;
    bounce = 2;
}
if (bounce == 2)
{
    scr_lerpvar("image_xscale", image_xscale, 2, 16, -2, "out");
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
        wobbleamt = 40;
    }
    if (preset == 2)
    {
        sprite_index = spr_tenna_point_up;
        wobblestate = 1;
        wobbletime = 4;
        wobbleamt = 15;
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
        wobbleamt = 30;
    }
    if (preset == 5)
    {
        reversal = 0;
        animchangetimer = 8;
        wobblestate = 4;
        wobbleamt = 40;
        wobbletime = 4;
    }
    if (preset == 6)
    {
        sprite_index = spr_tenna_bow;
        image_speed = 0.25;
        wobblestate = 5;
        wobbletime = 3;
        wobbleamt = 30;
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
if (wobblestate == 4)
{
    animchangetimer++;
    if (animchangetimer == changespeed)
    {
        reversal = 0;
        sprite_index = spr_tenna_point_left;
        bounce = 1;
    }
    if (animchangetimer == (changespeed * 2))
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
    }
    if (animchangetimer == (changespeed * 3))
    {
        sprite_index = spr_tenna_point_left;
        reversal = 1;
        bounce = 1;
    }
    if (animchangetimer == (changespeed * 4))
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
    }
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
    if (image_index == (sprite_get_number(sprite_index) - 1))
        reversal = 1 - reversal;
    var addamt = abs(sin(siner / wobbletime) * wobbleamt);
    var addamt2 = addamt;
    if (reversal == 1)
        addamt = -addamt;
    x1 += addamt;
    x2 += addamt;
    y1 -= addamt2;
    y2 += addamt2;
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
}
if (drawtype == 0)
    draw_sprite_pos(sprite_index, image_index, x1, y1, x2, y2, x3, y3, x4, y4, 1);
if (drawtype == 1)
    draw_self();
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
