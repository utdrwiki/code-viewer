if (global.turntimer < 1)
    instance_destroy();
if (alarm[0])
    image_index = scr_approach(image_index, 4, 0.5);
if (global.turntimer <= 12 && !skipme)
{
    skipme = true;
    scr_lerpvar("x", x, creatorid.x - 18, 12, true, "out");
    scr_lerpvar("y", y, creatorid.y - 28, 12, true, "out");
}
if (skipme)
    image_index = scr_approach(image_index, 0, 0.5);
