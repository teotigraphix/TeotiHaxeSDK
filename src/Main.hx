/*
	Teoti Haxe SDK - Teoti Graphix, LLC

	Copyright 2022 Teoti Graphix, LLC. All Rights Reserved.

	This program is free software. You can redistribute and/or modify it in
	accordance with the terms of the accompanying license agreement.
 */

package;

import feathers.controls.Application;

class Main extends Application {
	//-----------------------------------------------------------------------------
	// Constructor
	//-----------------------------------------------------------------------------
	public function new() {
		super();

		preinitialize();
	}

	//-----------------------------------------------------------------------------
	// Overriden :: Methods
	//-----------------------------------------------------------------------------

	private override function initialize():Void {
		super.initialize();

		stage.color = 0x242424;
	}

	private override function update():Void {
		super.update();
	}

	//-----------------------------------------------------------------------------
	// Internal :: Methods
	//-----------------------------------------------------------------------------

	private function preinitialize() {}
}
