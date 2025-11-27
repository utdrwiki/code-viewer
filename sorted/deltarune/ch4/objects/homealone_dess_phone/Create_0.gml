phone_marker = scr_marker(200, 100, spr_noellehouse_kitchen_phone);
with (phone_marker)
{
    depth = 98000;
    visible = 0;
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
speech[0] = stringsetloc("...\nSusie...\nguitar...?", "obj_homealone_dess_phone_slash_Create_0_gml_34_0");
speech[1] = stringsetloc("...\nI'll be...\nright there...", "obj_homealone_dess_phone_slash_Create_0_gml_35_0");
speech_index = 0;
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
start_speech = false;
stop_speech = false;
style = 0;
text_color = (style == 0) ? c_white : c_red;
fade_bubble = false;
fade_bubble_timer = 0;
depth = 4000;
