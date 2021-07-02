import hxd.res.DefaultFont;
import h2d.Console;
import hxd.Window;
import Bar.State;

class Pong extends hxd.App {
    //* Game Variables
    var bar : Bar;
    var windowHeight: Int;
    var windowWidth : Int;
    var horizontalSpace : Int = 50;

    //* Debug Variables
    var console : h2d.Console;

    override function init() {

        //* Setup the Debug Console
        console = new Console(DefaultFont.get(),s2d);
        console.show();

        //* Get Screen Size
        windowHeight = hxd.Window.getInstance().height;
        windowWidth = hxd.Window.getInstance().width;

        console.log(Std.string(windowWidth));
        console.log(Std.string(windowHeight));

        //* Initilize the Bar

        var player1x = horizontalSpace;
        var player1y = windowHeight/2;
        bar = new Bar(player1x,player1y,State.PLAYER);
    }
    // on each frame
    override function update(dt:Float) {
    }

    //* Instantiate the Scene
    public static var inst:Pong;

    static function main() {

        inst = new Pong();
    }
    
    
}