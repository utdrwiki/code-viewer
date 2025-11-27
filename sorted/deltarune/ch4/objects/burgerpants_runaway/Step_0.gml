if (init == 0)
{
    init = 1;
    standmarker = scr_marker(x, y, spr_npc_burgerpants_stand_rain_empty);
    with (standmarker)
        scr_depth();
    xstart = x;
}
if (con == 0)
{
    timer++;
    if (timer == 14)
        depth = standmarker.depth + 1;
    if (timer == 16)
        x += 320;
    if (timer == 128)
    {
        x = xstart;
        sprite_index = spr_npc_burgerpants_stand_rain_cookie;
        con = 1;
    }
}
if (scr_debug())
{
    if (keyboard_check_pressed(ord("2")))
        con = 2;
}
if (con == 1)
{
    if (image_speed > 0)
    {
        cookie_timer++;
        if ((cookie_timer % 15) == 1)
            snd_play_x(snd_splat, 0.3, 2);
    }
}
if (con == 2)
{
    x += 320;
    image_alpha = 0;
}
var make = false;
if (x != xprevious || y != yprevious)
    make = true;
var count = 120;
if (make)
{
    for (var i = 0; i < count; i++)
    {
        var xval = lerp(xprevious, x, i / count);
        var yval = lerp(yprevious, y, i / count);
        var afterimage = scr_afterimage();
        afterimage.sprite_index = blursprite;
        afterimage.x = xval;
        afterimage.y = yval;
        afterimage.fadeSpeed = 0.12;
        afterimage.image_alpha = (i / 5 / count) + afterimage.fadeSpeed;
        afterimage.depth = depth + 1;
    }
}
