extends TextureRect

var mouse_entered_var = false
var clicked_rn = false
var move_texture = false
var shouldstaysize : bool
var triggeronce = false
var tempPosition : Vector2
@onready var controls = $ObjectControls
@onready var controlsWidth = $ObjectControls/BoundsWidth
@onready var controlsHeight = $ObjectControls/BoundsHeight
@onready var controlsScale = $ObjectControls/ScaleSlider
func _ready() -> void:
	z_index = -2
	position = Vector2(960.0,544)
	$StaticBody2D/Area2D/CollisionShape2D.shape = RectangleShape2D.new()
	controlsWidth.value = $StaticBody2D/Area2D/CollisionShape2D.shape.extents.x
	controlsHeight.value = $StaticBody2D/Area2D/CollisionShape2D.shape.extents.y
	$StaticBody2D/Area2D/ColorRect.color = Color(0.918, 0.0, 0.918, 0.761)
	controlsScale.value = scale.x
	global.LeftPanel = 0
	await Engine.get_main_loop().process_frame
	await Engine.get_main_loop().process_frame
	await Engine.get_main_loop().process_frame
	global.LeftPanel = 1
	$StaticBody2D/Area2D/ColorRect.position.x = $StaticBody2D/Area2D/ColorRect.position.x -  $StaticBody2D/CollisionShape2D.shape.extents.y
	$StaticBody2D/Area2D/ColorRect.position.y = $StaticBody2D/Area2D/ColorRect.position.y -  $StaticBody2D/CollisionShape2D.shape.extents.y
	

func _process(delta: float) -> void:
	if global.ColorAdjustDone == false:
		$StaticBody2D/Area2D/ColorRect.size.x = $StaticBody2D/CollisionShape2D.shape.extents.x
		$StaticBody2D/Area2D/ColorRect.size.y = $StaticBody2D/CollisionShape2D.shape.extents.y
	$StaticBody2D/CollisionShape2D.shape.extents.x = $StaticBody2D/Area2D/CollisionShape2D.shape.extents.x
	$StaticBody2D/CollisionShape2D.shape.extents.y = $StaticBody2D/Area2D/CollisionShape2D.shape.extents.y
	
	controls.global_position = Vector2(16.0,216.0)
	$StaticBody2D/Area2D/CollisionShape2D.shape.extents.x = controlsWidth.value
	$StaticBody2D/Area2D/CollisionShape2D.shape.extents.y = controlsHeight.value
	controls.global_position = Vector2(16.0,216.0)
	scale.x = controlsScale.value
	scale.y = scale.x
	$ObjectControls.global_scale.x = 5
	$ObjectControls.global_scale.y = $ObjectControls.global_scale.x
	controls.global_position = Vector2(16.0,216.0)
	
	#if triggeronce == false:
		#shouldstaysize = _is_area_inside()
		#triggeronce = true
		#if shouldstaysize == false :
			#scale = scale /2
			

	if Input.is_action_just_pressed("Click") :
		clicked_rn = true
		tempPosition = position
	if Input.is_action_just_released("Click"):
		$StaticBody2D/Area2D/CollisionShape2D.shape.size = texture.get_size()
		clicked_rn = false
		move_texture = false
		global.DraggingObject = false
	if mouse_entered_var == true and global.DraggingObject == false :
		if clicked_rn == true:
			move_texture = true
			global.DraggingObject = true
	if move_texture == true :
		position = get_viewport().get_mouse_position()
		controls.global_position = Vector2(16.0,216.0)

func _on_area_2d_mouse_entered() -> void:
	mouse_entered_var = true


func _on_area_2d_mouse_exited() -> void:
	mouse_entered_var = false

func _is_area_inside() -> bool:
	var thisarea = $Area2D/CollisionShape2D.shape
	
	var thisrect = thisarea.get_rect()
	var thisrect_global = thisrect
	
	var canvasarea = global.precanvasarea
	
	return canvasarea.encloses(thisrect_global)


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "WindowArea" :
		position = tempPosition
func _on_bounds_width_drag_started() -> void:
	triggeronce = false
func _on_bounds_height_drag_started() -> void:
	triggeronce = false
