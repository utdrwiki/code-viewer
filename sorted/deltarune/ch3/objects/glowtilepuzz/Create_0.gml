record = 0;
tiletotal = 0;
image_xscale = 2;
image_yscale = 2;
image_speed = 0.1;
funtotal = 99;
order = 0;
funbuffer = 0;
stepnoise = 0;
wonamt = 0;
run_check = false;
run_con = -1;
run_count = 0;
active = 0;
failtimer = 0;
failamt = 0;
talked = 0;
failmax = 160;
wonmax = 3;
plotamt = 22;
for (i = 0; i < wonmax; i += 1)
{
    block[i] = instance_create(1200 + (i * 40), 1120, obj_soliddark);
    block[i].image_yscale = 2;
    spike1[i] = scr_dark_marker(1200 + (i * 40), 1120, spr_spiketile);
    with (spike1[i])
        depth = 900000;
    spike2[i] = scr_dark_marker(1200 + (i * 40), 1160, spr_spiketile);
    with (spike2[i])
        depth = 900000;
    if (global.plot >= 22)
    {
        active = 2;
        with (spike1[i])
            image_index = 1;
        with (spike2[i])
            image_index = 1;
        with (block[i])
            instance_destroy();
    }
}
shakecon = 0;
scr_depth();
delayfacing = 0;
