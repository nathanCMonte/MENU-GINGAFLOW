extends Control
@onready var music_text = $Now_playing/music_label
@onready var musica_atual = get_node("/root/AudioManager")
var loading_screen = preload("res://Carregamento.tscn")
var hue:= 0.0
func _ready() -> void:
	await loading()
	musica_atual.start_music()
	await digitar_texto(music_text,musica_atual.nome)
	if global.loaded == false:
		return
	loading()


func _process(delta: float) -> void:
	hue += delta * 0.3
	
	if hue > 1.0:
		hue = 0.0
	music_text.modulate = Color.from_hsv(hue,1.0,1.0)
func loading():
		if global.loaded == true:
			var loading = loading_screen.instantiate()
			get_tree().current_scene.add_child(loading)
			
			var anim = loading.get_node("loading_Anims")
			anim.play("loading")
			await anim.animation_finished
			anim.play("opening")
			await anim.animation_finished
			global.loaded = false
			loading.queue_free()
			
func _on_button_pressed() -> void:
	pass # Replace with function body.



func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://MENU/SCENES/training.tscn")


func _on_button_3_pressed() -> void:
	pass # Replace with function body.


func _on_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://MENU/SCENES/customize.tscn")



func _on_button_quit_pressed() -> void:
	get_tree().quit()



func _on_button_login_pressed() -> void:
	get_tree().change_scene_to_file("res://MENU/SCENES/login.tscn")
	
func digitar_texto(label: Label, txt: String, delay: float = 0.03) -> void:
	label.text = "Now playing - "
	for i in range(txt.length()):
		label.text += txt[i]
		await get_tree().create_timer(delay).timeout
