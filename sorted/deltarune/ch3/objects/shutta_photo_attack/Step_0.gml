if (!init)
{
    startdepth = depth;
    init = true;
}
if (siner < 0)
{
    siner++;
    var _fliptimer = fliptime / 2;
    flip = cos((siner / _fliptimer) * pi);
    if (flip_image >= 0 && flip <= 0)
    {
        image_index = flip_image;
        flip_image = -1;
    }
    var _easer = scr_ease_in((siner + fliptime) / fliptime, 2);
    image_angle = lerp(rspawn, rotater, _easer);
}
if (flip < 0)
    depth = startdepth - 40;
else
    depth = startdepth + 30;
image_xscale = flip * scale;
if (visible == false)
    visible = true;
if (slider < slidetime)
{
    if (slider == 0)
    {
        xspawn = screenx() + 720;
        yspawn = screeny() + 240 + random_range(-200, 100);
        rotater = random_range(-5, 5);
        rspawn = rotater - random_range(10, 100);
    }
    slider++;
    var _easer = scr_ease_out(slider / slidetime, 2);
    x = lerp(xspawn, xstart, _easer);
    y = lerp(yspawn, ystart, _easer);
    image_angle = lerp(rspawn, rotater, _easer);
    if (slider == 1)
        con = 1;
}
if (con == 2)
{
    gravity = 1;
    gravity_direction = 270;
    vspeed = -(random(5) + 5);
    hspeed = random(4) + 5;
    if (flip_image >= 0)
        flip_image = 2;
    else
        DoFlip(2);
    con = 3;
    rotater = -random_range(2, 3);
}
if (con == 3)
    image_angle += rotater;
