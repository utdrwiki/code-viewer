aww = 0;
minigame = 0;
lastmike = 0;
console_desc = stringsetloc("Talk to MAUS to\nplay various\nMIKE MINIGAMES!", "obj_mike_minigame_tv_slash_Create_0_gml_9_0");
var _i = 0;
desc[_i++] = stringsetloc("Use the MAUS to\nput MIKE in the\nMIKE SLOT!", "obj_mike_minigame_tv_slash_Create_0_gml_10_0");
if (os_type == os_psvita)
{
    desc[_i++] = stringsetloc("Bring the cats to the basket,\nand don't touch the rain!\nTwo cats = POINT BONUS!", "obj_mike_minigame_tv_slash_Create_0_gml_16_0");
    desc[_i++] = stringsetloc("Block the hairballs for as\nlong as possible!", "obj_mike_minigame_tv_slash_Create_0_gml_17_0");
    desc[_i++] = stringsetloc("Match the poses in time!\nCLICK&HOLD to extend arms!", "obj_mike_minigame_tv_slash_Create_0_gml_18_0");
    _i = 1;
    name[_i++] = stringsetloc("PLUEY", "obj_mike_minigame_tv_slash_Create_0_gml_22_0");
    name[_i++] = stringsetloc("AIR WAVES", "obj_mike_minigame_tv_slash_Create_0_gml_23_0");
    name[_i++] = stringsetloc("MAIN PERFORMANCE", "obj_mike_minigame_tv_slash_Create_0_gml_24_0");
}
else
{
    desc[_i++] = stringsetloc("Avoid BATTAT and get CATS\nwith MAUS. VOL&SPEED makes\nBLUECAT, combine for RARECATS!\nCONTROLS: MAUS & VOL.", "obj_mike_minigame_tv_slash_Create_0_gml_28_0");
    desc[_i++] = stringsetloc("JONGLE cats into the HOOP.\nO, Your voice CONTROLS GRAVITY.\nCOMBO with simultaneous cats!\nCONTROLS: MAUS & VOL.", "obj_mike_minigame_tv_slash_Create_0_gml_29_0");
    desc[_i++] = stringsetloc("Put on your shoe, hey, and\nsprint! It's raining cats&cats!\nBring chosen ones to the ARK!\nCONTROLS: MAUS ONLY.", "obj_mike_minigame_tv_slash_Create_0_gml_30_0");
    _i = 1;
    name[_i++] = stringsetloc("BATTAT", "obj_mike_minigame_tv_slash_Create_0_gml_33_0");
    name[_i++] = stringsetloc("JONGLER", "obj_mike_minigame_tv_slash_Create_0_gml_34_0");
    name[_i++] = stringsetloc("PLUEY", "obj_mike_minigame_tv_slash_Create_0_gml_35_0");
}
_i = 0;
latestscore[_i++] = 0;
latestscore[_i++] = 0;
latestscore[_i++] = 0;
latestscore[_i++] = 0;
_i = 0;
hiscore[_i++] = 0;
hiscore[_i++] = global.flag[1698];
hiscore[_i++] = global.flag[1699];
hiscore[_i++] = global.flag[1700];
bronze_score[1] = 1000;
silver_score[1] = 4000;
gold_score[1] = 8000;
platinum_score[1] = 16000;
bronze_score[2] = 500;
silver_score[2] = 1200;
gold_score[2] = 2000;
platinum_score[2] = 3000;
bronze_score[3] = 100;
silver_score[3] = 300;
gold_score[3] = 500;
platinum_score[3] = 700;
bronze_score[0] = 0;
silver_score[0] = 0;
gold_score[0] = 0;
platinum_score[0] = 0;
