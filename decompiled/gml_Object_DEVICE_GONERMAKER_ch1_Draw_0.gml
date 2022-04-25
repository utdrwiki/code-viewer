FA = ((10 - FADEBUFFER) / 10)
if (FA > 1)
    FA = 1
for (k = obj_sneo_friedpipis; k < STEP; k += 1)
{
    img = IMAGE_GONERHEAD_ch1
    if (k == obj_pipis_bullet_cone)
        img = IMAGE_GONERBODY_ch1
    if (k == obj_84_lang_helper)
        img = IMAGE_GONERLEGS_ch1
    if (LOCK[k] == true)
    {
        s_size = abs((sin((siner / 16)) / 2))
        draw_sprite_ext(img, PART[k], (x - ((s_size * sprite_width) / 2)), ((y + sy[k]) - ((s_size * sprite_height) / 2)), (2 + s_size), (2 + s_size), 0, c_white, (0.4 * FA))
        s_size = abs((sin((siner / 21)) / 2))
        draw_sprite_ext(img, PART[k], (x - ((s_size * sprite_width) / 2)), ((y + sy[k]) - ((s_size * sprite_height) / 2)), (2 + s_size), (2 + s_size), 0, c_white, (0.4 * FA))
    }
}
if (CANCEL == false)
    draw_sprite_ext(IMAGE_SOUL_BLUR_ch1, 0, (initx + 10), (inity - 30), 1, 1, 0, c_white, (1 * FA))
for (j = 0; j < STEP; j += 1)
{
    img = IMAGE_GONERHEAD_ch1
    if (j == 1)
        img = IMAGE_GONERBODY_ch1
    if (j == 2)
        img = IMAGE_GONERLEGS_ch1
    if (s == j)
    {
        for (i = 0; i <= PARTMAX[j]; i += 1)
        {
            alpha = (1 - (abs((PARTX[j] + (i * 50))) / 120))
            draw_sprite_ext(img, i, ((x + PARTX[j]) + (i * 50)), (y + sy[j]), 2, 2, 0, image_blend, (alpha * FA))
        }
    }
    else
        draw_sprite_ext(img, PART[j], x, (y + sy[j]), 2, 2, 0, image_blend, (1 * FA))
}
NAMEFADE_COMPLETE = false
if instance_exists(DEVICE_CHOICE_ch1)
{
    if (DEVICE_CHOICE_ch1.TYPE == 3)
    {
        NAMEFADE_COMPLETE = true
        NAMEFADE += 0.03
        NAMEFADE *= 1.25
        if (NAMEFADE >= 1)
            NAMEFADE = 1
    }
}
if (NAMEFADE_COMPLETE == false)
{
    NAMEFADE -= 0.03
    NAMEFADE *= 0.75
    if (NAMEFADE <= 0)
        NAMEFADE = 0
}
image_blend = merge_color(c_white, c_black, NAMEFADE)
