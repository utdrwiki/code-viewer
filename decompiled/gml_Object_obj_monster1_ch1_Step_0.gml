if (global.monster[myself] == true)
{
    if (global.mnfight == 1 && talked == false)
    {
        abletotarget = true
        if (global.charcantarget[0] == false && global.charcantarget[1] == false && global.charcantarget[2] == false)
            abletotarget = false
        mytarget = choose(0, 1, 2)
        if (abletotarget == true)
        {
            while (global.charcantarget[mytarget] == false)
                mytarget = choose(0, 1, 2)
        }
        else
            target = 3
        global.targeted[mytarget] = true
        instance_create_ch1(0, 0, obj_darkener_ch1)
        global.typer = 7
        global.msg[0] = scr_84_get_lang_string_ch1("obj_monster1_slash_Step_0_gml_25_0")
        if (global.mercymod[myself] >= global.mercymax[myself])
            global.msg[0] = scr_84_get_lang_string_ch1("obj_monster1_slash_Step_0_gml_26_0")
        mywriter = instance_create_ch1((x - 60), (y - 30), obj_writer_ch1)
        talked = true
        talktimer = 0
    }
    if (talked == true && global.mnfight == 1)
    {
        if (button1_p_ch1() && talktimer > 15)
            talktimer = talkmax
        talktimer += 1
        if (talktimer >= talkmax)
        {
            with (obj_writer_ch1)
                instance_destroy()
            global.mnfight = 2
        }
    }
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        global.msg[0] = scr_84_get_lang_string_ch1("obj_monster1_slash_Step_0_gml_75_0")
        global.typer = global.battletyper
        battlewriter = instance_create_ch1((xx + 30), (yy + 376), obj_writer_ch1)
        if (global.fc != 0)
            myface = instance_create_ch1((xx + 26), (yy + 380), obj_face_ch1)
        if (acting == true)
            global.mercymod[myself] += 120
        if (global.mercymod[myself] >= global.mercymax[myself])
            global.msg[0] = scr_84_get_lang_string_ch1("obj_monster1_slash_Step_0_gml_82_0")
    }
    if (acting == 2)
    {
        if (acttimer == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_monster1_slash_Step_0_gml_91_0")
            global.typer = global.battletyper
            battlewriter = instance_create_ch1((xx + 130), (yy + 376), obj_writer_ch1)
            if (global.fc != 0)
                myface = instance_create_ch1((xx + 26), (yy + 380), obj_face_ch1)
        }
        if (acttimer == 20)
        {
            global.chartarget[0] = myself
            global.chartarget[1] = myself
            global.charspecial[0] = 1
            global.charspecial[1] = 1
            with (global.charinstance[0])
                state = 2
            with (global.charinstance[1])
                state = 2
        }
        if (acttimer == 40)
            actcon = 1
        acttimer += 1
    }
    if (actcon == 1 && (!instance_exists(obj_writer_ch1)))
    {
        actcon = 0
        scr_attackphase_ch1()
    }
}
if (x > (__view_get((0 << 0), 0) + 800) && global.myfight != 3)
    instance_destroy()
