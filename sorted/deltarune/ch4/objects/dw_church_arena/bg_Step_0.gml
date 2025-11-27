if (image_alpha < 1 && con >= 0)
    image_alpha += 0.15;
var hammer = 1435;
if (con == 4 || con == 5)
{
    timer++;
    if ((timer % 12) == 0)
    {
        var petal = create_object_to_draw(random_range(0, 500), -20, choose(3938, 5775, 5137));
        petal.image_alpha = 0;
        petal.image_speed = 0.125;
        petal.image_blend = c_black;
        petal.timer = 0;
        with (petal)
        {
            step_func = function()
            {
                timer++;
                if (i_ex(obj_dw_church_arena_bg))
                    image_alpha = obj_dw_church_arena_bg.petalalpha;
                hspeed = -1.5 + sin(timer / 100);
                vspeed = 1;
                if (y > 300)
                    instance_destroy();
            };
        }
    }
}
if (i_ex(hammer) && global.myfight == 0)
{
    if (scr_debug())
    {
        if (sunkus_kb_check_pressed(49))
        {
            change_color_set(colors_cardcastle);
            change_gradient_set(bgcolors_cardcastle);
            con = 1;
        }
        if (sunkus_kb_check_pressed(50))
        {
            change_color_set(colors_mansion);
            change_gradient_set(bgcolors_cybercity);
            con = 2;
        }
        if (sunkus_kb_check_pressed(51))
        {
            change_color_set(colors_teevie);
            change_gradient_set(bgcolors_teevie);
            scr_lerpvar("staralpha", 0, 1, 30);
            con = 3;
        }
        if (sunkus_kb_check_pressed(52))
        {
            change_color_set(colors_teevie);
            change_gradient_set(bgcolors_teevie);
            scr_lerpvar("staralpha", 1, 0, 30);
            scr_lerpvar("hammeralpha", 0, 1, 30);
            con = 4;
        }
        if (sunkus_kb_check_pressed(53))
        {
            change_color_set(colors_garden);
            change_gradient_set(bgcolors_garden);
            scr_lerpvar("hammeralpha", 1, 0, 30);
            scr_lerpvar("petalalpha", 0, 1, 30);
            con = 5;
        }
        if (sunkus_kb_check_pressed(54))
        {
            change_color_set(colors_dark);
            change_gradient_set(bgcolors_dark);
            scr_lerpvar("petalalpha", 1, 0, 30);
            con = 6;
        }
        if (sunkus_kb_check_pressed(55))
        {
            change_color_set(colors_greenish);
            change_gradient_set(bgcolors_greenish);
            scr_lerpvar("bellalpha", 0, 1, 30);
            con = 7;
        }
    }
    if (con == 0 && hammer.trueturn >= 3)
    {
        change_color_set(colors_cardcastle);
        change_gradient_set(bgcolors_cardcastle);
        con = 1;
    }
    if (con == 1 && hammer.trueturn >= 4)
    {
        change_color_set(colors_mansion);
        change_gradient_set(bgcolors_cybercity);
        con = 2;
    }
    if (con == 2 && hammer.trueturn >= 5)
    {
        change_color_set(colors_teevie);
        change_gradient_set(bgcolors_teevie);
        scr_lerpvar("staralpha", 0, 1, 30);
        con = 3;
    }
    if (con == 3 && hammer.trueturn >= 6)
    {
        change_color_set(colors_teevie);
        change_gradient_set(bgcolors_teevie);
        scr_lerpvar("staralpha", 1, 0, 30);
        scr_lerpvar("hammeralpha", 0, 1, 30);
        con = 4;
    }
    if (con == 4 && hammer.trueturn >= 7)
    {
        change_color_set(colors_garden);
        change_gradient_set(bgcolors_garden);
        scr_lerpvar("hammeralpha", 1, 0, 30);
        scr_lerpvar("petalalpha", 0, 1, 30);
        con = 5;
    }
    if (con == 5 && hammer.trueturn >= 8)
    {
        change_color_set(colors_dark);
        change_gradient_set(bgcolors_dark);
        scr_lerpvar("petalalpha", 1, 0, 30);
        con = 6;
    }
    if (con == 6 && hammer.trueturn >= 12)
    {
        change_color_set(colors_greenish);
        change_gradient_set(bgcolors_greenish);
        scr_lerpvar("bellalpha", 0, 1, 30);
        con = 7;
    }
}
