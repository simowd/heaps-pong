import hxd.Key;
import hxd.res.DefaultFont;
import h2d.Console;
import Bar.State;

class Pong extends hxd.App {
    //* Game Variables
    public var bar1 : Bar;
    public var bar2 : Bar;
    var ball : Ball;

    var horizontalSpace : Int = 50;

    public var windowHeight: Int;
    public var windowWidth : Int;
    

    //* Debug Variables
    public var console : h2d.Console;

    override function init() {

        //* Setup the Debug Console
        console = new Console(DefaultFont.get(),s2d);

        //* Get Screen Size
        windowHeight = hxd.Window.getInstance().height;
        windowWidth = hxd.Window.getInstance().width;

        console.log(Std.string(windowWidth));
        console.log(Std.string(windowHeight));

        //* Initilize the Player 1 Bar

        var player1x = horizontalSpace;
        var player1y = windowHeight/2;
        bar1 = new Bar(player1x,player1y,State.PLAYER1);

        //* Initilize the Player 2 Bar

        var player2x = windowWidth - horizontalSpace;
        var player2y = windowHeight/2;
        bar2 = new Bar(player2x,player2y,State.CPU);

        //* Initilize Ball
        ball = new Ball();
    }
    // on each frame
    override function update(dt:Float) {
        bar1.update(dt);
        bar2.update(dt);
        showConsole();
        ball.update(dt);
    }

    //* Instantiate the Scene
    public static var inst:Pong;

    static function main() {
        hxd.Res.initEmbed();
        inst = new Pong();
    }

    //! Ingame Debug Console View
    function showConsole() {
        if(Key.isPressed(Key.ESCAPE)){
            if(console.isActive()){
                console.hide();
            }
            else{
                console.show();
            }
        }
    }
    
    
}