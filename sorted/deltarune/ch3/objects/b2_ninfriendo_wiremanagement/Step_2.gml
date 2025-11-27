if (init == 0)
{
    if (i_ex(favored) && i_ex(unfavored))
    {
        init = 1;
        cont[0] = scr_dark_marker(x, y, spr_ch3_controller);
        cont[1] = scr_dark_marker(x, y, spr_ch3_controller);
        cont[2] = scr_dark_marker(room_width, room_height, spr_ch3_controller);
    }
}
var override = 0;
if (override)
{
    xoff[0] = 58;
    yoff[0] = 80;
}
if (stick[0] && i_ex(unfavored))
{
    if (i_ex(cont[0]))
    {
        cont[0].x = unfavored.x + xoff[0];
        cont[0].y = unfavored.y + yoff[0];
        cont[0].depth = 96220;
    }
}
if (stick[1] && i_ex(favored))
{
    if (i_ex(cont[1]))
    {
        cont[1].x = favored.x + xoff[1];
        cont[1].y = favored.y + yoff[1];
        cont[1].depth = 96220;
    }
}
if (stick[2] && i_ex(rouxls))
{
    if (i_ex(cont[2]))
    {
        cont[2].image_angle = 90;
        xoff[2] = 36;
        yoff[2] = 4;
        cont[2].x = rouxls.x + xoff[2];
        cont[2].y = rouxls.y + yoff[2];
        cont[2].depth = rouxls.depth - 1;
    }
}
