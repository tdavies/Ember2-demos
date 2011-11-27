package com.tomseysdavies.ember.demos.bunnies.systems
{

	import com.tomseysdavies.ember.demos.bunnies.events.Pause;
	import com.tomseysdavies.ember.demos.bunnies.events.Render;
	import com.tomseysdavies.ember.demos.bunnies.events.Tick;
	import com.tomseysdavies.ember.entitySystem.api.ISystem;
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.utils.getTimer;


	/**
	 * handles the ai and render loop
	 * @author Tom Davies
	 */
	public class ProcessManager implements ISystem
	{
		private const TO_SECONDS:Number = 1 / 1000;

		private var _startTime:uint;

		[Inject]
		public var viewContext:DisplayObjectContainer;

		[Inject]
		public var gameTick:Tick;

		[Inject]
		public var render:Render;

		[Inject]
		public var pause:Pause;

		private var _paused:Boolean;

		public function initialize():void
		{
			_startTime = getTimer();
			viewContext.addEventListener(Event.ENTER_FRAME, frameHandler);
			pause.add(onPause);
		}

		private function onPause(paused:Boolean):void
		{
			_paused = paused;
		}

		private function frameHandler(e:Event):void
		{
			var time:uint = getTimer();
			var t:Number = (time - _startTime) * TO_SECONDS;
			_startTime = time;
			
			if (!_paused)
				gameTick.dispatch(t);
				
			render.dispatch();
		}

		public function destroy():void
		{
			viewContext.removeEventListener(Event.ENTER_FRAME, frameHandler);
			pause.remove(onPause);
			viewContext = null;
		}

	}

}