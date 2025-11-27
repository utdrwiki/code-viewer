attackcount = 0;
attackcountmax = 0;
attacktimer = 0;
swingdown_ex = 0;
if (attackpattern == 1)
{
    var beat = 80;
    var spearspeed = 12;
    var heartframes = 40;
    scr_spearpattern(0, 0, 0, 1, 60);
    scr_spearpattern("l", spearspeed, 125, 0, 25, 1);
    scr_spearpattern("l", spearspeed, 125, 0, 25, 1);
    scr_spearpattern("l", spearspeed, 125, 0, 21, 1);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 97);
    scr_spearpattern(0, 8, 0, 43, 53);
    scr_spearpattern("r", spearspeed, 125, 0, 25, 1);
    scr_spearpattern("r", spearspeed, 125, 0, 25, 1);
    scr_spearpattern("r", spearspeed, 125, 0, 25, 1);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
}
if (attackpattern == 2)
{
    var spearspeed = 12;
    scr_spearpattern(0, 0, 0, 36, 15);
    if (failsafe == false)
    {
        scr_spearpattern("l", spearspeed, 125, 0, 25, 0.7);
        scr_spearpattern(1, 0, 0, 37, 1);
        scr_spearpattern("r", spearspeed, 125, 0, 25, 0.5);
        scr_spearpattern("l", spearspeed, 125, 0, 22, 0.3);
        scr_spearpattern(0.85, 50, 0, 43, 0);
        scr_spearpattern(1, 0, 0, 38, 97);
        scr_spearpattern(0, 5, 0, 43, 53);
        scr_spearpattern("r", spearspeed, 125, 0, 25, 0.1);
        scr_spearpattern("l", spearspeed, 125, 0, 25, 0.05);
        scr_spearpattern("r", spearspeed, 125, 0, 25, 0);
    }
    else
    {
        scr_spearpattern("l", spearspeed, 125, 0, 25, 1);
        scr_spearpattern(1, 0, 0, 37, 1);
        scr_spearpattern("r", spearspeed, 125, 0, 25, 1);
        scr_spearpattern("l", spearspeed, 125, 0, 22, 1);
        scr_spearpattern(0.85, 50, 0, 43, 0);
        scr_spearpattern(1, 0, 0, 38, 97);
        scr_spearpattern(0, 5, 0, 43, 53);
        scr_spearpattern("r", spearspeed, 125, 0, 25, 1);
        scr_spearpattern("l", spearspeed, 125, 0, 25, 1);
        scr_spearpattern("r", spearspeed, 125, 0, 25, 1);
    }
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
}
if (attackpattern == 3)
{
    var spearspeed = 12;
    scr_spearpattern(3, 0, 0, 37, 1);
    scr_spearpattern(0, 0, 0, 36, 15);
    scr_spearpattern("l", spearspeed, 100, 0, 25, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 0, failsafe);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 97);
    scr_spearpattern(0, 8, 0, 43, 53);
    scr_spearpattern("l", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 25, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 0, failsafe);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
}
if (attackpattern == 4)
{
    battleversion = 2;
    var spearspeed = 12;
    scr_spearpattern(3, 0, 0, 37, 1);
    scr_spearpattern(0, 0, 0, 36, 15);
    scr_spearpattern("l", spearspeed, 100, 0, 25, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 0, failsafe);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 97);
    scr_spearpattern(0, 8, 0, 43, 53);
    scr_spearpattern("r", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 25, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 0, failsafe);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 97);
    scr_spearpattern(0, 8, 0, 43, 53);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
    scr_spearpattern("u", spearspeed, 50, 0, 25, 1);
    scr_spearpattern("u", spearspeed, 50, 0, 60, 1);
}
if (attackpattern == 5)
{
    var spearspeed = 12;
    scr_spearpattern(3, 0, 0, 37, 1);
    scr_spearpattern(0, 0, 0, 36, 15);
    scr_spearpattern("l", spearspeed, 100, 0, 20, 1);
    scr_spearpattern("u", spearspeed, 100, 0, 20, 1);
    scr_spearpattern("r", spearspeed, 100, 0, 10, 1);
    scr_spearpattern(0.85, 49, 0, 43, 0);
    scr_spearpattern(0.95, 0, 0, 38, 0);
    scr_spearpattern(0, 0, 0, 36, 10);
    scr_spearpattern("u", spearspeed, 100, 0, 100, 1);
    scr_spearpattern(0, 8, 0, 43, 15);
    scr_spearpattern("l", spearspeed, 100, 0, 15, failsafe);
    scr_spearpattern("u", spearspeed, 100, 0, 15, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 15, failsafe);
    scr_spearpattern("u", spearspeed, 100, 0, 5, failsafe);
    scr_spearpattern(0.85, 49, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 95);
    scr_spearpattern(0, 8, 0, 43, 15);
    scr_spearpattern("r", spearspeed, 100, 0, 15, failsafe);
    scr_spearpattern("u", spearspeed, 100, 0, 15, failsafe);
    scr_spearpattern("r", spearspeed, 100, 0, 15, failsafe);
    scr_spearpattern("l", spearspeed, 100, 0, 5, failsafe);
    scr_spearpattern(0.85, 49, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 95);
    scr_spearpattern(0, 8, 0, 43, 5);
}
if (attackpattern == 8)
{
    var spearspeed = 12;
    scr_spearpattern(3, 0, 0, 37, 1);
    scr_spearpattern(0, 0, 0, 36, 15);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
    scr_spearpattern("r", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("u", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("u", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 50, 0, 50, failsafe);
    scr_spearpattern(0, 4, 0, 43, 4);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
    scr_spearpattern("l", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("l", spearspeed, 50, 0, 50, failsafe);
    scr_spearpattern(0, 4, 0, 43, 4);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
    scr_spearpattern("l", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("u", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("u", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("r", spearspeed, 50, 0, 61, failsafe);
}
if (attackpattern == 11)
{
    var spearspeed = 18;
    scr_spearpattern(0, 0, 0, 36, 1);
    scr_spearpattern(3, 0, 0, 37, 15);
    var a = 32;
    var b = 64;
    var c = 0.7;
    var d = 31;
    var e = -2;
    var repeatcount = 16;
    var counted = 0;
    var lerppower = 3;
    repeat (repeatcount)
    {
        a = lerp_ease_out(30, 18, counted / repeatcount, lerppower);
        b = lerp_ease_out(50, 32, counted / repeatcount, lerppower);
        c = lerp_ease_out(0.74, 1.3, counted / repeatcount, lerppower);
        d = lerp_ease_out(32, 18, counted / repeatcount, lerppower);
        e = 0;
        scr_spearpattern(0.85, round(d), 0, 43, 0);
        scr_spearpattern(c, 0, 0, 39, 1);
        scr_spearpattern(choose("r", "l", "u"), spearspeed, a, 0, round(b / 2), failsafe);
        scr_spearpattern(0, 8, 0, 43, round(b / 2) - e);
        counted++;
    }
    scr_spearpattern(3, 0, 0, 37, 30);
    scr_spearpattern(0.85, 50, 0, 43, 0);
    scr_spearpattern(1, 0, 0, 38, 1);
    scr_spearpattern("l", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern("l", spearspeed, 50, 0, 12, failsafe);
    scr_spearpattern(0, 0, 0, 55, 1);
    scr_spearpattern(0, 0, 0, 54, 80);
}
if (attackpattern == 12)
{
    var spearspeed = 18;
    scr_spearpattern(3, 0, 0, 37, 1);
    scr_spearpattern(0, 0, 0, 36, 15);
    var a = 23;
    var b = 46;
    var c = 1.05;
    var d = 22;
    var e = -5;
    var repeatcount = 16;
    var counted = 0;
    var lerppower = 3;
    repeat (repeatcount)
    {
        a = lerp_ease_out(26, 17, counted / repeatcount, lerppower);
        b = lerp_ease_out(38, 22, counted / repeatcount, lerppower);
        if (counted == (repeatcount - 1))
            b *= 1.2;
        c = lerp_ease_out(1.05, 1.65, counted / repeatcount, lerppower);
        d = lerp_ease_out(24, 14, counted / repeatcount, lerppower);
        e = lerp_ease_out(-5, 7, counted / repeatcount, lerppower);
        scr_spearpattern(0.85, round(d), 0, 43, 0);
        scr_spearpattern(c, 0, 0, 39, 1);
        scr_spearpattern(choose("r", "l", "u"), spearspeed, a, 0, round(b / 2), failsafe);
        scr_spearpattern(0, 8, 0, 43, round(b / 2) - e);
        counted++;
    }
    scr_spearpattern(0, 0, 0, 55, 1);
    scr_spearpattern(0, 0, 0, 54, 25);
    scr_spearpattern("up1", 0, 0, 32, 25);
    scr_spearpattern("up2", 0, 0, 32, 80);
}
if (attackpattern == 13)
{
    scr_spearpattern(0, 0, 0, 54, 25);
    var prev = 1;
    var beat = 25;
    repeat (8)
    {
        var a;
        if (prev == 0)
            a = choose(1, 2);
        if (prev == 1)
            a = choose(0, 2);
        if (prev == 2)
            a = choose(0, 1);
        prev = a;
        if (a == 0)
            scr_spearpattern("up1", 0, 0, 32, beat);
        if (a == 1)
            scr_spearpattern(0, -70, 0, 32, beat);
        if (a == 2)
            scr_spearpattern("up2", 0, -3, 32, beat);
    }
}
if (attackpattern == 14)
{
    scr_spearpattern(3, 0, 0, 37, 1);
    scr_spearpattern(0, 0, 0, 54, 80);
}
scr_debug_print("attackpattern=" + string(attackpattern));
if (attackpattern == 1)
    attackpattern = 2;
else if (attackpattern == 2)
    attackpattern = 3;
else if (attackpattern == 3)
    attackpattern = 4;
else if (attackpattern == 4)
    attackpattern = 5;
else if (attackpattern == 5)
    attackpattern = 8;
else if (attackpattern == 8)
    attackpattern = 11;
else if (attackpattern == 11)
    attackpattern = 13;
else if (attackpattern == 13)
    attackpattern = 12;
