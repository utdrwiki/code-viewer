if (sunkus_kb_check_pressed(45))
    room_goto_next();
if (keyboard_check_pressed(ord("R")))
    room_restart();
var i = 0;
mute = 0;
if (sunkus_kb_check_pressed(68))
{
    file = "debug_soundlist.txt";
    myfileid = file_text_open_write(file);
    for (i = 0; i < soundtotal; i++)
    {
        file_text_write_string(myfileid, soundName[i]);
        file_text_writeln(myfileid);
    }
    file_text_close(myfileid);
}
if (sunkus_kb_check(40))
    moved++;
if (sunkus_kb_check(38))
    moved--;
if (sunkus_kb_check(39))
    moved += 15;
if (sunkus_kb_check(37))
    moved -= 15;
if (sunkus_kb_check_pressed(40))
    moved = 5;
if (sunkus_kb_check_pressed(38))
    moved = -5;
if (auto == 1)
{
    moved += 0.5;
    if (moved >= 5)
    {
        playsound = 1;
        mute = 1;
    }
}
while (moved >= 5)
{
    current++;
    moved -= 5;
}
while (moved <= -5)
{
    current--;
    moved += 5;
}
if (current < 1)
    current = 1;
if (current > (soundtotal - 1))
    current = soundtotal - 1;
if (sunkus_kb_check_pressed(90))
    playsound = 1;
if (sunkus_kb_check_pressed(77))
    mute = 1;
if (mute)
{
    snd_free_all();
    snd_stop_all();
    mute = 0;
}
if (playsound)
{
    snd_stop_all();
    playsound = 0;
    snd_play_pitch(asset_get_index(soundName[current]), pitch);
}
if (sunkus_kb_check_pressed(65))
{
    if (auto == 0)
        auto = 1;
    else
        auto = 0;
}
if (sunkus_kb_check_pressed(74))
{
    checkstring = get_string("Enter index of sound to jump to sound. ex. snd_noise", soundName[current]);
    var found = false;
    for (i = 0; i < array_length(soundName); i++)
    {
        if (checkstring == soundName[i])
        {
            current = i;
            found = true;
        }
    }
    if (!found)
        debug_print("Sound Not Found");
}
if (sunkus_kb_check_pressed(33))
    current = 1;
if (sunkus_kb_check_pressed(34))
    current = soundtotal - 1;
if (sunkus_kb_check_pressed(85))
    pitch += 0.1;
if (sunkus_kb_check_pressed(89))
    pitch -= 0.1;
