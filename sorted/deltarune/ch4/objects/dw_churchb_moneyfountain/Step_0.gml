var nointeract = 0;
if (instance_exists(obj_dw_church_organikchaser))
    nointeract = true;
if (scr_debug())
{
    if (keyboard_check(ord("W")) && keyboard_check_pressed(ord("0")))
        room_goto(room_dw_church_moneyfountain);
}
if (!init)
{
    var pos = scr_heromarker(undefined, "fountain");
    fountain = instance_create(pos[0], pos[1], obj_trigger_interact);
    fountain.talked = 0;
    scr_sizeexact(pos[2].sprite_width, pos[2].sprite_height, fountain);
    init = 1;
}
with (plack)
{
    if (nointeract)
        myinteract = 0;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* .ecnarbmemer ruoy wohs lliw \\cAnoitanod taerg a ^1,edis rehto eht ot ssap\\cW uoy nehW/%", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_77_0");
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (fountain)
{
    if (nointeract)
        myinteract = 0;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (The water is gleaming..^1. gold coins are glittering inside.)/%", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_103_0");
        if (global.flag[898] == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The water is frozen in emptiness.)/%", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_108_0");
        }
        d_make();
        myinteract = 999;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (mynpc)
{
    if (nointeract)
        myinteract = 0;
    if (!variable_instance_exists(id, "myinteract"))
        myinteract = 0;
    if (myinteract == 3)
    {
        marker.sprite_index = spr_npc_organik_0_talk_differentrobe;
        global.interact = 1;
        var money = global.flag[898];
        var itemreceived = global.flag[1537];
        scr_speaker("no_name");
        msgsetloc(0, "* You are the donator. Your money has turned into fine gold./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_138_0");
        msgnextsubloc("* In total^1, you reached \\cY~1 Gold\\cW./", string(global.flag[898]), "obj_dw_churchb_moneyfountain_slash_Step_0_gml_139_0");
        if (other.bonus)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* You are one of the donators./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_144_0");
            msgnextsubloc("* Between you and another^1, you reached \\cY~1 Gold\\cW./", string(global.flag[898] + other.bonus), "obj_dw_churchb_moneyfountain_slash_Step_0_gml_145_0");
        }
        if (money > 0 && money < 100)
            msgnextloc("* Although small^1, such actions may inspire others./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_150_0");
        if (money >= 100 && money < 500)
            msgnextloc("* Although you may have felt a bit flushed^1, it was certainly the right move./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_154_0");
        if (money >= 500 && money < 2000)
            msgnextloc("* The National Mint would like to award you for your service./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_158_0");
        if (money >= 2000 && money < 9999)
            msgnextloc("* The heavens were certainly moved to tears by your generosity./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_162_0");
        if (money >= 9999)
        {
            msgnextloc("* How absurd.../", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_166_0");
            msgnextloc("* You may as well give money to a spider./", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_167_0");
        }
        msgnextloc("* Take what is in the treasure box as if it is yours./%", "obj_dw_churchb_moneyfountain_slash_Step_0_gml_170_0");
        if (talked)
        {
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract > 3 && d_ex())
    {
        var trig = 0;
        if (!i_ex(obj_writer))
            trig = 1;
        with (obj_writer)
        {
            if (halt)
                trig = 1;
        }
        if (!trig)
            marker.image_index += 0.25;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
if (econ == 1)
{
    if (point_distance(obj_mainchara.x, obj_mainchara.y, mynpc.x, mynpc.y) < 120)
    {
        econ = 2;
        mynpc.visible = false;
        enemy = instance_create(mynpc.x, mynpc.y, obj_dw_church_organikchaser);
        enemy.encounterflag = encounterflag;
        enemy.encounterno = encounterno;
        setxy(room_width * 4, 0, mynpc);
    }
}
