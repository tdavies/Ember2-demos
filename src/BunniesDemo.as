package
{
	import com.adobe.viewsource.ViewSource;
	import com.tomseysdavies.ember.demos.bunnies.commands.StartupCommand;
	import com.tomseysdavies.ember.demos.bunnies.events.ApplicationEvent;
	import com.tomseysdavies.ember.entitySystem.EntitySystemExtension;
	
	import flash.display.Sprite;
	
	import robotlegs.bender.core.api.IContext;
	import robotlegs.bender.core.impl.ContextBuilder;
	import robotlegs.bender.extensions.commandMap.CommandMapExtension;
	import robotlegs.bender.extensions.commandMap.impl.CommandMap;
	import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.modularity.ModularityExtension;
	
	[SWF(backgroundColor="#FFFFFF", frameRate="30", width="640", height="480")]
	public class BunniesDemo extends Sprite
	{
		
		
		public function BunniesDemo()
		{
			
			// note this will be a bundle
			ViewSource.addMenuItem(this, "srcview/index.html"); 
			var builder:ContextBuilder = new ContextBuilder();
			builder.withContextView(this)
			builder.withExtension(EntitySystemExtension);
			builder.withExtension(CommandMapExtension);
			builder.withExtension(EventCommandMapExtension);
			var context:IContext = builder.build();
			
			var commandMap:IEventCommandMap = context.injector.getInstance(IEventCommandMap);
			commandMap.map(ApplicationEvent.STARTUP,ApplicationEvent).toCommand(StartupCommand);
			context.dispatcher.dispatchEvent(new ApplicationEvent(ApplicationEvent.STARTUP));
		}
	}
}