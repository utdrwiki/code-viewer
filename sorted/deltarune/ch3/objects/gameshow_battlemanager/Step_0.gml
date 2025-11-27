if (con == 0)
{
    with (obj_mainchara_board)
        array_push(other.remmove, [name, canfreemove]);
    with (obj_mainchara_board)
        canfreemove = false;
    scr_lerpvar_instance(couch, "y", couch.y, couch.y + 300, lerptime, 2, "in");
    scr_lerpvar_instance(console, "y", console.y, console.y + 300, lerptime, 2, "in");
    scr_lerpvar_instance(wires, "y", wires.y, wires.y + 300, lerptime, 2, "in");
    scr_lerpvar_instance(plpo, "y", plpo.y, plpo.y + 300, lerptime, 2, "in");
    scr_lerpvar_instance(console, "image_alpha", 1, 0, 5);
    scr_lerpvar_instance(wires, "image_alpha", 1, 0, 5);
    scr_lerpvar_instance(tenna, "x", tenna.x, tenna.x + (downdist * 4), lerptime, 2, "in");
    con = 1;
}
if (con == 1)
{
    timer++;
    if (timer >= lerptime)
    {
        con = 2;
        timer = 0;
        with (obj_couchwriter)
            instance_destroy();
        battlesprite = sprite_create_from_surface(application_surface, 0, 0, 640, 480, 0, 0, 320, 240);
        marker = scr_marker(camerax() + 320, cameray() + 240, battlesprite);
        marker.depth = -20;
        global.flag[54] = encounterflag;
        scr_battle(encounterno, 0, 0, 0, 0);
        if (room == room_board_1)
        {
            if (global.flag[1011] == 1)
            {
            }
        }
        battleend = false;
    }
}
if (con == 2)
{
    obj_mainchara.cutscene = 1;
    timer++;
    if (timer == 7)
    {
        scr_lerpvar_instance(marker, "image_xscale", marker.image_xscale, 4, 10);
        scr_lerpvar_instance(marker, "image_yscale", marker.image_yscale, 4, 10);
        scr_lerpvar_instance(marker, "image_alpha", 1, 0, 10);
        scr_doom(marker, 10);
    }
    if (i_ex(obj_endbattle) && battleend == false)
    {
        battleend = true;
        lerptime = 25;
        if (i_ex(couch))
            scr_lerpvar_instance(couch, "y", couch.y, couch.y - 300, lerptime, 2, "out");
        if (i_ex(console))
            scr_lerpvar_instance(console, "y", console.y, console.y - 300, lerptime, 2, "out");
        if (i_ex(wires))
            scr_lerpvar_instance(wires, "y", wires.y, wires.y - 300, lerptime, 2, "out");
        if (i_ex(plpo))
            scr_lerpvar_instance(plpo, "y", plpo.y, plpo.y - 300, lerptime, 2, "out");
        if (i_ex(tenna))
            scr_lerpvar_instance(tenna, "x", tenna.x, tenna.x - (downdist * 4), lerptime, 2, "out");
        if (i_ex(console))
            scr_lerpvar_instance(console, "image_alpha", 0, 1, round((lerptime * 4) / 3));
        if (i_ex(wires))
            scr_lerpvar_instance(wires, "image_alpha", 0, 1, round((lerptime * 4) / 3));
    }
    if (timer > 5 && !i_ex(obj_battleback))
    {
        scr_resetgameshowcharacter("ralsei");
        scr_resetgameshowcharacter("susie");
        scr_resetgameshowcharacter("kris");
        timer = 0;
        if (global.boardbattleresult == "lost")
        {
            if (global.encounterno != 111 && global.encounterno != 113 && global.encounterno != 110)
            {
                if (room == room_board_1)
                {
                    global.battlegrade[global.flag[1049]] = "Z";
                    global.flag[1049]++;
                }
                if (room == room_board_2)
                {
                    global.battlegrade[10 + global.flag[1171]] = "Z";
                    global.flag[1171]++;
                }
            }
            instance_destroy();
        }
        else
        {
            con = 3;
        }
        scoreget = 0;
        hitcountbonus = 0;
        if (hitcount < 10)
            hitcountbonus = 50;
        if (hitcount < 5)
            hitcountbonus = 100;
        if (hitcount == 0)
            hitcountbonus = 200;
        tensionbonus = round((global.flag[49] / global.maxtension) * 50) + 150;
        tpgained = global.flag[49];
        timebonus = 0;
        if (battletime < 3600)
            timebonus = 25;
        if (battletime < 2700)
            timebonus = 50;
        if (battletime < 1800)
            timebonus = 100;
    }
}
if (global.fighting == true)
    battletime++;
if (con == 4)
{
    if (scoreget == 0)
    {
        scoreget = 1;
        var scoretoAdd = totalstring;
        scr_board_score(scoretoAdd);
        with (obj_mainchara_board)
            fun = 0;
        if (room == room_board_1)
        {
            global.battlegrade[global.flag[1049]] = lettergrade;
            global.flag[1049]++;
        }
        if (room == room_board_2)
        {
            global.battlegrade[10 + global.flag[1171]] = lettergrade;
            global.flag[1171]++;
        }
    }
    con = 5;
}
if (con == 5)
{
    kris.ignoredepth = 0;
    susie.ignoredepth = 0;
    ralsei.ignoredepth = 0;
    instance_destroy();
}
