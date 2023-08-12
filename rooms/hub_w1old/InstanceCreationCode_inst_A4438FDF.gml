targetRoom = mines_1;
targetDoor = "A";
level = "mines";
details = [gate_createlayer(spr_mines_startgate, 0), gate_createlayer(spr_mines_startgate, 1), gate_createlayer(spr_mines_startgate, 2, 1), gate_createlayer(spr_mines_startgate, 3, 0.66), gate_createlayer(spr_mines_startgate, 4, 0.33)];
info = 
{
    bginfo: [spr_minescard_bg, (1 << 0), (5 << 0), (8 << 0), 0, 0],
    titleinfo: [spr_minescard_title, (0 << 0), (4 << 0), (7 << 0), 0, 0],
    song: mu_mines_title
};
