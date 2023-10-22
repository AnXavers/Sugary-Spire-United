var tileArea = (rows * columns);
var entryAmt = array_length(entry);
var pgTotal = (floor((entryAmt / tileArea)) + 1);
if (selected == ((pgnum - 1) * (rows * columns)))
{
	if (pgnum == pgTotal)
		selected = (entryAmt - 1);
	else
		selected = ((pgnum * (rows * columns)) - 1);
}
else
	selected--;
texty = 0;
scrolldelay = 210;
