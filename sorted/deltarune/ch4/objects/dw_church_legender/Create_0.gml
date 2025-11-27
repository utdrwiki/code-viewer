siner = 0;
timer = 0;
activetimer = 0;
image_alpha = 0;
relx = 20;
rely = 20;
show = false;
charspace = 15;
triggertype = 0;
startingx = 280;
endingx = 600;
c_darkblue = hexcolor(#4A1F18);
stringmax = 10;
maxlines = 10;
image_only = false;
for (var i = 0; i < stringmax; i++)
{
    textstring[i] = "nothing";
    textchar[i] = 0;
    textx[i] = 0;
    texty[i] = 0;
    textstartwait[i] = 1;
    textendwait[i] = 0;
    textrate[i] = 2;
    texttimer[i] = 0;
    textactivetimer[i] = 0;
}
prophecy_index = 0;
line_index = 0;
prophecy_text[0][0] = [stringsetloc("IT STARTED ONCE UPON A TIME", "obj_dw_church_legender_slash_Create_0_gml_37_0"), stringsetloc("A LEGEND SPOKE IN SHADOWD RHYME", "obj_dw_church_legender_slash_Create_0_gml_37_1")];
prophecy_text[0][1] = [stringsetloc("OF LIGHT AND DARK AND LOVE AND HATE", "obj_dw_church_legender_slash_Create_0_gml_38_0"), stringsetloc("THE HOPES AND DREAMS THAT GOVERN FATE", "obj_dw_church_legender_slash_Create_0_gml_38_1")];
prophecy_text[0][2] = [stringsetloc("THIS WAS THE LEGEND OF <DELTARUNE.>", "obj_dw_church_legender_slash_Create_0_gml_39_0")];
prophecy_text[1][0] = [stringsetloc("A WORLD BASKED IN PUREST LIGHT.", "obj_dw_church_legender_slash_Create_0_gml_41_0"), stringsetloc("BENEATH IT, GREW ETERNAL NIGHT.", "obj_dw_church_legender_slash_Create_0_gml_41_1")];
prophecy_text[2][0] = [stringsetloc("THE FOUNTAINS FREED,", "obj_dw_church_legender_slash_Create_0_gml_43_0"), stringsetloc("THE ROARING CRIES.", "obj_dw_church_legender_slash_Create_0_gml_43_1")];
prophecy_text[2][1] = [stringsetloc("THE TITANS SHAPE", "obj_dw_church_legender_slash_Create_0_gml_44_0"), stringsetloc("FROM DARKENED EYES.", "obj_dw_church_legender_slash_Create_0_gml_44_1")];
prophecy_text[3][0] = [stringsetloc("THE LIGHT AND DARK,", "obj_dw_church_legender_slash_Create_0_gml_46_0"), stringsetloc("BOTH BURNING DIRE.", "obj_dw_church_legender_slash_Create_0_gml_46_1")];
prophecy_text[3][1] = [stringsetloc("A COUNTDOWN TO", "obj_dw_church_legender_slash_Create_0_gml_47_0"), stringsetloc("THE EARTH'S EXPIRE.", "obj_dw_church_legender_slash_Create_0_gml_47_1")];
prophecy_text[4][0] = [stringsetloc("BUT LO, ON HOPES AND DREAMS THEY SEND.", "obj_dw_church_legender_slash_Create_0_gml_49_0")];
prophecy_text[4][1] = [stringsetloc("THREE HEROES AT THE WORLD'S END.", "obj_dw_church_legender_slash_Create_0_gml_50_0")];
prophecy_text[5][0] = [stringsetloc("THE GIRL,", "obj_dw_church_legender_slash_Create_0_gml_52_0"), stringsetloc("WITH HOPE CROSSED ON HER HEART.", "obj_dw_church_legender_slash_Create_0_gml_52_1")];
prophecy_text[5][1] = [stringsetloc("THE PRINCE,", "obj_dw_church_legender_slash_Create_0_gml_53_0"), stringsetloc("ALONE IN DEEPEST DARK.", "obj_dw_church_legender_slash_Create_0_gml_53_1")];
prophecy_text[5][2] = [stringsetloc("THE CAGE,", "obj_dw_church_legender_slash_Create_0_gml_54_0"), stringsetloc("WITH HUMAN SOUL AND PARTS.", "obj_dw_church_legender_slash_Create_0_gml_54_1")];
prophecy_text[6][0] = [stringsetloc("THE POINTY-HEADED ONE WILL SAY", "obj_dw_church_legender_slash_Create_0_gml_56_0"), stringsetloc("\"TOOTHPASTE\", AND THEN  \"BOY.\"", "obj_dw_church_legender_slash_Create_0_gml_56_1")];
set_lines = false;
alt_sides = false;
if (room == room_dw_church_intro_guei)
{
    prophecy_index = 0;
    triggertype = 1;
    depth = 999000;
    rely = 200;
    relx = 100;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = -40;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 90);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_intro3)
{
    prophecy_index = 1;
    triggertype = 1;
    depth = 999000;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = 40;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 60);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_lantern_hallway)
{
    prophecy_index = 2;
    triggertype = 1;
    depth = 999000;
    alt_sides = true;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = 0;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 60);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_stairs_topleft)
{
    prophecy_index = (scr_flag_get(795) == 0) ? 3 : 4;
    if (prophecy_index == 3)
        scr_flag_set(795, 1);
    triggertype = 1;
    depth = 999000;
    relx = 200;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = 40;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 60);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_stairs_topright)
{
    prophecy_index = (scr_flag_get(795) == 0) ? 3 : 4;
    if (prophecy_index == 3)
        scr_flag_set(795, 2);
    triggertype = 1;
    depth = 999000;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = 0;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 60);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_stairs_west_bell)
{
    prophecy_index = 5;
    triggertype = 1;
    depth = 999000;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = 0;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 60);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_minorlegend)
{
    prophecy_index = 6;
    triggertype = 1;
    depth = 999000;
    relx = 210;
    rely = 90;
    maxlines = array_length_1d(prophecy_text[prophecy_index]);
    stringmax = array_length_1d(prophecy_text[prophecy_index][line_index]);
    for (var i = 0; i < stringmax; i++)
    {
        textstring[i] = prophecy_text[prophecy_index][line_index][i];
        textx[i] = -120;
        texty[i] = 40 + (i * 40);
        textstartwait[i] = 1 + (i * 60);
        textendwait[i] = 90;
    }
}
if (room == room_dw_church_savepoint)
{
    image_only = true;
    triggertype = 1;
    depth = 999000;
    relx = 240;
    rely = 60;
}
xx = camerax() + relx;
yy = cameray() + rely;
