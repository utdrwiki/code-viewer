if (start_speech)
{
    speech_delay_timer--;
    if (speech_delay_timer <= 0)
    {
        start_speech = false;
        speech_active = true;
        show_text = true;
    }
}
if (speech_active)
{
    if (i_ex(obj_writer))
    {
        var text_finished = false;
        with (obj_writer)
            text_finished = reachedend;
        if (text_finished && show_text_timer <= 0)
        {
            show_text_timer = 75;
            fade_bubble = true;
        }
    }
    else
    {
        if (stop_speech)
            exit;
        show_text_timer--;
        if (show_text_timer <= 0)
        {
            if (speech_index >= array_length(speech))
            {
                speech_active = false;
                exit;
            }
            draw_set_font(scr_84_get_font("dotumche"));
            snd_play(spr_kris_phone_message);
            bg_base_alpha = 0;
            current_text = speech[speech_index];
            global.msg[0] = current_text;
            start_pos_x = 14;
            start_pos_y = cameray() + 162;
            var text_height = string_height(current_text) * 0.25;
            var text_width = ((string_width(current_text) / 2) + 20) * 0.75;
            var bubble = instance_create((start_pos_x - (text_width / 2)) + 20, start_pos_y, obj_text_spikeballoon);
            bubble.y = start_pos_y;
            bubble.tailx = start_pos_x + 35;
            bubble.taily = start_pos_y - 30;
            bubble.w = (string_width(current_text) / 2) + 20;
            bubble.depth = 90;
            global.typer = 81;
            writer = instance_create((start_pos_x - (text_width / 2)) + 20, (start_pos_y - text_height) + 4, obj_writer);
            writer.shake = 0.75;
            writer.rate = 4;
            writer.textscale = 0.5;
            writer.hspace = 5;
            writer.vspace = 9;
            writer.fadeonend = 0.02;
            writer.depth = bubble.depth - 10;
            with (writer)
                skippable = 0;
            speech_index++;
        }
    }
}
if (stop_speech)
{
    if (!i_ex(obj_writer))
    {
        stop_speech = false;
        instance_destroy();
    }
}
if (fade_bubble)
{
    fade_bubble_timer++;
    if (fade_bubble_timer == 10)
    {
        with (obj_text_spikeballoon)
            scr_lerpvar("image_alpha", 0.7, 0, 60);
    }
    if (fade_bubble_timer == 70)
    {
        fade_bubble = false;
        fade_bubble_timer = 0;
        with (obj_text_spikeballoon)
            instance_destroy();
    }
}
