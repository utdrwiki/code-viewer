if (creator != -1 && i_ex(creator))
{
    with (creator)
        visible = 1;
}
if (creatorid != -1 && i_ex(creatorid))
{
    with (creatorid)
        image_alpha = 1;
}
with (obj_rouxls_ch3_enemy)
    scr_lerpvar_instance(id, "x", x, xstart, 20);
