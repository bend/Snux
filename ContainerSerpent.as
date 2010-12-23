﻿package {	import flash.display.MovieClip;	import flash.display.Stage;	import flash.display.DisplayObject;	import flash.display.Sprite;	import flash.display.Graphics;	public class ContainerSerpent extends MovieClip {		private var serpent:MovieClip;		public function ContainerSerpent(pos_x:Number,pos_y:Number) {			this.x=310;			this.y=310;		}		//--------------------------------------------------------------------------------------------------------------------------------		public function addContainerSerpentHead():MovieClip {			serpent=new SerpentHead  ;			this.addChild(serpent);			return this;		}		//--------------------------------------------------------------------------------------------------------------------------------		public function addContainerSerpentBody():MovieClip {			serpent=new SerpentBody  ;			this.addChild(serpent);			return this;		}		//--------------------------------------------------------------------------------------------------------------------------------		//--------------------------------------------------------------------------------------------------------------------------------		public function setTailleSerpent(n:Number,vectSerpent:Array,keyTouch:Array):Array {			var i:Number;			var container:MovieClip;			container=new ContainerSerpent(300,300);			container=container.addContainerSerpentHead();			vectSerpent.push(container);			for (i=1; i < n; i++) {				container=new ContainerSerpent(300,300);				container=container.addContainerSerpentBody();				vectSerpent.push(container);				//gauche, droite, bas, haut				vectSerpent[i].x=vectSerpent[i-1].x+20;				vectSerpent[i].y=vectSerpent[i-1].y;			}			vectSerpent[vectSerpent.length-1].x=vectSerpent[vectSerpent.length-2].x+20;			vectSerpent[vectSerpent.length-1].y=vectSerpent[vectSerpent.length-2].y;			return vectSerpent;		}		//--------------------------------------------------------------------------------------------------------------------------------		public function incrementeTailleSerpent(tailleSerpent:Number ,vectSerpent:Array, keyTouch:Array, newTailleSerpent:Number,containerScreen:MovieClip ):Array {			var i:Number;			var container:MovieClip;			//gauche, droite, bas, haut			for (i=vectSerpent.length-1; i<newTailleSerpent; i++) {				container=new ContainerSerpent(300,300);				container=container.addContainerSerpentBody();				vectSerpent.push(container);				if (keyTouch[0] == 1) {					vectSerpent[i].x=vectSerpent[i-1].x + 20;					vectSerpent[i].y=vectSerpent[i - 1].y;				} else if (keyTouch[1] == 1) {					vectSerpent[i].x=vectSerpent[i - 1].x - 20;					vectSerpent[i].y=vectSerpent[i - 1].y;					vectSerpent[i].rotation=180;				} else if (keyTouch[2] == 1) {					vectSerpent[i].y=vectSerpent[i - 1].y - 20;					vectSerpent[i].x=vectSerpent[i - 1].x;					vectSerpent[i].rotation=-90;				} else if (keyTouch[3] == 1) {					vectSerpent[i].x=vectSerpent[i - 1].y + 20;					vectSerpent[i].x=vectSerpent[i - 1].x;					vectSerpent[i].rotation=90;				}				containerScreen.addChild(vectSerpent[i]);			}			return vectSerpent;		}		//--------------------------------------------------------------------------------------------------------------------------------		public function decrementeTailleSerpent(tailleSerpent:Number, vectSerpent:Array, newTailleSerpent:Number,containerScreen:MovieClip):Array {			var Nb :Number= vectSerpent.length-newTailleSerpent;			if (vectSerpent.length>4) {				for (var i=vectSerpent.length-1; i>newTailleSerpent; i--) {					containerScreen.removeChild(vectSerpent[i-1]);					vectSerpent.pop();				}			}			return vectSerpent;		}		//--------------------------------------------------------------------------------------------------------------------------------		public function moveSerpent(vectSerpent:Array,keyTouch:Array,speed:Number) {			var i:Number;			for (i=vectSerpent.length - 1; i > 0; i--) {				//gauche, droite, bas, haut				vectSerpent[i].x=vectSerpent[i - 1].x;				vectSerpent[i].y=vectSerpent[i - 1].y;				if (keyTouch[0] == 1) {					vectSerpent[i].rotation= 0;				} else if (keyTouch[1] == 1) {					vectSerpent[i].rotation= 180;				} else if (keyTouch[2] == 1) {					vectSerpent[i].rotation= -90;				} else if (keyTouch[3] == 1) {					vectSerpent[i].rotation= 90;				}			}			//gauche, droite, bas, haut			if (keyTouch[0]==1) {				vectSerpent[0].x-=speed;				vectSerpent[0].rotation= 0;			} else if (keyTouch[1]==1) {				vectSerpent[0].x+=speed;				vectSerpent[i].rotation= 180;			} else if (keyTouch[2]==1) {				vectSerpent[0].y+=speed;				vectSerpent[0].rotation= -90;			} else if (keyTouch[3]==1) {				vectSerpent[0].y-=speed;				vectSerpent[0].rotation= 90;			}		}		//		//--------------------------------------------------------------------------------------------------------------------------------		//--------------------------------------------------------------------------------------------------------------------------------		public function testSerpentHitPomme(containerPomme:MovieClip,vectSerpent:Array):Boolean {			if (vectSerpent[0].hitTestPoint(containerPomme.x, containerPomme.y,false)) {				return true;			} else {				return false;			}		}		//--------------------------------------------------------------------------------------------------------------------------------		//--------------------------------------------------------------------------------------------------------------------------------		public function testSerpentHitSelf(vectSerpent:Array):Boolean {			var i;			for (i=1; i<vectSerpent.length-1; i++) {				if (vectSerpent[0].hitTestPoint(vectSerpent[i].x,vectSerpent[i].y,false)) {					return true;				}			}			return false;		}		//--------------------------------------------------------------------------------------------------------------------------------		public function testSerpentOver(vectSerpent:Array,containerScreen:MovieClip,tailleX:Number,tailleY:Number):Array {			if (vectSerpent[0].y<10) {				vectSerpent[0].y=tailleY-10;			} else if (vectSerpent[0].x<0) {				vectSerpent[0].x=tailleX-10;			} else if (vectSerpent[0].y>tailleY-10) {				vectSerpent[0].y=10;			} else if (vectSerpent[0].x>tailleX-10) {				vectSerpent[0].x=10;			}			return vectSerpent;		}	}//fin class}//fin package