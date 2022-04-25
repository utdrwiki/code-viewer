if scr_debug()
{
    if keyboard_check_pressed(vk_f12)
    {
        global.inv = -1
        target = 4
        damage = (global.monsterat[myself] * 5)
        scr_damage()
    }
}
if (global.monster[myself] == true)
{
    if (scr_isphase("enemytalk") && talked == false)
    {
        scr_randomtarget()
        if (!instance_exists(obj_darkener))
            instance_create(0, 0, obj_darkener)
        global.typer = 50
        rr = choose(0, 1, 2, 3)
        if (rr == 0)
            msgset(0, "")
        if (rr == 1)
            msgset(0, "")
        if (rr == 2)
            msgset(0, "")
        if (rr == 3)
            msgset(0, "")
        scr_enemyblcon((x - 160), y, 3)
        talked = true
        talktimer = 0
    }
    if (talked == true && scr_isphase("enemytalk"))
    {
        rtimer = 0
        scr_blconskip(15)
        if scr_isphase("bullets")
        {
            if (!instance_exists(obj_moveheart))
                scr_moveheart()
            if (!instance_exists(obj_growtangle))
                instance_create((__view_get((0 << 0), 0) + 320), (__view_get((1 << 0), 0) + 170), obj_growtangle)
        }
    }
    if (scr_isphase("bullets") && attacked == false)
    {
        rtimer += 1
        if (rtimer == 12)
        {
            rr = choose(0, 1)
            if (rr == 0)
            {
                global.monsterattackname[myself] = "HomingDiamonds"
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller)
                dc.type = 0
            }
            else
            {
                global.monsterattackname[myself] = "RisingDiamonds"
                dc = scr_bulletspawner(x, y, obj_dbulletcontroller)
                dc.type = 1
            }
            scr_turntimer(140)
            turns += 1
            global.typer = 6
            global.fc = 0
            rr = choose(0, 1, 2, 3)
            if scr_messagepriority(random(2))
            {
                var substring = string(myself)
                if (rr == 0)
                    global.battlemsg[0] = ""
                if (rr == 1)
                    global.battlemsg[0] = ""
                if (rr == 2)
                    global.battlemsg[0] = ""
                if (rr == 3)
                    global.battlemsg[0] = ""
            }
            if (global.monsterhp[myself] <= (global.monstermaxhp[myself] / 3))
            {
                if scr_messagepriority((100 + random(2)))
                {
                    substring = string(myself)
                    global.battlemsg[0] = ""
                }
            }
            attacked = true
        }
        else
            scr_turntimer(120)
    }
}
if (global.myfight == 3)
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (acting == true && actcon == 0)
    {
        actcon = 1
        msgset(0, "")
        scr_battletext_default()
    }
    if (acting == 2 && actcon == 0)
    {
        actcon = 1
        if (global.automiss[myself] == false)
        {
            msgset(0, "")
            global.monstercomment[myself] = ""
            global.automiss[myself] = true
        }
        scr_battletext_default()
    }
    if (acting == 3 && actcon == 0)
    {
        msgset(0, "")
        scr_mercyadd(myself, 100)
        scr_battletext_default()
        actcon = 1
    }
    if (acting == 4 && actcon == 0)
    {
        msgset(0, "")
        if (simultotal == 1)
            msgset(0, "")
        scr_mercyadd(myself, 35)
        scr_simultext("kris")
        if (simulorderkri == 0)
            actcon = 20
        else
            actcon = -1
    }
    if (acting == 5 && actcon == 0)
    {
        msgset(0, "")
        scr_battletext_default()
        actcon = 1
    }
    if (acting == 6 && actcon == 0)
    {
        msgset(0, "")
        scr_monster_make_tired(myself)
        scr_battletext_default()
        actcon = 1
    }
    if (actingsus == true && actconsus == 1)
    {
        msgset(0, "")
        scr_mercyadd(myself, 35)
        scr_battletext_default()
        actcon = 1
        actconsus = 0
    }
    if (actingsus == 2 && actconsus == 1)
    {
        msgset(0, "")
        scr_mercyadd(myself, 35)
        scr_simultext("susie")
        if (simulordersus == 0)
            actconsus = 20
        else
            actconsus = 0
    }
    if (actingral == true && actconral == 1)
    {
        msgset(0, "")
        scr_mercyadd(myself, 35)
        scr_battletext_default()
        actcon = 1
        actconral = 0
    }
    if (actingral == 2 && actconral == 1)
    {
        msgset(0, "")
        scr_mercyadd(myself, 35)
        scr_simultext("ralsei")
        if (simulorderral == 0)
            actconral = 20
        else
            actconral = 0
    }
    if (actcon == 20 || actconsus == 20 || actconral == 20)
    {
        if scr_terminate_writer()
        {
            actconsus = -1
            actconral = -1
            actcon = 1
        }
    }
    if (actcon == 1 && (!instance_exists(obj_writer)))
        scr_nextact()
}
