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
speech = [""];
current_index = 0;
current_text = speech[current_index];
speech_time = 60;
speech_xscale = 0;
speech_yscale = 0;
speech_alpha = 1;
speech_xpos = 200;
speech_base_ypos = 175;
speech_ypos = 175;
start_speech = false;
stop_speech = false;
depth = 400;
