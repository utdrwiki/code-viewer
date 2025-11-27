con = 0;
timer = 0;
musinit = 0;
graballpots = 0;
graballpots_con = 0;
usprite = spr_board_susie_walk_up;
dsprite = spr_board_susie_walk_down;
lsprite = spr_board_susie_walk_left;
rsprite = spr_board_susie_walk_right;
sprite_index = dsprite;
targetspot = 0;
kris = 0;
tx = 0;
ty = 0;
facing = 0;
bombcount = 0;
canfreemove = true;
grabbed = 0;
holding = 0;
xx = x;
yy = y;
ralsei = 0;
manageralsei = false;
raltimer = 0;
ralcon = 0;
ralstring = "0U";
up_str = "0U";
down_str = "0D";
left_str = "0L";
right_str = "0R";
repeat (90)
{
    up_str += "0U";
    down_str += "0D";
    left_str += "0L";
    right_str += "0R";
}
debug_message("up_str=" + up_str);
if (musinit == 0)
{
    musinit = 1;
    with (obj_b1susiedig)
        startsong = 1;
}
