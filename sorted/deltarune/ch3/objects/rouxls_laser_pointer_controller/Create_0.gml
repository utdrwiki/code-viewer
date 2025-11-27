timer = 0;
con = 0;
recordstring = "";
recordcount = 0;
recordsave = false;
if (i_ex(obj_growtangle))
{
    _mouse_x = obj_growtangle.x;
    _mouse_y = obj_growtangle.y;
}
else
{
    _mouse_x = 0;
    _mouse_y = 0;
}
depth = -99999999;
