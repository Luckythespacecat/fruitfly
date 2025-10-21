extends AnimatedSprite2D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
func _process(delta: float) -> void:
	position = get_global_mouse_position()
	z_index += 500
	if Input.is_action_just_pressed("Click"):
		play("Click")
