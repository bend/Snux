﻿package {	import flash.display.MovieClip;	public class ContainerCadre extends MovieClip {		private var cadre:MovieClip;		public function ContainerCadre() {		}		public function addContainerCadreH():MovieClip {			cadre= new CadreH();			this.addChild(cadre);			return this;		}		public function addContainerCadreV():MovieClip {			cadre= new CadreV();			this.addChild(cadre);			return this;		}		public function testSerpentHitCadre(vectSerpent:Array):Boolean{			return (this.hitTestPoint(vectSerpent[0].x, vectSerpent[0].y,false));								}					}//fin class}//fin package