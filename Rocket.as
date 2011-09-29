﻿package src.punks {	import src.core.Game;	import src.punks.levels.Level;		public class Rocket extends Projectile{						var spark:Spark;		var numSpark;				var sound_shell:SoundShell = new SoundShell();		public function Rocket(_shooter){			shooter = _shooter;			angle = (Math.random() * 40) - 20;			angle = 0;			speed = 14 + ( Math.random() * 2);			damage = 40 + ( shooter.level * 20 );			super(_shooter, angle, speed, damage);			numSpark= shooter.level * 6; //Math.pow(2,2 + shooter.level); //8,16,32,64,128,...			inertia = ( Math.random() * 3 ) - 1.5;			life = 200;			friendly = shooter.friendly;		}		override public function behavior():void{			super.behavior();						var particle:Particle;			for ( var p:int=0; p<3; p++){				particle = new Particle();				particle.x = x + ( Math.random() * 6 ) - 3;				particle.y = y + ( Math.random() * 6 ) - 3;				PunksGame.currentLevel.topLayer.addChild(particle);			}					}		override public function move(){						super.move()									//speed x radians			y += speedY * Math.sin((angle - 90) * (Math.PI / 180));			x += speedX * Math.cos((angle - 90) * (Math.PI / 180));						//speedY -= gravity;			//speedX -= inertia;			angle += inertia;			rotation += inertia;			//alpha -= 0.005;					}		override public function kill(){						sound_shell.play();						//Explode			//var colors:Array = new Array(0xffffff, 0xff0000, 0x00ff00, 0x0000ff, 0xffff00, 0x00ffff, 0xff00ff);			//var colorID:int = Math.floor(Math.random()*colors.length);			for (var p=0; p<numSpark ; p++){				var spread = ( (360 / numSpark) * p ) + Math.random() * 60;				spark = new Spark(this, 0xff0000,spread)				PunksGame.currentLevel.topLayer.addChild(spark);			}			Level._flash.visible = true;						super.kill()		}				override public function remove(){															super.remove();		}	}}