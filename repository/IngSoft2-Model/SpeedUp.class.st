Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#instVars : [
		'effectNumber'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpeedUp class >> on: boardNumber [

	| effectNumber |
	effectNumber := 4.
	
	self assertNumberGreaterThanZero: boardNumber.
		
	^ self new 
		initialize:  'SpeedUp'
		with: effectNumber.
]

{ #category : #playing }
SpeedUp >> applyEffectOn: player within: game [

	| newPosition |
	game beAtPlay:player.
	newPosition := GameHandler new
	moveForward: player
	to: player boardSquare  + effectNumber
	within: game.
	player square: newPosition.
	game lastSteppedOn: self.
]

{ #category : #accessing }
SpeedUp >> effectNumber [

	^ effectNumber.
]

{ #category : #initialization }
SpeedUp >> initialize: name with: effect [

	effectNumber := effect.
	type := name.
]
