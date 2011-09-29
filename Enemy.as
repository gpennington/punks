﻿package src.punks {	import flash.display.MovieClip;	import flash.display.Shape;	import flash.events.*	import flash.utils.Timer;	import flash.geom.Point;	import flash.display.BlendMode;	import flash.geom.ColorTransform;	import src.core.Game;	public class Enemy extends PunksGameObject {		var speedMax:Number;		var speed:Number;				var stunnedStart:Number;		var stunnedLength:Number = 96;				var sound_laser:SoundLaser = new SoundLaser();				//		var targetAngle:Number;////		var radio:Radio;//		//		var colorOffset:Number = 10;////		var healthBar:Shape;//		var value:Number;		//AI//		//MOVING//		var orders:String;//		var moveDirection:Number;//		//		var readyToMove:Boolean = true;//		var possibleMovements:Array = [];//		var whichMovement:String;//		//		var movementStart:Number = 0;//		var movementCooldown:Number = 0;//		//		var movementCompleted:Boolean = false;						//ACTIONS//		var readyForAction:Boolean = true;//		var possibleActions:Array = [];//		var whichAction:int;////		var actionStart:Number = 0;//		var actionCooldown:Number = 24 + (Math.floor(Math.random() * 72)) // 1 - 5 seconds at 24fps////		var shootTimer:Timer;		//					 (xPos, yPos, bodyLevel, weaponLevel, abilityLevel, [ abilityType, orders, commandingOfficer])		public function Enemy(){						isVunerable = true;			friendly = false;			hp = 100;			speedMax = 5;			speed = speedMax;			PunksGame.enemyList.push(this);			x = 40 + (Math.random() * 400);			y = 40;			//Visual//			graphics.beginFill( 0x555555, 1);//			graphics.drawCircle( 0, 0, 20);//			graphics.endFill();					}		override public function behavior():void{						move();						//If stunned for long enough, unstun			if ( counter - stunnedStart > stunnedLength){				unstun();			}						if ( y >= 560){				land();			}			//			if ( counter % 87 == 0  && counter != 0 ){//				var laser = new Laser(this);//				laser.x = x;//				laser.y = y;//				PunksGame.currentLevel.middleLayer.addChild(laser);//				//				sound_laser.play();//			}		}		private function move(){						y += speed;						if ( this.y < -10 || this.y > 650 || this.x < -10 || this.x > 490) { //if offscreen				//stillMoving = false;				remove();			}								}						public function stun(){			//trace("i'm stunned!");						speed = 0;			stunnedStart = counter;		}				public function unstun(){			//trace("unstunned!");						speed = speedMax;			stunnedStart = undefined;		}				private function land(){						//Add to landed list			//PunksGame.landedList.push(this);			PunksGame.currentLevel.landedEnemies++;						//Search EnemyList and delete from array			for(var i=0; i < PunksGame.enemyList.length; i++){				if( PunksGame.enemyList[i]==this) { PunksGame.enemyList.splice(i,1) };			}			if ( this.hasEventListener(Event.ENTER_FRAME) ){				removeEventListener(Event.ENTER_FRAME, onFrame);			}			//trace("An Enemy got through");		}		override public function kill(){						//Search list and delete from array			for(var i=0; i < PunksGame.enemyList.length; i++)			{				if( PunksGame.enemyList[i]==this) { PunksGame.enemyList.splice(i,1) };			}			//Keep Score			//Player.xp += value;			//var pu:PopUp = new PopUp("+" + value);						//PunksGame.currentLevel.topLayer.addChild(pu);			//pu.x = x;			//pu.y = y;						//Powerup						var star:Star			for (var s:int=0; s<3; s++){				var starValue = 1;				if ( Math.random() < 0.1 ){					starValue = 5;				}				star = new Star(this, Math.random() * 360, starValue);				star.x = x;				star.y = y;				PunksGame.currentLevel.topLayer.addChild(star);			}									super.kill();			remove();					}				override public function remove(){			//Search list and delete from array			for(var i=0; i < PunksGame.enemyList.length; i++)			{				if(PunksGame.enemyList[i]==this) { PunksGame.enemyList.splice(i,1) };			}						super.remove();					}									}}