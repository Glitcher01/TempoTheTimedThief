extends Node2D

#================TREASURE================
# Permanent treasure count.
var held_treasure: int = 0		
# Holds a temporary amount of treasure that is accrued
# per level. If the player completes the level, this value is added
# to held_treasure.
var temp_treasure: int = 0		
var max_treasure: int = 99999
#================KEYS================
var temp_keys: int = 0
var max_keys: int = 100
#================ARTIFACTS================
# A dictionary of artifacts that can be found in levels.
var artifacts: int = 0
