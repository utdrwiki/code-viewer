if (monologuecon >= 0)
{
    scr_speaker("susie");
    for (i = 0; i < array_length(susie_monologue[monologuecon]); i++)
    {
        if (i == 0)
            msgset(0, susie_monologue[monologuecon][i]);
        else
            msgnext(susie_monologue[monologuecon][i]);
    }
    if (monologuecon == 1)
        write_top = true;
    monologuecon = -1;
    if (i_ex(monologue_writer))
        instance_destroy(monologue_writer);
    monologue_writer = instance_create(x, y, obj_writer);
    monologue_writer.skippable = false;
    monologue_writer.disablebutton1 = true;
}
