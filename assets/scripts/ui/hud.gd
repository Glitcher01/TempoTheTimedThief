extends Control


@onready var treasure_label: Label = $VBoxContainer/Treasure/TreasureLabel
@onready var keys_label: Label = $VBoxContainer/Keys/KeysLabel
@onready var artifacts_label: Label = $VBoxContainer/Artifacts/ArtifactsLabel

func _process(delta: float) -> void:
	treasure_label.text = str(GameManager.temp_treasure)
	keys_label.text = str(GameManager.temp_keys)
	# temporary artifacts label		
	artifacts_label.text = "%s/3" % str(GameManager.artifacts)
