xrelative = abs((x - obj_growtangle.x))
if (shotready && ((!caralert) || (xrelative >= 12 && xrelative <= 23)))
{
    if (flashtimer < 8)
        flashtimer++
    else
    {
        shotready = false
        d = scr_childbullet(x, y, 411)
        d.speed = (bigshot ? 6 : 4)
        d.grazepoints = grazepoints
        if bigshot
            d.image_xscale = 2
        d.direction = 270
        flashtimer = 0
    }
}
