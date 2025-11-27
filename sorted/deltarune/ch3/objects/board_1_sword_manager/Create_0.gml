con = 0;
swordcon = 0;
timer = 0;
if (global.flag[1007] == 0 && global.swordboardeath == 0)
{
    transition = instance_create(x, y, obj_board_squaretransition);
    transition.depth = 100001;
    transition.special = "heart";
}
else
{
    con = 10;
}
doonce = 0;
