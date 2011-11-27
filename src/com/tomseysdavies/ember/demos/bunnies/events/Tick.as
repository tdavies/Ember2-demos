package com.tomseysdavies.ember.demos.bunnies.events
{
	import org.osflash.signals.Signal;
	
	public class Tick extends Signal
	{
		public function Tick()
		{
			super(Number);
		}
	}
}