package com.tomseysdavies.ember.demos.bunnies.components
{
	import flash.geom.Point;

	public class SpatialComponent
	{
		
		public var position:Point;
		public var velocity:Point;
		
		public function SpatialComponent(position:Point,velocity:Point):void{
			this.position = position;
			this.velocity = velocity;
		}
	}
	
}