package com.tomseysdavies.ember.demos.bunnies.events
{
	import flash.events.Event;
	
	public class ApplicationEvent extends Event
	{
		public static const STARTUP:String = "startup";
		
		public function ApplicationEvent(type:String)
		{
			super(type, false, false);
		}
	}
}