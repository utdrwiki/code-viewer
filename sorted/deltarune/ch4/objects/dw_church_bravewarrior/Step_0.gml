var checktouch = true;
var emergstop = false;
with (obj_dw_church_sideclimb)
{
    if (defendercon >= 7 && defendercon < 10)
    {
        emergstop = true;
        hspeed = 0;
    }
}
if (con == 99 || emergstop)
    checktouch = false;
if (con == 0)
{
    timer++;
    if (timer == 1)
    {
        y = 336 + irandom(12);
        ystart = y;
        climbtime = 14;
        sprite_index = spr_npc_cup_climb;
        image_speed = 0.125;
        image_blend = c_black;
        image_alpha = 0;
        scr_lerpvar("y", ystart, ystart - 56, climbtime, 2, "out");
        scr_lerpvar("image_alpha", 0, 1, 7);
        scr_lerp_imageblend(id, c_black, c_white, 7, 2, "in");
    }
    if (timer == (1 + climbtime))
    {
        jumptime = 12;
        var topy = 230;
        var boty = 250;
        var targy = boty;
        scr_jump_to_point(x + scr_even(random(20)), targy, 24, jumptime, true);
    }
    if (timer == (1 + climbtime + jumptime))
    {
        scr_depth();
        waittime = 3;
        sprite_index = spr_npc_cup_walk;
        image_speed = 0;
    }
    if (timer < (climbtime + jumptime))
        checktouch = false;
    if (timer == (1 + climbtime + jumptime + waittime + 1))
    {
        image_speed = 0.25;
        hspeed = 4;
        con = 1;
        if (emergstop)
        {
            con = 99;
            hspeed = 0;
            image_speed = 0;
            image_index = 0;
        }
    }
}
if (con == 1)
{
    var trig = 0;
    var endtrig = instance_place(x, y, obj_trigger);
    if (i_ex(endtrig))
    {
        if (endtrig.extflag == "defenderdescend")
            trig = 1;
    }
    if (emergstop)
    {
        trig = 0;
        con = 99;
        hspeed = 0;
        image_speed = 0;
        image_index = 0;
    }
    if (trig == 1)
    {
        con = 3;
        scr_delay_var("con", 2, 1 + irandom(4));
        timer = 0;
    }
}
if (con == 2)
{
    timer++;
    if (timer == 1)
    {
        hspeed = 0;
        jumptime = irandom_range(4, 8);
        sprite_index = spr_npc_cup_climb;
        image_speed = 0;
        scr_jump_to_point(x + 12 + scr_even(random(20)), 266 + scr_even(random(32)), 12, jumptime, 1);
        scr_doom(id, 90);
    }
    if (timer >= (1 + jumptime))
    {
        checktouch = false;
        image_index += 0.16666666666666666;
        y += 2;
        image_blend = merge_color(image_blend, c_black, 0.125);
        image_alpha -= (1/30);
    }
    if (image_alpha <= 0)
        instance_destroy();
}
if (checktouch)
{
    scr_depth();
    if (place_meeting(x - 14, y, obj_mainchara))
    {
        if (global.interact == 0)
        {
            obj_mainchara.x = clamp(obj_mainchara.x + 8, 0, 2842);
            with (obj_caterpillarchara)
            {
                if (x < obj_mainchara.x)
                    x = obj_mainchara.x;
                var yoff = -16;
                if (name == "ralsei")
                    yoff = -12;
                y = scr_even(lerp(y, obj_mainchara.y + yoff, 0.5));
            }
            scr_caterpillar_interpolate("all");
        }
        with (scr_marker_ext(x, y, sprite_index, 2, 2, 0, undefined, undefined, undefined, 1))
        {
            hspeed = -8 - random(4);
            gravity = 1;
            vspeed = -8 - random(8);
            scr_lerpvar("image_alpha", image_alpha, 0, 30, 2, "in");
            scr_doom(id, 30);
            snd_play(snd_smallcar_yelp, 0.75, 0.6);
        }
        instance_destroy();
    }
}
