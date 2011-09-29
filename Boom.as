﻿package src.punks {	import flash.display.Shape;	public class Boom extends PunksGameObject{				import src.core.Game		import flash.filters.GlowFilter;		import src.punks.levels.Level;		import flash.events.*;				var hitTestRadius = 75;				public function Boom(_shooter){			shooter = _shooter;			friendly = shooter.friendly;			alpha = 0.75;			super();			//STUN			var hitTestArea:Shape = new Shape();			hitTestArea.graphics.beginFill(0xff3333, 0);			hitTestArea.graphics.drawCircle(0,0,hitTestRadius);			hitTestArea.graphics.endFill();			hitTestArea.x = x;			hitTestArea.y = y;			addChild(hitTestArea);			//Visuals			graphics.beginFill(0xffffff, 1);			graphics.drawCircle(0,0,20);			graphics.endFill();						var glow:GlowFilter = new GlowFilter(0xffffaa, 1, 20, 20, 3);			filters = [glow];						addEventListener(Event.ADDED_TO_STAGE, waitForAdded2);			function waitForAdded2(_event:Event):void	{				removeEventListener(Event.ADDED_TO_STAGE, waitForAdded2);				for ( var e:int=0; e<PunksGame.enemyList.length; e++){					if ( hitTestArea.hitTestObject(PunksGame.enemyList[e])) {						//trace("foo " + this);						PunksGame.enemyList[e].stun();					}				}					Level._flash.visible = true;			}		}		override public function behavior():void{			alpha -= 0.2;						if ( counter >= 5 ){				kill();			}					}		override public function kill(){									remove();		}				override public function remove(){															super.remove();		}	}}