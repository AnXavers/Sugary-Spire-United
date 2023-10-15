if (selected == ((pgnum * (rows * columns)) - 1) || selected == (array_length(entry) - 1))
	selected = ((pgnum - 1) * (rows * columns));
else
	selected++;
scrolldelay = 210;
texty = 0;
