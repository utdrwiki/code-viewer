if (darken == true)
{
    with (obj_heroparent_ch1)
        darkify = true
    if (darkamt < 15)
        darkamt += 1
    with (obj_whiteedge_ch1)
        image_alpha = (obj_darkener_ch1.darkamt / 15)
}
if (darken == false)
{
    with (obj_growtangle_ch1)
        growcon = 3
    with (obj_heroparent_ch1)
        darkify = false
    if (darkamt > 0)
        darkamt -= 1
    with (obj_whiteedge_ch1)
        image_alpha = (obj_darkener_ch1.darkamt / 15)
    if (darkamt <= 0)
        instance_destroy()
}
draw_set_alpha((darkamt / 20))
draw_set_color(c_black)
draw_rectangle((__view_get((0 << 0), 0) - 40), (__view_get((1 << 0), 0) - 40), (__view_get((0 << 0), 0) + 680), (__view_get((1 << 0), 0) + 520), false)
draw_set_alpha(1)
