timer++;
if (active == 1)
{
    image_speed = 1;
    if (timer > sprite_get_number(sprite_index))
        image_index = 0;
    if (timer >= (sprite_get_number(sprite_index) * 3))
        timer = 0;
}
else
{
    image_speed = 0;
    image_index = 0;
}
if (tilecon == 0)
{
    if (tilechoice == 2)
    {
        if (timesdrunk < timestodrink)
        {
            global.msc = 20000;
            scr_text(global.msc);
            scr_speaker("no_name");
            global.choicemsg[0] = stringsetloc("#Drink", "obj_board_oasis_old_slash_Step_0_gml_29_0");
            global.choicemsg[1] = stringsetloc("#Don't Drink", "obj_board_oasis_old_slash_Step_0_gml_30_0");
            global.choicemsg[2] = stringset("");
            global.choicemsg[3] = stringset("");
            msgsetloc(0, "* THE OASIS IS SPARKLING./", "obj_board_oasis_old_slash_Step_0_gml_33_0");
            msgnextloc("* DRINK IT?/", "obj_board_oasis_old_slash_Step_0_gml_34_0");
            msgnextloc(" \\C2", "obj_board_oasis_old_slash_Step_0_gml_35_0");
            d_make();
            tilecon = 1;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* THERE IS NOTHING LEFT./%", "obj_board_oasis_old_slash_Step_0_gml_42_0");
            d_make();
            turnender = 0;
            active = 0;
            tilecon = 2;
        }
    }
}
if (tilecon == 1 && !d_ex())
{
    if (global.choice == 0)
    {
        timesdrunk++;
        if (timesdrunk < timestodrink)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* IT TASTES LIKE MINT AND SAND./", "obj_board_oasis_old_slash_Step_0_gml_58_0");
            msgnextloc("* YOUR WOUNDS WERE HEALT./%", "obj_board_oasis_old_slash_Step_0_gml_59_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* YOU SUCKED UP ALL THE OASIS WITH A STRAW./", "obj_board_oasis_old_slash_Step_0_gml_64_0");
            msgnextloc("* TASTES LIKE SANDY REGRET./", "obj_board_oasis_old_slash_Step_0_gml_65_0");
            msgnextloc("* THE ENVIRONMENT DETERIORATES./%", "obj_board_oasis_old_slash_Step_0_gml_66_0");
        }
        d_make();
        snd_play_x(snd_revival, 1, 1.6 + (timesdrunk / 5));
        scr_debug_print(string(timesdrunk));
    }
    if (global.choice == 1)
        msgsetloc(0, "%%", "obj_board_oasis_old_slash_Step_0_gml_75_0");
    tilecon++;
}
if (tilecon == 2 && !d_ex())
    tilecon = 99;
if (tilecon == 99)
{
    tilechoice = 0;
    if (!d_ex())
    {
        tilecon = 0;
        obj_board_controller.phase = 0;
        obj_board_controller.inputbuffer = 2;
    }
}
if (turnended == 1)
{
    if (!place_meeting(x, y, obj_mainchara_board))
        turnended = 0;
}
