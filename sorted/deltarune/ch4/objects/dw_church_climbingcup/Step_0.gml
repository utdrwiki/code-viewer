var watchboy = 1049;
with (obj_climb_kris)
    watchboy = id;
var heardist = 400;
var climbvol = 0;
if (i_ex(watchboy))
    climbvol = clamp((heardist - point_distance(x, y, watchboy.x, watchboy.y)) / heardist, 0, 1);
if (!scr_onscreen(id))
    climbvol = 0;
var climbvolthresh = 0.1;
if (!init)
{
    init = 1;
    mymaxheight = ystart - maxheight;
    targtime = irandom(mymaxheight);
    timer = 0;
}
if (con == 0 && global.interact != 2)
{
    timer++;
    y--;
    image_index += 0.25;
    if ((image_index % 1) == 0)
    {
        if (climbvol > climbvolthresh)
            snd_play(snd_menumove, 0.25 * climbvol, 0.4 + (image_index / 10));
    }
    if (timer >= (targtime - 40) && (timer % 2) == 0)
    {
        if (climbvol > climbvolthresh)
        {
            with (scr_marker_ext(x + 20, y + 34, spr_pxwhite, 2, 2, undefined, undefined, undefined, undefined, undefined, 8))
            {
                depth = other.depth + 1;
                hspeed = choose(-4, 3, -3, 4);
                vspeed = -4;
                gravity = random_range(0.3, 0.6);
                scr_lerpvar("image_alpha", 1, 0, 8);
            }
        }
    }
    if (timer >= (targtime - 20))
    {
        if ((timer % 2) == 0)
            y++;
    }
    if (timer >= targtime)
    {
        con = 1;
        targtime = irandom(abs(ystart - y));
    }
}
if (con == 1)
{
    gravity = 1;
    timer++;
    if (timer >= targtime || y >= (ystart - 30))
    {
        if (climbvol > climbvolthresh)
            snd_play(snd_menumove, 0.25 * climbvol, 0.2);
        gravity = 0;
        vspeed = 0;
        timer = 0;
        var targy = clamp(y + 20, y, ystart);
        targtime = irandom(10) + 20;
        scr_lerpvar("y", y, targy, 20, -1, "out");
        if (climbvol > climbvolthresh)
        {
            snd_play_delay(snd_menumove, 1, 0.25 * climbvol, 0.25);
            snd_play_delay(snd_menumove, 3, 0.25 * climbvol, 0.23);
            snd_play_delay(snd_menumove, 5, 0.25 * climbvol, 0.21);
        }
        con = 2;
    }
}
if (con == 2)
{
    y = round(y);
    timer++;
    if (timer == targtime)
    {
        timer = 0;
        targtime = irandom(y - maxheight);
        con = 0;
    }
}
if (con < 99)
{
    if (place_meeting(x, y, obj_climb_kris))
    {
        con = 100;
        gravity = 1;
        snd_play(snd_smallcar_yelp, 0.75, 0.6);
    }
}
if (con == 100)
{
    if (y > (cameray() + 480 + 80))
        instance_destroy();
}
