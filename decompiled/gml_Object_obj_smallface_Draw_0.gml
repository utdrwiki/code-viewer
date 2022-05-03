if (global.darkzone == true)
{
    if (facealpha < 1)
        facealpha += 0.2
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, facealpha)
    draw_set_alpha(facealpha)
    if (type == 0 || type == 3)
    {
        scr_84_set_draw_font("main")
        draw_set_color(mycolor)
        draw_text((x + 70), (y + 10), string_hash_to_newline(mystring))
    }
    if (type == 1 && active == true && getrid == 0)
    {
        scr_84_set_draw_font("main")
        draw_set_color(mycolor)
        draw_text((x + 70), (y + 15), string_hash_to_newline(mystring))
        finished = true
    }
    if (type == 2 || type == 4)
    {
        if (active == true)
        {
            scr_84_set_draw_font("main")
            draw_set_color(mycolor)
            if (finished == false)
            {
                partstring += string_char_at(mystring, part)
                part += 1
                if (part >= (string_length(mystring) + 1))
                    finished = true
            }
            draw_text(((x + 70) + random(1)), ((y + 15) + random(1)), string_hash_to_newline(partstring))
        }
    }
    if i_ex(writergod)
    {
        if (finished == true && getrid == 0)
            finished = 2
    }
    else
        instance_destroy()
    if (getrid == 1)
    {
        direction = (-nowdir)
        speed += 2
        if (type == 3 || type == 4)
            instance_destroy()
    }
    draw_set_alpha(1)
}
