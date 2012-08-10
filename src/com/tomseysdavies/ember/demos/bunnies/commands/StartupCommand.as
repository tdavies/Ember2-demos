package com.tomseysdavies.ember.demos.bunnies.commands
{
	import com.tomseysdavies.ember.demos.bunnies.components.GraphicComponent;
	import com.tomseysdavies.ember.demos.bunnies.components.SpatialComponent;
	import com.tomseysdavies.ember.demos.bunnies.events.Pause;
	import com.tomseysdavies.ember.demos.bunnies.events.Render;
	import com.tomseysdavies.ember.demos.bunnies.events.Tick;
	import com.tomseysdavies.ember.demos.bunnies.systems.BounceSystem;
	import com.tomseysdavies.ember.demos.bunnies.systems.ProcessManager;
	import com.tomseysdavies.ember.demos.bunnies.systems.RenderSystem;
	import com.tomseysdavies.ember.demos.bunnies.systems.nodes.RendererNode;
	import com.tomseysdavies.ember.demos.bunnies.systems.nodes.SpatialNode;
	import com.tomseysdavies.ember.entitySystem.api.IEntityManager;
	import com.tomseysdavies.ember.entitySystem.api.IEntity;
	import com.tomseysdavies.ember.entitySystem.api.ISystemManager;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.swiftsuspenders.Injector;



	public class StartupCommand
	{
		[Embed(source = "com/tomseysdavies/ember/demos/bunnies/assets/wabbit_alpha.png")]
		private const BunnyAsset:Class;
		private const _bunnyAsset:BitmapData = new BunnyAsset().bitmapData;
		
		[Inject]
		public var entities:IEntityManager;
		
		[Inject]
		public var system:ISystemManager;
		
		[Inject]
		public var injector:Injector;
		
		
		public function execute():void{
			// map the event signals
			injector.map(Render).asSingleton();
			injector.map(Tick).asSingleton();
			injector.map(Pause).asSingleton();
			// creates the families and make them ready for injection
			entities.requestFamily(RendererNode);
			entities.requestFamily(SpatialNode);
			// create all the systems
			system.add(RenderSystem);
			system.add(BounceSystem);
			system.add(ProcessManager);
			// create all the bunnies
			for(var i:int=0;i<5500;i++){
				createBunny();
			}
		}
		
		private function createBunny():void{
			// create an entity
			var entity:IEntity =  entities.create();
			// create a random velocity
			var randomVelocity:Point = new Point(Math.random() * 10, (Math.random() * 10) - 5)
			// create the components
			var graphics:GraphicComponent = new GraphicComponent(_bunnyAsset,new Rectangle(0, 0, 26, 37));			
			var spatial:SpatialComponent = new SpatialComponent(new Point(100, 100), randomVelocity);
			// add the components to the entity
			entity.add(graphics);
			entity.add(spatial);
		}
	}
}