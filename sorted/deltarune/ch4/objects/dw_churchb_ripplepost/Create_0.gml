timer = 0;
con = 0;
global.flag[7] = 0;
if (scr_debug())
{
    if (keyboard_check(ord("W")))
    {
        if (keyboard_check_pressed(ord("V")))
        {
        }
    }
    if (keyboard_check(ord("P")))
        global.tempflag[90] = 1;
}
with (obj_border_controller)
    show_border();
