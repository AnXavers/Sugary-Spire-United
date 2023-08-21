scr_init_palettenames()
depth = -160000
normalchars = []
jokechars = []
characters = normalchars
charvars = []
selected_char = 0
selected_pal = 1
scr_init_input()
active = 0
default_palette_count = 16
palettes = [["piss", 0, 0], ["classic", 1, 1], ["unfunny", 0, 3], ["money", 0, 4], ["sage", 0, 5], ["blood", 0, 6], ["tv", 0, 7], ["dark", 0, 8], ["shitty", 0, 9], ["golden", 0, 10], ["garish", 0, 11], ["mooney", 0, 15], ["funny", 0, 12, spr_peppattern1], ["itchy", 0, 12, spr_peppattern2], ["pizza", 0, 12, spr_peppattern3], ["stripes", 0, 12, spr_peppattern4], ["goldemanne", 0, 12, spr_peppattern5], ["bones", 0, 12, spr_peppattern6], ["pp", 0, 12, spr_peppattern7], ["war", 0, 12, spr_peppattern8], ["john", 0, 12, spr_peppattern9]]
scroll_x = 0
scroll_y = 0
opacity = 0
grid_size = 230
held_move_x = 0
held_move_y = 0
trace("array format: character letter, name, sprite, palette sprite (middle click helps)")
trace("variables to set to 1 (can be global.), character to send, mach color 1, mach color 2")
trace("stuff after the palette sprite is optional")
add_character(["P", "PEPPINO", spr_idle, spr_peppalette, ["ispeppino"]])
add_character(["P", "THE NOISE", spr_playerN_idle, spr_noisepalette, [], "N"])
add_character(["N", "POGO NOISE", spr_playerN_pogofall, spr_noisepalette, [], "N"])
add_character(["BN", "BO NOISE", spr_playerBN_idle, spr_bnpal])
add_character(["CN", "CLONE NOISE", spr_playerCN_idle, spr_clonenoise_palette, [], "CN", make_colour_rgb(248, 224, 128), make_colour_rgb(216, 136, 24)])
add_character(["PZ", "PIZZELLE", spr_playerPZ_idle, spr_PZpalette, ["global.pizzellemovement"], "PZ", make_colour_rgb(48, 168, 248), make_colour_rgb(232, 80, 152)])
add_character(["FP", "FAKE PEPPINO", spr_fakepeppino_idle, spr_peppalette])
add_character(["PP", "CLONE PEPPINO", spr_pepclone_stun, spr_peppalette])
add_character(["PC", "PINEACOOL", spr_coolpinea_idle, spr_coolpalette])
add_character(["PIZZ", "PIZZARD", spr_pizzard_idle, spr_pizzardpalette])
add_character(["V", "THE VIGILANTE", spr_playerV_idle, palette_vigilante])
add_character(["M", "PEPPERMAN", spr_pepperman_idle, spr_pepperpalette])
add_character(["S", "SNICK", spr_snick_idle, spr_snickpalette])
add_character(["P", "PEP SNICK", spr_snick_pistolidle, spr_snickpalette, ["issnick"], "S"])
add_character(["W", "WARIO", spr_playerW_idle, spr_wariomassivepalette])
add_character(["M", "PEPPERMAN WARIO", spr_playerW_charge, spr_wariomassivepalette, ["iswario"], "M", make_colour_rgb(78, 131, 107), make_colour_rgb(78, 69, 107)])
add_character(["WL", "WALUIGI", spr_playerWL_idle, spr_wahpalette, [], "PEPW", make_colour_rgb(78, 131, 107), make_colour_rgb(78, 69, 107)])
add_character(["L", "LUIGI", spr_playerL_idle, spr_luigipalette, ["global.pummel"], "L", make_colour_rgb(283, 100, 56), make_colour_rgb(318, 100, 100)])
add_character(["PM", "PAPER MARIO", playerPM_idle, palette_vigilante, [], "PM", make_colour_rgb(78, 131, 107), make_colour_rgb(78, 69, 107)])
add_character(["A", "ANTON", spr_playerA_idle, spr_antonpalette, ["global.pummel"], "A", make_colour_rgb(115, 100, 100), make_colour_rgb(115, 100, 100)])
add_character(["AN", "ANNIE", spr_annie_idle, spr_anniepalette])
add_character(["PG", "PIZZANO", spr_pizzano_idle, spr_pizzanopalette, [], "PG", make_colour_rgb(78, 131, 107), make_colour_rgb(78, 69, 107)])
add_character(["N", "POGO PIZZANO", spr_pizzano_pogo_air, spr_pizzanopalette, ["ispizzano"], "PG"])
add_character(["E", "EEVEE", spr_playerE_idle, spr_eevee_palette])
add_character(["PH", "PIZZAHEAD", spr_pizzahead_idle, palette_vigilante, ["global.pizzellemovement"], "PH", make_colour_rgb(48, 168, 248), make_colour_rgb(232, 80, 152)])
add_character(["H", "SONIC", spr_playerSUNK_idle, spr_sunkpalette, [], "H"])
add_character(["PN", "PEPPINA", spr_playerPN_idle, spr_peppalette])
add_character(["PINK", "PINKIE PIE", spr_playerPP_idle, spr_pinkiepalette])
add_character(jokechars, ["MO", "MORSHU", spr_morshu_idle, spr_peppalette])
add_character(jokechars, ["PAUL", "PAUL", spr_paul_idle, spr_paulpalette])
add_character(jokechars, ["M", "SPONGEBOB", spr_playerSB_idle, spr_peppalette, ["isspongebob"], "M", make_colour_rgb(78, 131, 107), make_colour_rgb(78, 69, 107)])
add_character(jokechars, ["SANS", "SANS", spr_sans_idle, spr_sanspalette, ["iswario"], "SANS", make_colour_rgb(78, 131, 107), make_colour_rgb(78, 69, 107)])
add_character(jokechars, ["T", "TOASTER", spr_pet_toaster_idle, spr_pet_toaster_palette])