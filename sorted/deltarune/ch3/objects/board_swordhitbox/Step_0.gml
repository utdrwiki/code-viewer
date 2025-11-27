if (parentid == -1 || !i_ex(parentid))
{
    instance_destroy();
    exit;
}
if (init == 0)
{
    if (init == 0)
    {
        image_alpha = 0;
        timer = 0;
        scr_darksize(id);
    }
    if (facing == 0)
    {
        sprite_index = spr_board_swordhitbox_vert;
        image_yscale = 2;
        y = parentid.y + 32;
        x = parentid.x + 2;
    }
    if (facing == 1)
    {
        sprite_index = spr_board_swordhitbox_horiz;
        image_xscale = 2;
        y = parentid.y + 14;
        x = parentid.x + 32;
    }
    if (facing == 2)
    {
        sprite_index = spr_board_swordhitbox_vert;
        image_yscale = -2;
        y = parentid.y;
        x = parentid.x + 10;
    }
    if (facing == 3)
    {
        sprite_index = spr_board_swordhitbox_horiz;
        image_xscale = -2;
        y = parentid.y + 14;
        x = parentid.x;
    }
    init = 1;
}
else
{
    timer++;
    if (timer == 5)
        instance_destroy();
}
