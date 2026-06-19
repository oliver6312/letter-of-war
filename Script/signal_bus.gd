extends Node2D

@onready var password_checker: Node2D = $"../PasswordChecker"

func _ready() -> void:
	password_checker.ashton_view_activated.connect(_on_ashton_password_accepted)
	password_checker.bellari_view_activated.connect(_on_bellari_password_accepted)
	password_checker.carvano_view_activated.connect(_on_carvano_password_accepted)
	password_checker.dravin_view_activated.connect(_on_dravin_password_accepted)
	password_checker.taurus_view_activated.connect(_on_taurus_password_accepted)

func _on_ashton_password_accepted():
	print("Correct password entered!")

func _on_bellari_password_accepted():
	print("Correct password entered!")

func _on_carvano_password_accepted():
	print("Correct password entered!")

func _on_dravin_password_accepted():
	print("Correct password entered!")

func _on_taurus_password_accepted():
	print("Correct password entered!")
