siner = 0
con = 0
total = 0
if (global.flag[201] == 0)
{
    eye[0] = 0
    eye[1] = 0
    eye[2] = 0
    for (i = 0; i < 3; i += 1)
    {
        shine[i] = scr_dark_marker_ch1(((x + 30) + (i * 110)), (y + 110), spr_shine_ch1)
        shine[i].image_speed = 0.1
        shine[i].depth = 800000
    }
    block = instance_create_ch1(960, 320, obj_soliddark_ch1)
    block.image_yscale = 2
}
else
{
    con = 44
    eye[0] = 1
    eye[1] = 1
    eye[2] = 1
    for (i = 0; i < 3; i += 1)
    {
        glass = scr_dark_marker_ch1((960 + (i * 40)), 320, spr_magicalglass_ch1)
        glass.depth = 950000
        glass = scr_dark_marker_ch1((960 + (i * 40)), 360, spr_magicalglass_ch1)
        glass.depth = 950000
    }
    with (obj_darkeyepuzzle_switch_ch1)
        instance_destroy()
}
