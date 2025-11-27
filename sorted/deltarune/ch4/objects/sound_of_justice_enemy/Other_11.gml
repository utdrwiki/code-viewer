if (attackpattern == 11)
{
    var spearspeed = 18;
    scr_spearpattern(0, 0, 0, 36, 15);
    scr_spearpattern(3, 0, 0, 37, 1);
    var a = 32;
    var b = 64;
    var c = 0.7;
    var d = 31;
    repeat (10)
    {
        a -= 0.5;
        b -= 1;
        c += 0.025;
        d -= 0.5;
        scr_spearpattern(0.85, round(d), 0, 43, 0);
        scr_spearpattern(c, 0, 0, 39, 1);
        scr_spearpattern(choose("r", "l", "u"), spearspeed, a, 0, round(b / 2));
        scr_spearpattern(0, 8, 0, 43, round(b / 2));
    }
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
    repeat (10)
    {
        a -= 0.5;
        b -= 1;
        c += 0.025;
        d -= 0.5;
        scr_spearpattern(0.85, round(d), 0, 43, 0);
        scr_spearpattern(c, 0, 0, 39, 1);
        scr_spearpattern(choose("r", "l", "u"), spearspeed, a, 0, round(b / 2));
        scr_spearpattern(0, 8, 0, 43, round(b / 2));
    }
    scr_spearpattern(0, 0, 0, 55, 1);
    scr_spearpattern(0, 0, 0, 54, 80);
}
