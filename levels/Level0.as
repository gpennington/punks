﻿package src.punks.levels {	import flash.display.MovieClip;	import flash.events.Event;//	import flash.display.GradientType;//	import flash.geom.Matrix;//	import flash.display.Shape;	import flash.geom.ColorTransform;	import src.core.Game;	import src.punks.*	public class Level0 extends Level{				var enemy;				public function Level0(){				super();				levelLength = 2000;			allowedEnemies = 2;			//Then Activate			Fireworks.list[Fireworks.getIndex("shell")].active = true;			Fireworks.list[Fireworks.getIndex("fountain")].active = true;			Fireworks.list[Fireworks.getIndex("rocket")].active = true;			Fireworks.list[Fireworks.getIndex("maroon")].active = true;			Fireworks.list[Fireworks.getIndex("m80")].active = true;			Fireworks.list[Fireworks.getIndex("starcatcher")].active = true;			Fireworks.list[Fireworks.getIndex("delete")].active = true;						//skyGrad.transform.colorTransform = new ColorTransform(1,1,1,1, 100);					}		override function waitForAdded(e:Event){			super.waitForAdded(e);						//Preplace Fireworks			Lanes.buyFirework("shell", 1);			Lanes.buyFirework("shell", 3);			//Lanes.buyFirework("shell", 4);			//Lanes.buyFirework("shell", 6);			//Lanes.buyFirework("rocket", 9);			//Lanes.buyFirework("rocket", 11);			//Lanes.buyFirework("rocket", 13);			Lanes.buyFirework("starcatcher", 2);			Lanes.buyFirework("starcatcher", 5);					}		override function counterTrigger(){				super.counterTrigger();						if ( counter % 60 == 0 && counter < levelLength ){				enemy = new Enemy();				middleLayer.addChild(enemy);							}						if ( counter % 120 == 0 && counter < levelLength ){				enemy = new Enemy2();				middleLayer.addChild(enemy);							}						if ( counter % 120 == 0 && counter < levelLength && counter != 0  ){				enemy = new Enemy3();				middleLayer.addChild(enemy);							}					}////		override public function exitTrigger(){	//			super.exitTrigger();////			//Game.gameRef.loadLevel("level1", false);//		}	}}