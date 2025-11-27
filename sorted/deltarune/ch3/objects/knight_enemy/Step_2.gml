if (scr_isphase("bullets") && myattackchoice == 0)
{
    if (myattackchoice == 0 && i_ex(obj_heart) && obj_heart.x > (camerax() + 165))
        obj_heart.x = camerax() + 165;
}
if (end_cutscene_version == 1)
{
    with (obj_dmgwriter)
        instance_destroy();
}
