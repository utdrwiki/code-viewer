if (!d_ex())
    exit;
if (talking_actor == -4)
    exit;
if (!i_ex(obj_writer))
    exit;
if (paused)
    exit;
if (talking_typer >= 0 && global.typer != talking_typer)
{
    halt_speaker();
    exit;
}
if (obj_writer.halt >= 1)
{
    halt_speaker();
}
else
{
    if (talking_actor_current != talking_actor)
    {
        init_speaker(talking_actor.name);
        halt_speaker();
        talking_actor_current = talking_actor;
    }
    if (global.typer == talking_typer)
        animate_speaker();
}
