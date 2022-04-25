if release
{
    if (image_alpha == 0)
    {
        image_alpha = 1
        x = camerax()
        y = cameray()
        ral_x = camerax()
    }
    if (y_pos < 0)
        y_pos = (view_hport[0] + 100)
    climbtimer++
    if (climbtimer == 1)
        rem_y_pos = y_pos
    if (climbtimer == 2)
    {
        wobble++
        var new_ypos = (rem_y_pos - 120)
        if (new_ypos < 95)
            new_ypos = 95
        scr_lerpvar_instance(id, "y_pos", rem_y_pos, new_ypos, 30, -1, "out")
        var x_offset = ((wobble % 2) == 0 ? -20 : 20)
        var new_xpos = (new_ypos == 95 ? (camerax() + 78) : (rem_x_pos + x_offset))
        scr_lerpvar_instance(id, "x_pos", rem_x_pos, new_xpos, 20, -1, "out")
    }
    if (climbtimer == 40)
    {
        climbtimer = 0
        rem_y_pos = y_pos
        rem_x_pos = x_pos
    }
    if (y_pos <= 95)
        release = 0
}
if release_normal
{
    if (image_alpha == 0)
    {
        image_alpha = 1
        x = camerax()
        y = cameray()
        ral_x = camerax()
    }
    if (y_pos < 0)
        y_pos = (view_hport[0] + 100)
    y_pos = clamp((y_pos - 10), 95, (view_hport[0] + 100))
    if (y_pos <= 95)
        release_normal = 0
}
if leave
{
    if (y_pos == 95)
        hand_sprite = 267
    y_pos = clamp((y_pos + 10), 95, (view_hport[0] + 100))
    if (y_pos >= (view_hport[0] + 100))
    {
        leave = 0
        instance_destroy()
    }
}
if su_struggle
{
    su_struggle = 0
    su_sprite = 371
    su_animate = 1
}
if su_shocked
{
    su_shocked = 0
    su_sprite = 372
    su_animate = 0
}
if su_look_left
{
    su_look_left = 0
    su_sprite = 367
    su_animate = 0
}
if su_look_right
{
    su_look_right = 0
    su_sprite = 366
    su_animate = 0
}
if su_concerned
{
    su_concerned = 0
    su_sprite = 370
    su_animate = 0
}
if (su_grin_1 || su_grin_2)
{
    su_anim_index = su_grin_2
    su_grin_1 = 0
    su_grin_2 = 0
    su_sprite = 368
    su_animate = 0
}
if (su_squint_1 || su_squint_2)
{
    su_anim_index = su_squint_2
    su_squint_1 = 0
    su_squint_2 = 0
    su_sprite = 369
    su_animate = 0
}
if su_animate
{
    su_animsiner++
    su_anim_index = (su_animsiner / 10)
}
else if (su_animsiner != 0)
    su_animsiner = 0
if ra_struggle
{
    ra_struggle = 0
    ra_sprite = 361
    ra_animate = 1
}
if ra_huh
{
    ra_huh = 0
    ra_sprite = 358
    ra_animate = 0
}
if ra_look
{
    ra_look = 0
    ra_sprite = 362
    ra_animate = 0
}
if ra_smile
{
    ra_smile = 0
    ra_sprite = 360
    ra_animate = 0
}
if ra_scared
{
    ra_scared = 0
    ra_sprite = 359
    ra_animate = 0
}
if ra_stern
{
    ra_stern = 0
    ra_sprite = 363
    ra_animate = 0
}
if ra_mu
{
    ra_mu = 0
    ra_sprite = 365
    ra_animate = 0
}
if ra_animate
{
    ra_animsiner++
    ra_anim_index = (ra_animsiner / 10)
}
else if (ra_animsiner != 0)
{
    ra_animsiner = 0
    ra_anim_index = 0
}
