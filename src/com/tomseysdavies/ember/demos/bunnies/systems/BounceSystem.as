package com.tomseysdavies.ember.demos.bunnies.systems
{
	import com.tomseysdavies.ember.demos.bunnies.components.SpatialComponent;
	import com.tomseysdavies.ember.demos.bunnies.events.Tick;
	import com.tomseysdavies.ember.demos.bunnies.systems.nodes.SpatialNode;
	import com.tomseysdavies.ember.entitySystem.api.ISystem;


	
	public class BounceSystem  implements ISystem
	{

		[Inject]
		public var spatialNodes:Vector.<SpatialNode>;
		
		[Inject]
		public var tick:Tick;
		
		private const _maxX:int = 640;
		private const _minX:int = 0;
		private const _maxY:int = 480;
		private const _minY:int = 0;
		private const _gravity:int = 3;
		

		public function initialize():void
		{
			
			tick.add(onTick);
		}
		
		public function onTick(t:Number):void
		{

			for each(var spatialNode:SpatialNode in spatialNodes){
				var spatial:SpatialComponent = spatialNode.spatial;
				spatial.position.x += spatial.velocity.x;
				spatial.position.y += spatial.velocity.y;				
				spatial.velocity.y += _gravity;
				
				if (spatial.position.x > _maxX)
				{
					spatial.velocity.x *= -1;
					spatial.position.x = _maxX;
				}
				else if (spatial.position.x < _minX)
				{
					spatial.velocity.x *= -1;
					spatial.position.x = _minX;
				}
				
				if (spatial.position.y > _maxY)
				{
					spatial.velocity.y *= -0.8;
					spatial.position.y = _maxY;
					
					if (Math.random() > 0.5)
					{
						spatial.velocity.y -= Math.random() * 12;
					}
				} 
				else if (spatial.position.y < _minY)
				{
					spatial.velocity.y = 0;
					spatial.position.y = _minY;
				}
			}
		}
		
		public function destroy():void{
			
		}
			
		
	}
}