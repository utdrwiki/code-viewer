timer = 0;
con = 0;
init = 0;
easyproof = false;
movespeed = 15;
acttimer = 0;
acttimermax = 200;
str1 = "1";
str2 = "2";
str3 = "3";
rand = irandom_range(1, 9);
rand2 = choose(1, 2);
currentchoice = 1;
correctchoice = choose(1, 2, 3);
creatorid = -1;
highlightindex = 0;
endtimer = 0;
dottedlinecolor1 = 255;
dottedlinecolor2 = 16777215;
colortimer = 0;
var _str1, _str2, _str3;
if (rand == 1)
{
    _str1 = stringsetloc("GALLERY", "obj_proofread_controller_new_slash_Create_0_gml_29_0");
    _str2 = stringsetloc("GALLURY", "obj_proofread_controller_new_slash_Create_0_gml_30_0");
    _str3 = stringsetloc("GALLORY", "obj_proofread_controller_new_slash_Create_0_gml_31_0");
}
if (rand == 2)
{
    _str1 = stringsetloc("ROOTS", "obj_proofread_controller_new_slash_Create_0_gml_36_0");
    _str2 = stringsetloc("REETS", "obj_proofread_controller_new_slash_Create_0_gml_37_0");
    _str3 = stringsetloc("RAATS", "obj_proofread_controller_new_slash_Create_0_gml_38_0");
}
if (rand == 3)
{
    _str1 = stringsetloc("FESTIVAL", "obj_proofread_controller_new_slash_Create_0_gml_43_0");
    _str2 = stringsetloc("FESTIAVL", "obj_proofread_controller_new_slash_Create_0_gml_44_0");
    _str3 = stringsetloc("FESTAVIL", "obj_proofread_controller_new_slash_Create_0_gml_45_0");
}
if (rand == 4)
{
    _str1 = stringsetloc("FLASHBACK", "obj_proofread_controller_new_slash_Create_0_gml_50_0");
    _str2 = stringsetloc("FLESHBECK", "obj_proofread_controller_new_slash_Create_0_gml_51_0");
    _str3 = stringsetloc("FLOSHBOCK", "obj_proofread_controller_new_slash_Create_0_gml_52_0");
}
if (rand == 5)
{
    _str1 = stringsetloc("SWORD", "obj_proofread_controller_new_slash_Create_0_gml_57_0");
    _str2 = stringsetloc("SORWD", "obj_proofread_controller_new_slash_Create_0_gml_58_0");
    _str3 = stringsetloc("SOWRD", "obj_proofread_controller_new_slash_Create_0_gml_59_0");
}
if (rand == 6)
{
    _str1 = stringsetloc("GUARDIAN", "obj_proofread_controller_new_slash_Create_0_gml_64_0");
    _str2 = stringsetloc("GAURDIAN", "obj_proofread_controller_new_slash_Create_0_gml_65_0");
    _str3 = stringsetloc("GAURDAIN", "obj_proofread_controller_new_slash_Create_0_gml_66_0");
}
if (rand == 7)
{
    _str1 = stringsetloc("ATRIUM", "obj_proofread_controller_new_slash_Create_0_gml_71_0");
    _str2 = stringsetloc("ATRUIM", "obj_proofread_controller_new_slash_Create_0_gml_72_0");
    _str3 = stringsetloc("ARTIUM", "obj_proofread_controller_new_slash_Create_0_gml_73_0");
}
if (rand == 8)
{
    _str1 = stringsetloc("SYNTHESIS", "obj_proofread_controller_new_slash_Create_0_gml_78_0");
    _str2 = stringsetloc("SYNTEHSIS", "obj_proofread_controller_new_slash_Create_0_gml_79_0");
    _str3 = stringsetloc("SINTHESIS", "obj_proofread_controller_new_slash_Create_0_gml_80_0");
}
if (rand == 9)
{
    _str1 = stringsetloc("AMPHITHEATER", "obj_proofread_controller_new_slash_Create_0_gml_85_0");
    _str2 = stringsetloc("AMPITHEATER", "obj_proofread_controller_new_slash_Create_0_gml_86_0");
    _str3 = stringsetloc("AMPITHEATRE", "obj_proofread_controller_new_slash_Create_0_gml_87_0");
}
if (correctchoice == 1)
{
    str1 = _str1;
    if (rand2 == 1)
    {
        str2 = _str2;
        str3 = _str3;
    }
    if (rand2 == 2)
    {
        str2 = _str3;
        str3 = _str2;
    }
}
if (correctchoice == 2)
{
    str2 = _str1;
    if (rand2 == 1)
    {
        str1 = _str2;
        str3 = _str3;
    }
    if (rand2 == 2)
    {
        str1 = _str3;
        str3 = _str2;
    }
}
if (correctchoice == 3)
{
    str3 = _str1;
    if (rand2 == 1)
    {
        str2 = _str2;
        str1 = _str3;
    }
    if (rand2 == 2)
    {
        str2 = _str3;
        str1 = _str2;
    }
}
