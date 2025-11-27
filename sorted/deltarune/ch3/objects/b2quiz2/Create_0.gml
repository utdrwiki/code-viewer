image_alpha = 0;
active = false;
init = 0;
con = 0;
timer = 0;
kris = 0;
susie = 0;
ralsei = 0;
kr_real = 0;
su_real = 0;
ra_real = 0;
tenna = 0;
suwalk = 0;
suwalktimer = 0;
visit = 0;
qstate = 0;
myq = 0;
semiactive = false;
getter = 0;
shellgra = 0;
made = 0;
shellint = instance_create(3072, 2944, obj_board_shell);
with (shellint)
    setxy_board();
shellgrab = instance_create(3072, 2944, obj_board_grabbleObject);
with (shellgrab)
    setxy_board(3072, 2944);
shellgrab.sprite_index = spr_board_shell;
shellgrab.extflag = "shell";

function checkskip(arg0, arg1)
{
    var _skip = false;
    if (timer > (arg0 + 5) && timer < (arg1 - 1))
    {
        if (button3_h())
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
