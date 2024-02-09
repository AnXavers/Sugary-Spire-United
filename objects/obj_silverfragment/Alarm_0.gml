silveractive = 2
array_push(global.fragments, fragmentid)
ini_open("silversave.ini");
ini_write_string("Main", "fragments", json_stringify(global.fragments));
ini_close();