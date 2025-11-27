depth = 1000010;
visible = 0;
dodraw = false;
if (scr_debug())
{
    dodraw = true;
    if (i_ex(obj_rotating_tower_controller_new))
        dodraw = false;
    if (i_ex(obj_dw_church_sideclimb_glowclimb))
        dodraw = false;
}
