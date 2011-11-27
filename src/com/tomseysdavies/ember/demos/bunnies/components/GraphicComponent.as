package com.tomseysdavies.ember.demos.bunnies.components
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class GraphicComponent
	{
		
		
		public var asset:BitmapData;
		public var rect:Rectangle;
		
		public function GraphicComponent(asset:BitmapData = null, rect:Rectangle=null){
			this.asset = asset;
			this.rect = rect;
		}		
		
	}
}