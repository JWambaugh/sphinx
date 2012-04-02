package org.wambaugh.sphinx;

import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;

/**
 * ...
 * @author Jordan Wambaugh
 */

class Main 
{
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		// entry point
		trace("hello world!");
	}
	
}