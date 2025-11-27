var _cx = camerax();
var _cy = cameray();
if (init)
{
    draw_set_font(fnt_dotumche);
    if (x == -1 && y == -1)
    {
        setxy(_cx + 320, _cy + 430);
        if (quiz)
            y = _cy + 420;
        if (speaker == "ralsei" || speaker == "Ralsei" || speaker == "ra" || speaker == "r" || speaker == 2)
        {
            if (quiz)
            {
                x = _cx + 400;
            }
            else
            {
                x = _cx + 362;
                y = _cy + 350 + 4;
            }
        }
        if (speaker == "susie" || speaker == "Susie" || speaker == "su" || speaker == "s" || speaker == 1)
        {
            if (quiz)
            {
                x = _cx + 100;
            }
            else
            {
                x = _cx + 164;
                y = _cy + 350 + 4;
            }
        }
        if (speaker == "tenna")
        {
            if (quiz)
                x = _cx + 540;
            else
                x = _cx + 474 + 8;
            if (quiz)
            {
            }
            else
            {
                y = _cy + 310;
                var count = instance_number(object_index);
                if (count > 1)
                {
                    var doadjust = false;
                    with (object_index)
                    {
                        if (speaker == "ralsei" || speaker == "Ralsei" || speaker == "ra" || speaker == "r" || speaker == 2)
                            doadjust = true;
                    }
                    if (doadjust)
                        y -= 16;
                }
            }
        }
    }
    timer++;
    if (specialtalk == 0)
    {
        if (timer % talkrate && timer < talklength)
        {
            if (mysnd != 0)
                snd_play(mysnd);
        }
    }
    if (specialtalk == 1)
    {
        if (timer % talkrate && timer < talklength)
        {
            var rand = irandom(8) + 1;
            var pitchrandom = 0.86 + random(0.35);
            var soundindex = "snd_tv_voice_short";
            if (rand >= 2)
                soundindex += ("_" + string(rand));
            soundindex = asset_get_index(soundindex);
            audio_stop_sound(snd_tv_voice_short);
            audio_stop_sound(snd_tv_voice_short_2);
            audio_stop_sound(snd_tv_voice_short_3);
            audio_stop_sound(snd_tv_voice_short_4);
            audio_stop_sound(snd_tv_voice_short_5);
            audio_stop_sound(snd_tv_voice_short_6);
            audio_stop_sound(snd_tv_voice_short_7);
            audio_stop_sound(snd_tv_voice_short_8);
            audio_stop_sound(snd_tv_voice_short_9);
            audio_stop_sound(snd_tv_voice_short_10);
            snd_play_x(soundindex, 0.7, pitchrandom);
        }
    }
    if (timer >= drawtime)
        myalpha = lerp(myalpha, -0.1, 0.2);
    if (myalpha <= 0)
        instance_destroy();
    if (mode == 0)
    {
    }
    if (mode == 1)
    {
    }
    if (mode == 2)
    {
        if (global.lang == "ja")
            draw_set_font(fnt_ja_dotumche);
        else
            draw_set_font(fnt_dotumche);
        truetext = string_hash_to_newline(mystring);
        bubblewidth = round(string_width(truetext) / 2) + bubblepadding;
        bubbleheight = round(string_height(truetext) / 2) + bubblepadding;
        if (autowrap == 1)
        {
            truetext = mystring;
            bubblewidth = min(string_width(truetext) / 2, autowraplength / 2) + bubblepadding;
            linecount = round(string_width(mystring) / autowraplength);
            bubbleheight = (linecount * (separation / 2)) + bubblepadding + 8;
            bubbleheight = max(bubbleheight, 8);
        }
        draw_set_color(outlineColor);
        draw_circle(x - bubblewidth, y - bubbleheight, 8 + outlineThickness, 0);
        draw_circle(x + bubblewidth, y - bubbleheight, 8 + outlineThickness, 0);
        draw_circle(x - bubblewidth, y + bubbleheight, 8 + outlineThickness, 0);
        draw_circle(x + bubblewidth, y + bubbleheight, 8 + outlineThickness, 0);
        ossafe_fill_rectangle(x - bubblewidth, y - bubbleheight - 8 - outlineThickness, x + bubblewidth, y + bubbleheight + 8 + outlineThickness);
        ossafe_fill_rectangle(x - bubblewidth - 8 - outlineThickness, y - bubbleheight, x + bubblewidth + 8 + outlineThickness, y + bubbleheight);
        if (quiz == false)
        {
            draw_line_width(x + 10 + outlineThickness, y + bubbleheight, x, y + bubbleheight + 20 + outlineThickness, outlineThickness);
            draw_line_width(x - 10 - outlineThickness, y + bubbleheight, x, y + bubbleheight + 20 + outlineThickness, outlineThickness);
        }
        if (quiz == true)
        {
            draw_line_width(x + 10 + outlineThickness, y - bubbleheight, x, y - bubbleheight - 20 - outlineThickness, outlineThickness);
            draw_line_width(x - 10 - outlineThickness, y - bubbleheight, x, y - bubbleheight - 20 - outlineThickness, outlineThickness);
        }
        draw_set_color(textbubbleColor);
        draw_circle(x - bubblewidth, y - bubbleheight, 8, 0);
        draw_circle(x + bubblewidth, y - bubbleheight, 8, 0);
        draw_circle(x - bubblewidth, y + bubbleheight, 8, 0);
        draw_circle(x + bubblewidth, y + bubbleheight, 8, 0);
        ossafe_fill_rectangle(x - bubblewidth, y - bubbleheight - 8, x + bubblewidth, y + bubbleheight + 8);
        ossafe_fill_rectangle(x - bubblewidth - 8, y - bubbleheight, x + bubblewidth + 8, y + bubbleheight);
        if (quiz == false)
            draw_triangle(x + 10, y + bubbleheight, x - 10, y + bubbleheight, x, y + bubbleheight + 20, 0);
        if (quiz == true)
            draw_triangle(x + 10, y - bubbleheight, x - 10, y - bubbleheight, x, y - bubbleheight - 20, 0);
        draw_set_color(c_white);
        if (forceTraditionalWriter)
        {
            if (tradwriter == 0)
            {
                tradwriter = instance_create((x - bubblewidth) + 2, y - bubbleheight - 2, obj_writer);
                with (tradwriter)
                {
                    scr_speaker("silent");
                    myfont = scr_84_get_font("dotumche");
                    skippable = 0;
                    rate = 1;
                    mycolor = c_black;
                    mystring = other.mystring;
                    hspace = 9;
                    vspace = 16;
                    special = 5;
                    formattext = false;
                    charline = 22;
                    skipme = 1;
                    shadcolor = #13D26F;
                }
            }
        }
        if (!forceTraditionalWriter)
        {
            if (dropshadow == false)
            {
                draw_set_color(mycolor);
                if (textColor == textbubbleColor)
                    textColor = 0;
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                if (autowrap == 1)
                    draw_text_ext(x, y, truetext, separation, autowraplength);
                else
                    draw_text(x, y, truetext);
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
            }
            else
            {
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                draw_set_color(mycolor);
                draw_set_alpha(0.25);
                if (autowrap == 1)
                {
                    draw_text_ext(x, y + 1, truetext, separation, autowraplength);
                    draw_text_ext(x + 1, y, truetext, separation, autowraplength);
                    draw_text_ext(x + 1, y + 1, truetext, separation, autowraplength);
                    draw_set_alpha(1);
                    draw_set_color(c_black);
                    draw_text_ext(x, y, truetext, separation, autowraplength);
                }
                else
                {
                    draw_text(x, y + 1, truetext);
                    draw_text(x + 1, y, truetext);
                    draw_text(x + 1, y + 1, truetext);
                    draw_set_alpha(1);
                    draw_set_color(c_black);
                    draw_text(x, y, truetext);
                }
                draw_set_halign(fa_left);
                draw_set_valign(fa_top);
            }
        }
    }
    draw_set_alpha(1);
}
draw_set_color(c_white);
