package org.wambaugh.sphinx;

import firmament.core.FCamera;
import firmament.core.FPhysicsEntity;
import firmament.core.FGame;
import firmament.core.FPhysicsWorld;
import firmament.core.FVector;

import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.Lib;
import nme.utils.WeakRef;
import org.wambaugh.sphinx.draw.DrawCanvas;
import org.wambaugh.sphinx.entities.Grunt;
import org.wambaugh.sphinx.map.Background;
import org.wambaugh.sphinx.map.Ground;
import org.wambaugh.sphinx.map.ModerateForceField;
import org.wambaugh.sphinx.map.ModerateWall;
import org.wambaugh.sphinx.map.StrongWall;
import org.wambaugh.sphinx.map.StrongForceField;
import org.wambaugh.sphinx.map.WeakForceField;
import org.wambaugh.sphinx.map.WeakWall;
import nme.display.Sprite;
import nme.display.Bitmap;
import nme.text.TextField;
import nme.events.MouseEvent;
import nme.Assets;
import nme.events.Event;
import firmament.utils.FAutoCrop;
import firmament.utils.loader.FEntityLoader;


/**
 * ...
 * @author Jordan Wambaugh
 */

class Main 
{
	
	static public function main() 
	{
		
		
		#if (flash9 || flash10)
		haxe.Log.trace = function(v,?pos) { untyped __global__["trace"](pos.className+"#"+pos.methodName+"("+pos.lineNumber+"):",v); }
		#elseif flash
		haxe.Log.trace = function(v,?pos) { flash.Lib.trace(pos.className+"#"+pos.methodName+"("+pos.lineNumber+"): "+v); }
		#end
		trace('no tracing?');
		
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
		
		var logo = new Bitmap(Assets.getBitmapData("assets/SpaceGateLogo.png"));
		logo.x =200;
		logo.y = 0;
		var logoMaker = new nme.display.Sprite();
		stage.addChild(logoMaker);
		logoMaker.addChild(logo);
		
		
		
	
		camera.setZoom(100);
		
		
		
		
		var playButton = new Bitmap(Assets.getBitmapData("assets/GreenButton.png"));
		playButton.x = 0;
		playButton.y = 300;
		
		playButton.addEventListener(MouseEvent.CLICK, function(e:MouseEvent) { 
			trace('Clicked!'); 
		} );
		
		var mainMenu = new nme.display.Sprite();
		stage.addChild(mainMenu);
		mainMenu.addChild(playButton);
		
		var draw = new DrawCanvas(300, 300);
		
		
		draw.addEventListener(DrawCanvas.DONE_DRAW, function(e:Event) {
			trace('done_drawcalled!');
			
			var shapes = draw.getShapes( { restitution:.4,density:.5 } );
			if (shapes == null) return;
			stage.removeChild(draw);
			
			if(shapes!=null){
				var blob = new FPhysicsEntity(world, { 
					type:'dynamic'
					,position:new FVector( -1, -2.5)
					,sprite: FAutoCrop.crop(draw.bitmap.bitmapData)
					,shapes:shapes
					} );
			}
		});
		stage.addChild(draw);
		
		/*
		var ent = new FPhysicsEntity(world, {
			type:'dynamic'
			,position:new FVector( -.6, -2.1)
			,sprite:Assets.getBitmapData("assets/alien.png")
			,imageScale:712
			,angle:.5
			,shapes:[{ 
				type: 'box'
				,width:.3441
				,height:.5
				,restitution:.1
				,density:.5
				,friction:.7
				}]
			
		});*/
		
		
		
		var background = new Background (world);
		
		
		
		//load our map!
		var loader:FEntityLoader = FEntityLoader.getInstance();
		
		loader.loadMap("assets/maps/map1.json", world);
		
		
	
	}
	
}