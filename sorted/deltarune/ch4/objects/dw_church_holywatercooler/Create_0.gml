layer_set_visible("Debug_Assets", 0);
layer_set_visible("Tiles_ShortcutUnlock", false);
if (scr_debug())
    scr_setparty(1, 1);
npc = scr_makenpc("Debug_Assets", "dspr_cupnpc1");
npc2 = scr_makenpc("Debug_Assets", "dspr_cupnpc2");
npc3 = scr_makenpc("Debug_Assets", "dspr_cupnpc3");
npc4 = scr_makenpc("Debug_Assets", "dspr_basin");
init = 0;
encounterno = 153;
encounterflag = 899;
basintalk = 0;
watermarker = -4;
watercoolerfight = 0;
if (global.flag[encounterflag] != 0)
    watercoolerfight = -999;
hintinit = 0;
scr_musicer("climb.ogg");
slidecon = 0;
slidetimer = 0;
fade = -4;
