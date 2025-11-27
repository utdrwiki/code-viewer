con = -1;
customcon = 0;
if (global.plot < 150)
    global.plot = 150;
if (global.plot >= 150 && global.plot < 160)
    con = 0;
else
    instance_destroy();
