extends Node2D

var score := 0
var best := 0

const BULLET = preload("res://bullet/bullet.tscn")
const SCORE_FEEDBACK = preload("res://world/score_feedback.tscn")


const ENEMY = preload("res://enemy/enemy.tscn")
var enemy_speed := 400