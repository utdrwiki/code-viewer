var repositioned = 0;
if (place_meeting(x, y, obj_solidblock) || place_meeting(x, y, obj_solidenemy))
{
    if (!place_meeting(xprevious, y, obj_solidblock) && !place_meeting(xprevious, y, obj_solidenemy))
    {
        x = xprevious;
        repositioned = 1;
    }
    if (!repositioned && !place_meeting(x, yprevious, obj_solidblock) && !place_meeting(x, yprevious, obj_solidenemy))
    {
        y = yprevious;
        repositioned = 1;
    }
    if (!repositioned)
    {
        x = xprevious;
        y = yprevious;
    }
}
