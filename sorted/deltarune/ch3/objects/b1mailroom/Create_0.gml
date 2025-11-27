image_alpha = 0;
active = false;
init = 0;
con = 0;
kr_mem = 0;
su_mem = 0;
ra_mem = 0;
kr = 0;
su = 0;
ra = 0;
tenna = 0;
eraserx = 640;
erasetruck = 0;
eraser = 0;
quickescape = 0;
musfadein = false;
fadealpha = 0;
depth = 999995;
timer = 0;
reflate = false;
deflate = 0;

function checkskip(arg0, arg1)
{
    var _skip = false;
    if (timer > (arg0 + 5) && timer < (arg1 - 1))
    {
        if (button3_h())
            _skip = true;
    }
    if (timer > (arg0 + 1) && timer < (arg1 - 1))
    {
        if (button1_p())
            _skip = true;
    }
    if (_skip)
    {
        timer = arg1 - 1;
        safe_delete(obj_tennatalkbubble);
        safe_delete(obj_couchwriter);
        _skip = false;
    }
}
