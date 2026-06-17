extends Area2D

@export var secret = true
@export var token_name: String = ""
@onready var name_label: Label = %NameLabel

@export var token_info: String = ""
@onready var info_label: Label = %InfoLabel

func _ready() -> void:
	if secret:
		visible = false
	
	name_label.text = get_display_name()
	info_label.text = get_display_info()

func _process(delta: float) -> void:
	pass

func _input_event(_viewport, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("clicked")

func get_display_name() -> String:
	return token_name if token_name != "" else name

func get_display_info() -> String:
	return token_info if token_info != "" else name
