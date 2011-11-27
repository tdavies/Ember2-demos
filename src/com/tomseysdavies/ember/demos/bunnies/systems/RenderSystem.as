package com.tomseysdavies.ember.demos.bunnies.systems
{

	import com.tomseysdavies.ember.demos.bunnies.components.GraphicComponent;
	import com.tomseysdavies.ember.demos.bunnies.events.Render;
	import com.tomseysdavies.ember.demos.bunnies.systems.nodes.RendererNode;
	import com.tomseysdavies.ember.entitySystem.api.ISystem;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	


	public class RenderSystem  implements ISystem
	{
		private const MIN_X:int = 0;
		private const MAX_X:int = 640;
		private const MIN_Y:int = 0;
		private const MAX_Y:int = 480;
		
		private const BLANK_RECT:Rectangle = new Rectangle(MIN_X, MIN_Y, MAX_X, MAX_Y);


		[Inject]
		public var contextView:DisplayObjectContainer;

		[Inject]
		public var render:Render;
		
		[Inject]
		public var rendererNodes:Vector.<RendererNode>;

		private var _bitmap:Bitmap;
		private var _buffer:BitmapData;
		

		public function initialize():void
		{
			_buffer = new BitmapData(MAX_X, MAX_Y, false, 0xFFFFFF);
			_bitmap = new Bitmap(_buffer);
			contextView.addChild(_bitmap);
			render.add(onRender);
		}

		public function onRender():void
		{
			_buffer.lock();
			_buffer.fillRect(BLANK_RECT, 0xFFFFCC);
			for each(var node:RendererNode in rendererNodes){
				_buffer.copyPixels(node.graphic.asset, node.graphic.rect, node.spatial.position, null, null, true);
			}
			_buffer.unlock();
		}

		public function destroy():void
		{
			contextView.removeChild(_bitmap);
			_buffer.dispose();
			_buffer = null;
			_bitmap = null;
		}
	}
}