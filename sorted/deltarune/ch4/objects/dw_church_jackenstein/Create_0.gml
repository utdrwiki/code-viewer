con = 0;
check1 = true;
check2 = true;
instance_create(x, y, obj_tutorial_text);
solidmake = false;
if (global.flag[850] >= 6)
{
    solidmake = true;
    instance_create(480, 192, obj_dw_church_jackenstein_pumpkinNPC);
}
