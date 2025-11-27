image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
susie = 0;
ralsei = 0;
krisreal = 0;
susiereal = 0;
ralseireal = 0;
tenna = 0;
suwalk = 0;
visit = 0;
camwatch = 0;
leavecon = 0;
leavetimer = 0;

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
