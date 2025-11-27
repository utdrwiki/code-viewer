var soundcount = 0;
for (var i = 0; audio_exists(i); i++)
    soundName[i] = audio_get_name(i);
array_sort(soundName, true);
soundtotal = array_length(soundName);
current = 1;
moved = 0;
auto = 0;
playsound = 0;
pitch = 1;
