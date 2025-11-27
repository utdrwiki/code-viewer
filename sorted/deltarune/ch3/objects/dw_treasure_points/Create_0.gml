mydialoguer = -4;
myinteract = 0;
talked = 0;
image_speed = 0;
close = 0;
scr_darksize();
scr_depth();
image_index = scr_flag_get(1101);
treasure_flag = -1;
open_chest = false;
chest_con = 0;
is_opened = false;
display = -4;

init = function(arg0)
{
    treasure_flag = arg0;
    image_index = scr_flag_get(treasure_flag);
    is_opened = scr_flag_get(treasure_flag);
    scr_depth();
};
