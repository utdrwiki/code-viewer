if (global.plot < 63)
{
    instance_destroy();
    exit;
}
else if (global.plot == 63)
{
    if (scr_sideb_active())
    {
        instance_destroy();
        exit;
    }
}
phone_marker = scr_marker(200, 157, spr_noellehouse_kitchen_phone);
with (phone_marker)
    depth = 98000;
if (scr_flag_get(737) >= 1)
{
    instance_destroy();
    exit;
}
for (i = 0; i < 20; i += 1)
{
    prevalpha[i] = 0;
    prevwx[i] = -200;
    prevwy[i] = -200;
    prevstringmax[i] = 0;
    prevhspace[i] = 0;
    prevlinecount[i] = 0;
    prevvspace[i] = 0;
}
con = 0;
dhaver = 0;
v = 0;
vx = 0;
vy = 0;
myd = -4;
writer = -4;
speech[0] = stringsetloc("... dark...\nfountain...\nnext...", "obj_homealone_kitchen_phone_slash_Create_0_gml_49_0");
speech[1] = stringsetloc("\\cR... Susie...\nmust not get...\nguitar...\\cW", "obj_homealone_kitchen_phone_slash_Create_0_gml_50_0");
speech[2] = stringsetloc("...\nneed...\nsoul...", "obj_homealone_kitchen_phone_slash_Create_0_gml_51_0");
speech[3] = stringsetloc("Without... soul...\nKris... will...", "obj_homealone_kitchen_phone_slash_Create_0_gml_52_0");
speech[4] = stringsetloc("\\cR... Susie...\nguitar...\ncode... stop...\\cW", "obj_homealone_kitchen_phone_slash_Create_0_gml_53_0");
speech[5] = stringsetloc("... police...\nsacrifice...\nnext week...", "obj_homealone_kitchen_phone_slash_Create_0_gml_54_0");
speech[6] = stringsetloc("... church...\ntonight...", "obj_homealone_kitchen_phone_slash_Create_0_gml_55_0");
speech[7] = stringsetloc("... Kris...\ndark world...\nno soul... can't...", "obj_homealone_kitchen_phone_slash_Create_0_gml_56_0");
speech[8] = stringsetloc("......\n......\n......", "obj_homealone_kitchen_phone_slash_Create_0_gml_57_0");
speech_index = (scr_flag_get(736) >= 1) ? (scr_flag_get(736) + 1) : 0;
bg_base_alpha = 0;
speech_active = false;
show_text = false;
show_text_timer = 0;
current_index = 0;
current_text = speech[current_index];
speech_time = 30;
speech_xscale = 0;
speech_yscale = 0;
speech_alpha = 1;
speech_xpos = phone_marker.x + 40;
speech_base_ypos = phone_marker.y + 40;
speech_ypos = phone_marker.y;
speech_delay_timer = 90;
start_speech = speech_index < array_length_1d(speech);
stop_speech = false;
style = 0;
text_color = (style == 0) ? c_white : c_red;
fade_bubble = false;
fade_bubble_timer = 0;
depth = 4000;
