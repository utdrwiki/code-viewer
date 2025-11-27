timer++;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
    {
        instance_destroy(other.id);
        exit;
    }
}
if (string_char_at(letters1, timer) != "")
    create_letter(string_char_at(letters1, timer), x - ((midlength1 - timer) * 20), y - 20);
if (string_char_at(letters1, timer) != "")
    create_letter(string_char_at(letters2, timer), x - ((midlength2 - timer) * 20), y);
if (timer == (maxlength + 15))
    create_letter("+", x - 30, y - 55);
if (timer == (maxlength + 16))
    create_letter("5", x - 10, y - 55);
if (timer == (maxlength + 17))
{
    create_letter("0", x + 10, y - 55);
    instance_destroy();
}
