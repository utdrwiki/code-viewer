if (global.turntimer < 1)
    instance_destroy();
if (global.turntimer <= 12 && !skipme)
{
    skipme = true;
    scr_lerpvar("x", x, creatorid.x - 18, 12, true, "out");
    scr_lerpvar("y", y, creatorid.y - 28, 12, true, "out");
}
