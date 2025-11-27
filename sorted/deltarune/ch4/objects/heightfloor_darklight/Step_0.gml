lit = 0;
if (place_meeting(x, y + 80, obj_dw_church_shelflightarea))
    lit = 1;
if (lit == 1)
    highlight = lerp(highlight, 1, 0.5);
else
    highlight = lerp(highlight, 0, 0.5);
if (lit == 0)
{
    if (type == 0)
        floorheight = 999;
    if (type == 1)
        floorheight = 1;
}
if (lit == 1)
{
    if (type == 1)
        floorheight = 999;
    if (type == 0)
        floorheight = 1;
}
