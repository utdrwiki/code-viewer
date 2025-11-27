myinteract = 0;
image_speed = 0;
read = 0;
tempvar = 0;
extflag = "";
mydialoguer = -1;
skip = 0;
selfdestruct = false;
if (global.chapter >= 2)
{
    if (room == room_schooldoor && x >= 270 && x <= 470)
    {
        dwt = instance_create(x, y, obj_dw_transition_interactable);
        dwt.image_xscale = image_xscale;
        dwt.image_yscale = image_yscale;
        instance_destroy();
    }
}
