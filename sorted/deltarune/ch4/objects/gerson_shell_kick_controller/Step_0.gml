if (global.turntimer < 1 || global.fighting == 0)
{
    image_alpha -= 0.2;
    if (image_alpha < 0.1)
    {
        instance_destroy();
        exit;
    }
}
timer++;
if (full_timer < 999)
    full_timer--;
if (timer == 12)
{
    x = obj_hammer_of_justice_enemy.x;
    y = obj_hammer_of_justice_enemy.y;
    visible = true;
    sprite_index = spr_gerson_swing;
    image_index = 0;
    obj_hammer_of_justice_enemy.visible = false;
    snd_play(snd_boost);
    my_flash = scr_oflash();
    scr_lerpvar("x", x, x + 48, 12, 2, "out");
}
if (timer >= 12 && timer < 24 && (timer % 3) == 0)
{
    with (scr_oflash())
    {
        depth += 1;
        flashcolor = c_lime;
    }
}
if (timer == 24)
{
    scr_lerpvar("image_index", 0, 6, 12);
    snd_play(motor_upper_quick_mid);
}
if (timer == 32)
{
    snd_play(snd_rudebuster_swing);
    scr_shakeobj();
    with (instance_create((x + 100) - 42, (y + 90) - 86, obj_gerson_shell_pinball))
    {
        scr_bullet_init();
        direction = scr_at_player(x, y);
        speed = 12;
        depth -= 1;
        image_xscale += 0.25;
        image_yscale += 0.25;
        active = 1;
        target = 3;
        damage = 1;
        grazed = 0;
        grazepoints = 2.5;
        destroyonhit = false;
    }
}
if (timer == 40)
{
    if (shell_counter == 1)
    {
        visible = false;
        with (instance_create(x + 58, y + 36, obj_gerson_teleport_generic))
            scr_script_delayed(instance_destroy, 7);
    }
    else
    {
        timer = 23;
        shell_counter++;
    }
}
if (full_timer < 4 && ending_counter == 0)
{
    ending_counter = 1;
    instance_create(obj_hammer_of_justice_enemy.x + 68, obj_hammer_of_justice_enemy.y + 36, obj_gerson_teleport_generic);
}
if (full_timer < 2 && ending_counter == 1)
{
    ending_counter = 2;
    global.turntimer = 1;
}
if (global.turntimer < 1)
{
    with (obj_gerson_teleport_generic)
        instance_destroy();
    with (obj_hammer_of_justice_enemy)
        visible = true;
    instance_destroy();
}
