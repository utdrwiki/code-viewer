if (freeze)
    exit;
timer--;
if (timer < 0)
    instance_destroy();
