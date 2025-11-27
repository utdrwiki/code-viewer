timer++;
if (done == 0)
{
    if (con == 0)
    {
        con = -1;
        scr_var_delay("spear_dodge", 1, 10);
        scr_var_delay("con", 3, 12);
        makespear = 1;
        image_index = 12;
        scr_lerpvar("image_index", 12, 3, 18, 2, "out");
        sprite_index = spr_roaringknight_ball_transition;
        directshot = 1;
        image_speed = 0;
    }
    if (con == 3)
    {
        makespear = 0;
        rotate = 1;
        con = 4;
        if (done == 0)
            scr_var_delay("con", 0, 6);
    }
}
if (done == 1)
    makespear = 0;
if (spear_dodge == 1)
{
    var gox = xstart + (choose(40, 50, 60, 70) * choose(rem1));
    var goy = ystart + (choose(20, 30, 40) * choose(-1, 1));
    if (done)
        gox = xstart;
    if (done)
        goy = ystart;
    con = 2;
    scr_lerpvar("x", x, gox, 12, 2, "out");
    scr_lerpvar("y", y, goy, 12, 2, "out");
    rem1 *= -1;
    spear_dodge = 0;
}
if (rotate)
    image_index = 3 + (sin(timer / 2) * 1.6);
var speargfx = 4401;
var directshot = 1;
if (makespear == 1 && (timer % 4) == 0)
{
    snd_play_x(snd_swing, 0.4 + random(0.3), 1.1 + random(0.4));
    var spear = scr_dark_marker(camerax() + 480 + random(200), cameray() - 80, speargfx);
    with (spear)
    {
        depth = other.depth - 100;
        scr_doom(id, 40);
        friction = -1;
        direction = point_direction(x, y, other.x + 110, other.y + 80) + random_range(-1, 1);
        if (directshot == 0)
            direction += random_range(-20, 20);
        image_angle = direction + 90;
        speed = 7;
    }
}
if ((timer % 2) == 0)
{
    var afterimage = scr_afterimage();
    afterimage.image_alpha = 0.8;
    afterimage.direction = random(360);
    afterimage.speed = 2;
    with (obj_marker)
    {
        if (sprite_index == speargfx)
        {
            afterimage = scr_afterimage();
            afterimage.image_alpha = 0.5;
        }
    }
}
draw_self();
