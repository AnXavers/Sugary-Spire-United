function scr_sourbuddychar()
{
	if (irandom_range(1, 1997) == 1997)
		sourbuddytype = 1997;
	switch (sourbuddytype)
	{
		case 1:
			sourbuddywalkspr = spr_sbwalkhappy;
			sourbuddyattachspr = spr_sblatch;
			sourbuddydeadspr = spr_sbdead;
			break;
		case 2:
			sourbuddywalkspr = spr_sbwalkcrazy;
			sourbuddyattachspr = spr_sblatch;
			sourbuddydeadspr = spr_sbdead;
			break;
		case 3:
			sourbuddywalkspr = spr_sbwalkblank;
			sourbuddyattachspr = spr_sblatch;
			sourbuddydeadspr = spr_sbdead;
			break;
		case 4:
			sourbuddywalkspr = spr_sbwalkblank2;
			sourbuddyattachspr = spr_sblatch;
			sourbuddydeadspr = spr_sbdead;
			break;
		case 5:
			sourbuddywalkspr = spr_sbwalkmad;
			sourbuddyattachspr = spr_sblatch;
			sourbuddydeadspr = spr_sbdead;
			break;
		case 6:
			sourbuddywalkspr = spr_sbwalksad;
			sourbuddyattachspr = spr_sblatch;
			sourbuddydeadspr = spr_sbdead;
			break;
		case 1997:
			sourbuddywalkspr = spr_sbspamton;
			sourbuddyattachspr = spr_sblatchspamton;
			sourbuddydeadspr = spr_sbdeadspamton;
			break;
	}
}
