if (type == 0)
{
    siner++
    x += (sin((siner / 8)) / 2)
    y += (cos((siner / 8)) / 2)
    zoomtimer += ((zoomtimer / 5) + 16)
    if (zoomtimer >= zoomtime)
        zoomtimer = zoomtime
    lerpamount = (zoomtimer / zoomtime)
    if (lerpamount >= 1)
        lerpamount = 1
    radius = lerp(startradius, endradius, lerpamount)
}
if (type == 1)
{
    if (radius > endradius)
        radius -= 8
    if (radius <= 0)
        radius = 0
}
surface_set_target(surf)
draw_clear(c_black)
draw_set_blend_mode(3)
draw_set_color(c_white)
draw_circle(x, y, radius, 0)
surface_reset_target()
draw_set_blend_mode(0)
if (finish == 1)
{
    type = 1
    endradius = 0
    zoomtime += 100
}
