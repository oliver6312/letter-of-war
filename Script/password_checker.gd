extends Node2D

@onready var open_button: Button = %OpenButton
@onready var password_window: Window = $PasswordWindow
@onready var line_edit: LineEdit = %LineEdit

signal ashton_view_activated
signal bellari_view_activated
signal taurus_view_activated
signal dravin_view_activated
signal carvano_view_activated

func _ready() -> void:
	password_window.visible = false
	open_button.text = "PASSWORD"
	open_button.pressed.connect(_button_pressed)
	line_edit.text_submitted.connect(_check_password)

func _check_password(_check_password) -> void:
	print("password was entered")
	password_window.visible = false
			#ASHTON
	if _check_password == "p":
		ashton_view_activated.emit()
		bellari_view_activated.emit()
		carvano_view_activated.emit()
		dravin_view_activated.emit()
		taurus_view_activated.emit()
	if _check_password == "borna":
		print("welcome ashton")
		ashton_view_activated.emit()
			#BELLARI
	if _check_password == "gustav":
		print("welcome bellari")
		bellari_view_activated.emit()
			#CARVANO
	if _check_password == "max":
		print("welcome carvano")
		carvano_view_activated.emit()
			#DRAVIN
	if _check_password == "wilfred":
		print("welcome dravin")
		dravin_view_activated.emit()
			#TAURUS
	if _check_password == "felix":
		print("welcome taurus")
		taurus_view_activated.emit()
	return

func _button_pressed() -> void:
	password_window.visible = true
	return
