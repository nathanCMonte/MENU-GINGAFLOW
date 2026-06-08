extends Control
@onready var vinheta = preload("res://MENU/SCENES/Carregamento.tscn")
func _ready() -> void:
	var vinheta_Anim = vinheta.instantiate()
	get_tree().current_scene.add_child(vinheta_Anim)
	var anim = vinheta_Anim.get_node("loading_Anims")
	anim.stop()
	anim.seek(0.0,0.0,true)
	anim.play("vinheta_abrir")
	await anim.animation_finished
	vinheta_Anim.queue_free()
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MENU/SCENES/menu.tscn")
