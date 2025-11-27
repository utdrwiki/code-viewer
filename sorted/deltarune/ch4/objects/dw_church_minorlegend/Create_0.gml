roomglow = instance_create(0, 0, obj_roomglow);
prophecy = instance_create(x, y, obj_dw_church_prophecy);
prophecy.extflag = "joke1";
layer_set_visible("debug_assets", 0);
if (scr_debug())
    scr_setparty(1, 1);
npc = scr_makenpc("debug_assets", "dspr_wafernpc");
init = 0;
