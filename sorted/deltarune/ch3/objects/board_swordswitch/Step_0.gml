active = true;
if (active)
{
    if (con == 0)
    {
        if (i_ex(obj_board_swordhitbox))
        {
            if (place_meeting(x, y, obj_board_swordhitbox))
            {
                snd_play(snd_board_sword_metal);
                switchstate = !switchstate;
                con = 1;
            }
        }
    }
    if (con == 1)
    {
        if (!i_ex(obj_board_swordhitbox))
            con = 0;
    }
}
image_index = switchstate;
