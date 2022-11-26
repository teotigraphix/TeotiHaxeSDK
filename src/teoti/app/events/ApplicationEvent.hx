/*
	Teoti Haxe SDK
	Copyright 2022 Teoti Graphix, LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package teoti.app.events;

import openfl.utils.ObjectPool;
import openfl.events.IEventDispatcher;
import openfl.events.EventType;
import openfl.events.Event;

/**
	Events dispatched by Application.

	@since 1.0.0
**/
class ApplicationEvent extends Event {
	/**
		{data : XVersionUpdate}
	 */
	public static inline var VERSION_UPDATE_CHANGE:EventType<ApplicationEvent> = "application/versionUpdateChange";

	/**
		{data : Boolean}
	 */
	public static inline var ACTION_IS_DIRTY_CHANGE:EventType<ApplicationEvent> = "application/isDirtyChange";

	/**
		{data : String}
	 */
	public static inline var ACTION_STARTUP_MESSAGE:EventType<ApplicationEvent> = "application/startupMessage";

	/**
		{data : null}
	 */
	public static inline var ACTION_PRE_INITIALIZE:EventType<ApplicationEvent> = "application/preInitialize";

	/**
		{data : null}
	 */
	public static inline var ACTION_INITIALIZE:EventType<ApplicationEvent> = "application/initialize";

	/**
		{data : null}
	 */
	public static inline var ACTION_IDLE:EventType<ApplicationEvent> = "application/idle";

	//-----------------------------------------------------------------------------
	// API :: Properties
	//-----------------------------------------------------------------------------
	public var data(default, null):Dynamic;

	//-----------------------------------------------------------------------------
	// Constructor
	//-----------------------------------------------------------------------------

	/**
		Creates a new `ApplicationEvent` object with the given arguments.

		@see `ApplicationEvent.dispatch`

		@since 1.0.0
	**/
	public function new(type:String, data:Dynamic = null, bubbles:Bool = false, cancelable:Bool = false) {
		super(type, bubbles, cancelable);
		this.data = data;
	}

	//-----------------------------------------------------------------------------
	// Overriden :: Methods
	//-----------------------------------------------------------------------------

	override public function clone():Event {
		return new ApplicationEvent(type, data, bubbles, cancelable);
	}

	//-----------------------------------------------------------------------------
	// API :: Methods
	//-----------------------------------------------------------------------------

	public static function dispatch(dispatcher:IEventDispatcher, type:String, bubbles:Bool = false, cancelable:Bool = false):Bool {
		var event = _pool.get();
		event.type = type;
		event.bubbles = bubbles;
		event.cancelable = cancelable;
		var result = dispatcher.dispatchEvent(event);
		_pool.release(event);
		return result;
	}

	//-----------------------------------------------------------------------------
	// Internal :: Methods
	//-----------------------------------------------------------------------------
	private static var _pool = new ObjectPool<ApplicationEvent>(() -> return new ApplicationEvent(null, null, false, false), (event) -> {
		event.target = null;
		event.currentTarget = null;
		event.__preventDefault = false;
		event.__isCanceled = false;
		event.__isCanceledNow = false;
		event.data = null;
	});
}
