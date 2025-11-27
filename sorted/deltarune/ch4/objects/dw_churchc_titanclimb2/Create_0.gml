con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
write_top = false;
monologue_writer = -4;
monologuecon = -1;
monowatch = 0;
monotime = 0;
monocon = 0;
scr_fadein(60);
susie_monologue = [[stringsetloc("* Hurry! Something is coming after us!/%", "obj_dw_churchc_titanclimb2_slash_Create_0_gml_30_0")], [stringsetloc("* Kris! Get over here!/%", "obj_dw_churchc_titanclimb2_slash_Create_0_gml_33_0")]];
