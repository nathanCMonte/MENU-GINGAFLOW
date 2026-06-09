extends AudioStreamPlayer2D

var nome = ""
var last_music
var musicas = [
	preload("res://MENU/ASSETS/SONGS/YTDown_YouTube_L-Etoile-D-Afrique-x-Les-Trompettes-D-Af_Media_DGEu1SwsY4E_009_128k.mp3"),
	preload("res://MENU/ASSETS/SONGS/YTDown_YouTube_BOUNCE-FUNK_Media_KuzZMW3cauk_009_128k.mp3"),
	preload("res://MENU/ASSETS/SONGS/YTDown_YouTube_INSTRUMENTAL-UdieNnx-PUCH_Media_U0OEBBGxIe4_006_128k.mp3")
]

func _ready():
	tocar_musica_aleatoria()

func tocar_musica_aleatoria():
	while stream == last_music:
		stream = musicas.pick_random()
	play()
	if stream == musicas[0]:
		last_music = musicas[0]
		volume_db = 0.9
		nome = " L’Étoile D’Afrique x Les Trompettes D’Afrique - From DCYCD"
	elif stream == musicas[1]:
		last_music = musicas[1]
		volume_db = 0.9
		nome = "BOUNCE FUNK - From SAPFIR"
	elif stream == musicas[2]:
		last_music = musicas[2]
		volume_db = 5
		nome = "PUCH Instrumental Version - From UdieNnx"
	else:
		nome = "Unknown"

	

func _on_finished():
	tocar_musica_aleatoria()

func stop_music():
	stop()

func start_music():
	if !playing:
		play()
