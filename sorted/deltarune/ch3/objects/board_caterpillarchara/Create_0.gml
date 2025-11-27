scr_depth();
image_speed = 0;
if (global.darkzone)
    scr_darksize(id);
walk = 0;
fun = 0;
follow = 1;
runmove = 0;
dir = 0;
walkbuffer = 0;
walktimer = 0;
slided = 0;
specialed = 0;
init_clothes = false;
blushtimer = 0;
name = "susie";
target = 12;
dsprite = spr_board_susie_walk_down;
rsprite = spr_board_susie_walk_right;
usprite = spr_board_susie_walk_up;
lsprite = spr_board_susie_walk_left;
slidesprite = spr_susie_slide;
climbsprite = 2409;
parent = obj_mainchara_board;
pd = parent.dsprite;
pr = parent.rsprite;
pl = parent.lsprite;
pu = parent.usprite;
for (i = 0; i < 75; i += 1)
{
    remx[i] = parent.x;
    remy[i] = parent.y;
    facing[i] = global.facing;
    sliding[i] = 0;
    special[i] = 0;
}
depth = parent.depth + 5;
mywidth = 0;
myheight = 0;
xoffset = 0;
yoffset = 0;
init = 0;
forget = 0;
ignoredepth = 0;
halign = 0;
valign = 0;
