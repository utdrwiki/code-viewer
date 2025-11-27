con = -1;
customcon = 0;
kris_spin_active = false;
lancer_spin = false;
lancer_x = 0;
lancer_y = 0;
lancer_visible = true;
siner = 0;
spin_timer = 0;
spin_timer_kris = 0;
spin_index = 0;
image_xscale = 2;
image_yscale = 2;
lancer_readable = instance_create(x - 30, y, obj_readable_room1);
with (lancer_readable)
{
    extflag = "lancer_spin";
    image_xscale = 4;
}
lancer_block = instance_create(x - 30, y - 10, obj_solidblocksized);
with (lancer_block)
    image_xscale = 2;

toggle_help = function()
{
    kris_spin_active = !kris_spin_active;
    if (!kris_spin_active)
    {
        spin_timer_kris = 0;
        with (obj_mainchara)
            fun = 0;
    }
    else
    {
        with (obj_mainchara)
            fun = 1;
    }
    snd_play(snd_squeaky);
};

pick_up = function()
{
    con = 20;
};
