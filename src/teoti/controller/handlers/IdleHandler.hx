/*
	Teoti Haxe SDK
	Copyright 2022 Teoti Graphix, LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package teoti.controller.handlers;

import openfl.display.DisplayObjectContainer;
import openfl.events.IEventDispatcher;
import openfl.events.TimerEvent;
import openfl.events.TouchEvent;
import openfl.utils.Timer;
import teoti.app.events.ApplicationEvent;

/**
	Provides a simple Application idle event dispatcher.

	@see `teoti.controller.event.ApplicationEvent.IDLE`
	@since 1.0.0
 */
class IdleHandler {
	//-----------------------------------------------------------------------------
	// Private :: Variables
	//-----------------------------------------------------------------------------
	private var _root:DisplayObjectContainer;
	private var _idleTimer:Timer;
	private var _eventDispatcher:IEventDispatcher;

	//-----------------------------------------------------------------------------
	// Constructor
	//-----------------------------------------------------------------------------

	/**
		Createsa  new idle application handler.
		
		@since 1.0.0
	 */
	public function new(root:DisplayObjectContainer, eventDispatcher:IEventDispatcher, idleDuration:Float = 5000.0) {
		_root = root;

		_root.addEventListener(TouchEvent.TOUCH_BEGIN, touch_touchHandler);

		_idleTimer = new Timer(idleDuration);
		_idleTimer.addEventListener(TimerEvent.TIMER, this_timerHandler);
	}

	//-----------------------------------------------------------------------------
	// API :: Methods
	//-----------------------------------------------------------------------------

	private function restart():Void {
		_idleTimer.reset();
		_idleTimer.start();
	}

	private function cancel():Void {
		_idleTimer.stop();
	}

	//-----------------------------------------------------------------------------
	// Private :: Handlers
	//-----------------------------------------------------------------------------

	private function touch_touchHandler(event:TouchEvent):Void {
		restart();
	}

	private function this_timerHandler(event:TimerEvent):Void {
		ApplicationEvent.dispatch(_eventDispatcher, ApplicationEvent.ACTION_IDLE);
	}
}
