setxy(x + 6, y + 32, mysolid);
if (engaged)
{
    setxy(x + 20, (y - 4) + (yoffset * 1.1), kris);
    kris.depth = depth - 1;
    kris.sprite_index = spr_kris_piano_loop_1;
    if (i_ex(susie))
    {
        susie.image_xscale = 2;
        setxy(x + 36, (y - 10) + (yoffset * 1.05), susie);
        if (yoffset < 0)
        {
            susie.sprite_index = spr_susie_dw_fall_brace;
            if (myhspeed < 0)
            {
                susie.image_xscale = -2;
                setxy(x + 96, (y - 10) + (yoffset * 1.05), susie);
            }
        }
        else
        {
            susie.sprite_index = spr_susie_up_dw;
        }
        if (shakex >= 9)
        {
            susie.sprite_index = spr_susie_dw_landed;
            if (myhspeed > 0)
            {
                susie.image_xscale = -2;
                setxy(x + 96, (y - 10) + (yoffset * 1.05), susie);
            }
        }
        susie.depth = depth - 2;
    }
    if (i_ex(ralsei))
    {
        var xoff = 0;
        if (ralshakex > 0)
            xoff = ((ralshakex % 2) - 0.5) * 2 * ralshakex;
        setxy(x + 4 + xoff, (y - 6) + (yoffset * 1.2), ralsei);
        if (yoffset < 0)
        {
            ralsei_knocked_down = 16;
            if (myhspeed > 0)
                ralsei.sprite_index = spr_ralsei_shocked_right_landed;
            else
                ralsei.sprite_index = spr_ralsei_shocked_left_landed;
            ralsei.image_index = 0;
        }
        else if (!ralsei_knocked_down)
        {
            ralsei.sprite_index = spr_ralsei_up;
        }
        else
        {
            ralsei_knocked_down--;
            if (ralsei_knocked_down == 0)
                ralshakex = 8;
            if (myhspeed > 0)
                ralsei.sprite_index = spr_ralsei_shocked_right_landed;
            else
                ralsei.sprite_index = spr_ralsei_shocked_left_landed;
            ralsei.image_index = 1;
        }
        ralshakex--;
        ralsei.depth = depth - 2;
    }
}
if (camcontrol)
{
    obj_mainchara.cutscene = 1;
    camerax_set(camx);
    cameray_set(camy);
    if (camcon == 2)
    {
        var roomw = room_width;
        var roomh = room_height;
        var vieww = view_wport[0];
        var viewh = view_hport[0];
        var plcamx = clamp(obj_mainchara.x - floor((vieww / 2) - (obj_mainchara.initwd / 2)), 0, roomw - vieww);
        var plcamy = clamp(obj_mainchara.y - floor((viewh / 2) - (obj_mainchara.initht / 2)), 0, roomh - viewh);
        camstrength = lerp(camstrength, 4, 0.010101010101010102);
        camx = lerp(camx, plcamx, camstrength / 8);
        camy = lerp(camy, plcamy, camstrength / 8);
        if (point_distance(plcamx, plcamy, camx, camy) < 2)
        {
            camcon = 3;
            camcontrol = 0;
            obj_mainchara.cutscene = 0;
        }
    }
}
