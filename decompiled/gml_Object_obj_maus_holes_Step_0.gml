if (preptimer > 0)
    return;
if (preptimer == 0)
{
    depth -= 11
    preptimer = -1
}
if (timer <= 0 && mausqueue > 0)
{
    mausqueue--
    var nexthole = irandom(7)
    var safety = 0
    while (maushole[nexthole] > 0 && (maushole[nexthole] - 50) < global.turntimer)
    {
        nexthole = irandom(7)
        safety++
        if (safety > 8)
            return;
    }
    maushole[nexthole] = global.turntimer
    timer += 10
    var xx = x
    var yy = y
    var side = randomsign()
    if (nexthole < 4)
    {
        xx = (((x - sideoffset) + 46) + (holeoffset * nexthole))
        yy = (y + (sideoffset * side))
    }
    else
    {
        xx = (x + (sideoffset * side))
        yy = (((y - sideoffset) + 46) + (holeoffset * (nexthole - 4)))
    }
    if (dontcreatemouse == 0)
    {
        d = scr_childbullet(xx, yy, 470)
        if (nexthole < 4)
            d.direction += (90 * side)
        else if (side > 0)
            d.direction = 180
        d.speed = 6
        d.image_angle = d.direction
        d.grazepoints = grazepoints
        if bigmaus
        {
            d.big = 1
            d.sprite_index = spr_maus_critter_stuck
            d.alarm[0] = 22
            bigmaus--
        }
    }
}
else if (timer > 0)
    timer--
