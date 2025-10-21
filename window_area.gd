extends Area2D

func _process(delta: float) -> void:
	global.precanvasarea = $CollisionShape2D.shape.get_rect()
	if global.windowCollisionVisible == false:
		$CollisionShape2D.visible = false
	if global.windowCollisionVisible == true:
		$CollisionShape2D.visible = true
