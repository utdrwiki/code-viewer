if (scr_debug())
    visible = true;
if (kris == 0)
{
    with (obj_mainchara_board)
        other.kris = id;
}
if (active && !made)
{
    made = true;
    with (instance_create(4896, 1824, obj_board_solid))
    {
        scr_size(2, 1);
        setxy_board();
    }
}
if (active == true && obj_board_camera.con == 0)
{
    kris.cantleave = true;
    if (con == 0)
    {
        if (kris.y >= 128)
        {
            with (obj_mainchara_board)
            {
                obj_mainchara.fun = 1;
                obj_mainchara.sprite_index = spr_krisu_holdcontroller_hurt;
                with (obj_mainchara)
                    scr_var_delay("sprite_index", spr_krisu_holdcontroller, 5);
                susierecordcon = 2;
                susierecordcount = 0;
                susierecordstring = "0U0U0U";
                susierecordsave = false;
            }
            timer = 0;
            con = 1;
        }
    }
    if (con == 1)
    {
        if (kris.y >= 176)
        {
            with (obj_mainchara_board)
            {
                susierecordcon = 2;
                susierecordcount = 0;
                susierecordstring = "0U0U0U0U0U0U";
                susierecordsave = false;
                obj_mainchara.sprite_index = spr_krisu_holdcontroller_hurt;
                with (obj_mainchara)
                    scr_var_delay("sprite_index", spr_krisu_holdcontroller, 12);
            }
            timer = 0;
            con = 2;
        }
    }
    if (con == 2)
    {
        if (kris.y >= 208)
        {
            if (kris.x >= 244 && kris.x <= 362)
            {
                with (obj_mainchara_board)
                {
                    controlled = false;
                    susierecordcon = 2;
                    susierecordcount = 0;
                    susierecordstring = "0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U0U";
                    susierecordsave = false;
                }
                obj_mainchara.fun = 1;
                obj_mainchara.sprite_index = spr_krisu_holdcontroller_hurt;
                con = 3;
            }
        }
    }
    if (con == 3)
    {
        timer++;
        if (timer == 15)
        {
            con = 4;
            timer = 0;
        }
    }
    if (con == 4)
    {
        timer++;
        if (timer == 80)
        {
            obj_mainchara_board.controlled = 1;
            obj_mainchara.sprite_index = spr_krisu_holdcontroller;
            con = 5;
            timer = 0;
        }
    }
}
