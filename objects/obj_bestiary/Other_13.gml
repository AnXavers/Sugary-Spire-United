if (selected == ((pgnum * (rows * columns)) - 1) || selected == (array_length(entry) - 1))
	selected = (pgnum - 1) * (rows * columns);
else
	selected += 1;
scrolldelay = 210;
texty = 0;
