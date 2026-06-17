extends Camera2D

@export var speed: float = 3000

@export var zoom_step: float = 0.1
@export var min_zoom: float = 0.5
@export var max_zoom: float = 4.0

var is_dragging: bool = false

func _process(delta: float) -> void:
	camera_movement(delta)

func camera_movement(delta: float) -> void:
	var direction := Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		
	if direction != Vector2.ZERO:
		direction = direction * speed * delta
		
	position += direction * speed * delta

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			is_dragging = event.pressed

		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			zoom_camera(1.0 + zoom_step)

		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom_camera(1.0 - zoom_step)

	if event is InputEventMouseMotion and is_dragging:
		position -= event.relative / zoom.x
		
func zoom_camera(factor: float) -> void:
	var new_zoom := zoom.x * factor
	new_zoom = clamp(new_zoom, min_zoom, max_zoom)

	zoom = Vector2(new_zoom, new_zoom)
