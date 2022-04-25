depth = 5000
fileExists = 0
q = "Question Prompt?"
c1 = "#yes"
c2 = "#no"
c3 = "maybe"
c4 = "so"
promptcount = 4
fileExists = 0
if file_exists("choicer.txt")
    fileExists = 1
if (fileExists == 0)
{
    ini_open("choicer.txt")
    ini_write_real("choicer", "promptcount", promptcount)
    ini_write_string("choicer", "c4", c4)
    ini_write_string("choicer", "c3", c3)
    ini_write_string("choicer", "c2", c2)
    ini_write_string("choicer", "c1", c1)
    ini_write_string("choicer", "question", q)
    ini_close()
    fileExists = 1
}
else
{
    ini_open("choicer.txt")
    q = ini_read_string("choicer", "question", q)
    c1 = ini_read_string("choicer", "c1", c1)
    c2 = ini_read_string("choicer", "c2", c2)
    c3 = ini_read_string("choicer", "c3", c3)
    c4 = ini_read_string("choicer", "c4", c4)
    promptcount = ini_read_real("choicer", "promptcount", promptcount)
    ini_close()
    fileExists = 1
}
haswritten = 0
if (global.darkzone == true)
    global.typer = 4
else
    global.typer = 1
