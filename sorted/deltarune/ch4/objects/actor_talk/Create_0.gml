talking_actor = -4;
talking_actor_current = -4;
talking_typer = -1;
paused = false;

init_speaker = function(arg0)
{
    var typer_cache = global.typer;
    var fc_cache = global.fc;
    scr_speaker(arg0);
    talking_typer = global.typer;
    global.typer = typer_cache;
    global.fc = fc_cache;
};

animate_speaker = function()
{
    with (talking_actor_current)
    {
        if (image_speed == 0)
            image_speed = 0.2;
    }
};

halt_speaker = function()
{
    with (talking_actor_current)
    {
        if (image_speed > 0)
        {
            image_speed = 0;
            image_index = 0;
        }
    }
};
