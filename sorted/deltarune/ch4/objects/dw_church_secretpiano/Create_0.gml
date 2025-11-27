if (scr_debug())
    scr_setparty(1, 1);
layer_set_visible("DEBUG_ASSETS", 0);
init = 0;
con = 0;
customcon = 0;
init = 0;
blackall = -4;
pianosolved = global.flag[1547];
if (pianosolved)
{
    con = -1;
    with (obj_church_secretpiano_playable)
        solved = 1;
}
make = [false, false, false];
make[0] = abs(global.flag[899]);
if (global.flag[1502] >= 2)
    make[1] = true;
if (global.flag[1519] != 0)
    make[2] = true;
hint = [-4, -4, -4];
var yloc = 70;
var xloc = 200;
var sinamt = 30;
if (make[0])
{
    hint[0] = instance_create(xloc, yloc, obj_church_piano_hint);
    with (hint[0])
    {
        hint = scr_secretpianocombo(0);
        hintno = 0;
        preinit = 1;
        siner = 1 * sinamt;
        hintcol = #FFC77B;
    }
}
if (make[1])
{
    hint[1] = instance_create(320, yloc, obj_church_piano_hint);
    with (hint[1])
    {
        hint = scr_secretpianocombo(1);
        hintno = 1;
        hintslots = 4;
        preinit = 1;
        siner = 2 * sinamt;
        hintcol = #FFC77B;
    }
}
if (make[2])
{
    hint[2] = instance_create(640 - xloc, yloc, obj_church_piano_hint);
    with (hint[2])
    {
        hint = scr_secretpianocombo(2);
        hintno = 3;
        preinit = 1;
        siner = 3 * sinamt;
        hintcol = #FFC77B;
    }
}
destroyinit = 1;
if (global.plot >= 242)
    destroyinit = 0;
encounterno = 154;
encounterflag = 1794;
plaque = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4109)
    {
        plaque = scr_makenpc_fromasset(spritesArray[i]);
        plaque.issolid = false;
        if (global.plot >= 242)
            plaque.x = room_width * 4;
    }
}
