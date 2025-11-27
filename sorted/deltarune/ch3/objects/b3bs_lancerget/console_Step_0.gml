if (init == 0)
{
    if (hascontroller)
    {
        mylancer = instance_create(lanx, lany, obj_board_solid);
        mylancer.sprite_index = spr_board_lancer_spin;
        mylancer.image_speed = 0.25;
        mylancer.visible = true;
        mylancer.image_index = x / 32;
        scr_darksize(mylancer);
        with (mylancer)
            scr_depth_board();
    }
    init = 1;
}
if (buffer > 0)
    buffer--;
var normal = true;
if (global.flag[1055] >= 6)
    normal = false;
if (normal)
{
    if (con == 1)
    {
        normal = true;
        if (normal)
            global.interact = 1;
        scr_speaker("no_name");
        global.msc = -99;
        if (hascontroller)
        {
            if (checked == 0)
            {
                with (object_index)
                    checked = 1;
                msgsetloc(0, "* (It's a controller that lets you play as Lancer. Take it?)/", "obj_b3bs_lancerget_console_slash_Step_0_gml_29_0");
            }
            else
            {
                msgsetloc(0, "* (Lancer controller.)/", "obj_b3bs_lancerget_console_slash_Step_0_gml_34_0");
            }
            global.choice = -1;
            global.choicemsg[0] = stringsetloc("#Take", "obj_b3bs_lancerget_console_slash_Step_0_gml_38_0");
            global.choicemsg[1] = stringsetloc("#No", "obj_b3bs_lancerget_console_slash_Step_0_gml_39_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            msgnextloc("\\C2 ", "obj_b3bs_lancerget_console_slash_Step_0_gml_43_0");
            d_make();
            con = 2;
        }
        else
        {
            var ow_controlxpos = x + 20;
            var ow_controlypos = 270;
            var ow_camx = camerax();
            var ow_playx = lanx;
            var ow_playy = lany;
            switch (x)
            {
                case 1226:
                    ow_camx = 946;
                    break;
                case 906:
                    ow_camx = 625;
                    break;
                case 586:
                    ow_camx = 305;
                    break;
            }
            with (obj_b3bs_console)
            {
                controlxpos = ow_controlxpos;
                controlypos = ow_controlypos;
                camx = ow_camx;
                playx = ow_playx;
                playy = ow_playy;
                event_user(0);
                buffer = 3;
            }
            con = 3;
        }
    }
    if (con == 2 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            global.flag[1099]++;
            snd_play(snd_splat);
            scr_speaker("no_name");
            if (global.flag[1099] == 1)
            {
                msgsetloc(0, "* (You can now play as Lancer.)/%", "obj_b3bs_lancerget_console_slash_Step_0_gml_68_0");
                scr_keyitemget(19);
            }
            else
            {
                msgsetsubloc(0, "* (You can now play as ~1 Lancers.)/%", string(global.flag[1099]), "obj_b3bs_lancerget_console_slash_Step_0_gml_72_0");
            }
            d_make();
            with (mylancer)
            {
                instance_create(x, y, obj_board_smokepuff);
                instance_destroy();
            }
            hascontroller = false;
        }
        con = 3;
    }
    if (con == 3 && !d_ex())
    {
        con = 0;
        global.interact = 0;
        buffer = 3;
    }
    image_index = hascontroller;
    if (insert == 1)
    {
        insert = 0;
        if (!hascontroller)
        {
            hascontroller = 1;
            mylancer = instance_create(lanx, lany, obj_board_solid);
            mylancer.sprite_index = spr_board_lancer_spin;
            mylancer.image_speed = 0.25;
            mylancer.visible = true;
            mylancer.image_index = x / 32;
            scr_darksize(mylancer);
            with (mylancer)
                instance_create(x, y, obj_board_smokepuff);
            with (mylancer)
                scr_depth_board();
        }
    }
}
else
{
    image_index = 0;
    if (con == 1)
    {
        global.msc = 1411;
        global.interact = 1;
        scr_text(global.msc);
        d_make();
        con = 2;
    }
    if (con == 2 && !d_ex())
    {
        global.interact = 0;
        con = 0;
    }
}
