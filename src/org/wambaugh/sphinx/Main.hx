package org.wambaugh.sphinx;

import firmament.core.FCamera;
import firmament.core.FGame;
import firmament.core.FPhysicsWorld;
import firmament.core.FVector;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import nme.utils.WeakRef;
import org.wambaugh.sphinx.entities.Grunt;
import org.wambaugh.sphinx.map.Ground;
import org.wambaugh.sphinx.map.WeakForceField;
import org.wambaugh.sphinx.map.WeakWall;
import nme.display.Sprite;
import nme.display.Bitmap;
import nme.text.TextField;
import nme.events.MouseEvent;
import nme.Assets;

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
		var camera = new FCamera(stage.stageWidth, stage.stageHeight);
		stage.addChild(camera);
		var world = new FPhysicsWorld(new FVector(0, 10));
		var game = new FGame();
		game.addWorld(world);
		game.addCamera(camera);
		var grunt = new Grunt(world, {
			position: new FVector(0,0)
			} );
		var ground = new Ground(world);
		camera.setZoom(100);
		var weakWall = new WeakWall (world, {
		position: new FVector(-.5,0)
		} );
		var weakForceField = new WeakForceField (world, {
		position: new FVector( 0,.2), radius:.35
		});
		
		var playButton = new Bitmap(Assets.getBitmapData("assets/playButton.png"));
		playButton.x = 100;
		playButton.y = 100;
		
		playButton.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) { 
			trace('Clicked!'); 
		} );
		var mainMenu = new nme.display.Sprite();
		stage.addChild(mainMenu);
		mainMenu.addChild(playButton);
						
	}
	
}