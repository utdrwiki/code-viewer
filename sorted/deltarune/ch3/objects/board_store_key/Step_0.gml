if (active)
    buffer--;
scr_depth_board();
if (init == 0)
{
    init = 1;
    if (mytype == "lancer")
        sprite_index = spr_board_lancer_down;
}
if (kris == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "kris")
            other.kris = id;
    }
}
var metkris = 0;
if (active && mytype == "key")
{
    if (global.flag[1044] >= cost)
    {
        var player = collision_rectangle(x + 2, y + 2, (x + sprite_width) - 2, (y + sprite_height) - 2, obj_mainchara_board, false, true);
        if (i_ex(player))
        {
            if (player.controlled == true)
                metkris = 1;
        }
    }
}
var dobuy = 0;
if (myinteract == 3)
{
    if (global.flag[1044] >= cost)
    {
        if (mytype == "lancer")
        {
            if (cost == 999)
            {
                myinteract = 10;
            }
            else
            {
                dobuy = true;
                myinteract = 0;
            }
        }
        else
        {
            dobuy = true;
            myinteract = 0;
        }
    }
}
if (myinteract == 10)
{
    global.interact = 1;
    global.msc = -99;
    global.choice = -1;
    global.choicemsg[0] = stringsetloc("YES", "obj_board_store_key_slash_Step_0_gml_72_0");
    global.choicemsg[1] = stringsetloc("NO", "obj_board_store_key_slash_Step_0_gml_73_0");
    global.choicemsg[2] = stringset("");
    global.choicemsg[3] = stringset("");
    scr_speaker("Lancer");
    msgsetloc(0, "WOW^1! YOU'LL REALLY BUY ME FOR 999 POINTS!?/", "obj_board_store_key_slash_Step_0_gml_78_0");
    msgnext("\\C2 ");
    myinteract = 11;
    with (bw_make())
        stay = 1;
}
if (myinteract == 11 && global.choice != -1)
{
    with (obj_writer)
        instance_destroy();
    if (global.choice == 0)
    {
        scr_speaker("Lancer");
        msgsetloc(0, "IT COSTS A LOT TO RAISE A BOY!/%", "obj_board_store_key_slash_Step_0_gml_89_0");
        with (bw_make())
            skip = true;
        myinteract = 12;
    }
    if (global.choice == 1)
    {
        with (obj_board_writer)
            instance_destroy();
        global.interact = 0;
        myinteract = 0;
    }
}
if (myinteract == 12 && !bw_ex())
{
    myinteract = 13;
    dobuy = true;
}
if (dobuy)
{
    if (mytype == "lancer")
        global.flag[1048] = cost;
    scr_board_score(-cost);
    global.flag[1117] += cost;
    key = instance_create(x, y, obj_board_pickup);
    key.type = mytype;
    key.depth = 5000;
    key.image_alpha = 1;
    key.image_speed = 0;
    key.sprite_index = sprite_index;
    key.image_index = image_index;
    key.image_xscale = image_xscale;
    key.image_yscale = image_yscale;
    key.con = 3;
    key.override = 3;
    instance_destroy();
}
