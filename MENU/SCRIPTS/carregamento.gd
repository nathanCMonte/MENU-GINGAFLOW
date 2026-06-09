extends Control
@onready var vinheta_anim = $loading_Anims
func _ready() -> void:
	if global.transition == true:
		vinheta_anim.play("vinheta_abrir")
	
	
