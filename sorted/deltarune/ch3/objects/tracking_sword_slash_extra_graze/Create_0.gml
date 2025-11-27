timer = 0;
con = 0;
image_xscale = 900;
image_yscale = 7;
image_blend = c_red;
visible = false;
grazetpfactor = 1;
grazetimefactor = 1;
grazesizefactor = 1;
grazecount = 0;
grazetpfactor += (scr_armorcheck_equipped_party(15) * 0.1);
grazetpfactor += (scr_armorcheck_equipped_party(24) * 0.05);
grazetimefactor += (scr_armorcheck_equipped_party(14) * 0.1);
if (grazetimefactor > 3)
    grazetimefactor = 3;
if (grazetpfactor > 3)
    grazetpfactor = 3;
