package
{
	import com.tomseysdavies.ember.demos.bunnies.commands.StartupCommand;
	import com.tomseysdavies.ember.demos.bunnies.events.ApplicationEvent;
	import com.tomseysdavies.ember.entitySystem.EntitySystemExtension;
	
	import flash.display.Sprite;
	
	import org.robotlegs.v2.core.api.IContext;
	import org.robotlegs.v2.core.impl.ContextBuilder;
	import org.robotlegs.v2.extensions.commandMap.CommandMapExtension;
	import org.robotlegs.v2.extensions.commandMap.impl.CommandMap;
	import org.robotlegs.v2.extensions.eventCommandMap.EventCommandMapExtension;
	import org.robotlegs.v2.extensions.eventCommandMap.api.IEventCommandMap;
	import org.robotlegs.v2.extensions.modularity.ModularityExtension;
	
	[SWF(backgroundColor="#FFFFFF", frameRate="30", width="640", height="480")]
	public class BunniesDemo extends Sprite
	{
		
		
		public function BunniesDemo()
		{
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