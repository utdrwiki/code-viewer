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
for (var i = 0; i < 4; i++)
{
    southblock[i] = instance_create(x + (32 * (3 + i)), y + 192, obj_board_solid);
    southblock[i].visible = true;
    southblock[i].sprite_index = spr_board_bricktile;
    scr_darksize(southblock[i]);
    with (southblock[i])
        scr_depth_board();
}
resetblocks = false;
