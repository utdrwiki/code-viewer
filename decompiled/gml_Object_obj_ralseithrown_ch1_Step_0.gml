if (con == 0 || con == 2)
    image_angle = direction
if (x > (xx + 700) || y < (yy - 40))
{
    if (con == 0)
    {
        gravity = 0
        speed = 0
        x = (xx - 40)
        y = obj_heroralsei_ch1.y
        sprite_index = spr_ralseib_idle_ch1
        image_angle = 0
        hspeed = 20
        con = 10
    }
}
if (con == 10)
{
    timer += 1
    if (x >= (obj_heroralsei_ch1.x - 10))
    {
        if (collided == 0)
        {
            global.msg[0] = scr_84_get_lang_string_ch1("obj_ralseithrown_slash_Step_0_gml_23_0")
            scr_battletext_default_ch1()
        }
        with (obj_heroralsei_ch1)
            visible = true
        with (obj_herosusie_ch1)
            visible = true
        with (obj_checkers_enemy_ch1)
        {
            actcon = 1
            visible = true
        }
        with (obj_throwtarget_ch1)
            instance_destroy()
        with (obj_throwralsei_ch1)
            instance_destroy()
        instance_destroy()
    }
}
if (con == 2)
{
    if (x < (xx - 40) || y > (yy + 520))
    {
        timer = 0
        gravity = 0
        speed = 0
        x = (xx - 40)
        y = obj_heroralsei_ch1.y
        sprite_index = spr_ralseib_idle_ch1
        image_angle = 0
        hspeed = 20
        con = 10
    }
}
