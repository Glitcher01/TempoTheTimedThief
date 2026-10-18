extends Area2D

# Reference to the AnimationPlayer child node.
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sparkles: AnimatedSprite2D = $Sparkles

@onready var small_loot: Array = [1, 5, 10, 20]
@onready var large_loot: Array = [10, 20, 50, 100]

@onready var opened: bool = false

# Preload the basic treasure scene.
var basic_treasure = preload("res://assets/scenes/items and interactables/treasure/basic_treasure.tscn")

func _on_area_entered(area: Area2D) -> void:
	if area.name == "DiveKick":
		area.get_parent().dive_bounce()
	animation_player.play("Open")
	sparkles.visible = false
	
	# If the chest has already been opened, do not spawn more treasure.
	if opened == true:
		pass
	else:
		AudioManager.play_chest_open()
		# The loot provided will differ based on the size of the chest.
		if self.name.contains("Small"):
			for i in range(8):
				var loot_choice = small_loot.pick_random()
				spawn(loot_choice, global_position + Vector2(0, -3))		
		elif self.name.contains("Large"):
			for i in range(5):
				var loot_choice = large_loot.pick_random()
				spawn(loot_choice, global_position + Vector2(0, -3))	
		opened = true

# Function to spawn basic treasure.
func spawn(loot_choice: int, spawn_position: Vector2):
	var treasure_instance = basic_treasure.instantiate()
	
	treasure_instance.global_position = spawn_position
	get_parent().call_deferred("add_child", treasure_instance)
	treasure_instance.chestspawn = true
	treasure_instance.set_rarity(int(loot_choice))
	
