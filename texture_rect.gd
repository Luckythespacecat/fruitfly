extends TextureRect

var mouse_entered_var = false
var clicked_rn = false
var move_texture = false

func _ready() -> void:
	position = Vector2(500,500)
	$Area2D/CollisionShape2D.shape = RectangleShape2D.new()

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("Click") :
		clicked_rn = true
	if Input.is_action_just_released("Click"):
		$Area2D/CollisionShape2D.shape.size = texture.get_size()
		clicked_rn = false
		move_texture = false
		global.DraggingObject = false
	if mouse_entered_var == true and global.DraggingObject == false :
		if clicked_rn == true:
			move_texture = true
			global.DraggingObject = true
	if move_texture == true :
		position = get_viewport().get_mouse_position()

func _on_area_2d_mouse_entered() -> void:
	mouse_entered_var = true


func _on_area_2d_mouse_exited() -> void:
	mouse_entered_var = false
