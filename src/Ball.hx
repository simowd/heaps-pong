import h2d.Bitmap;
import Random;

class Ball {
    static var SPEED : Int = 150;
    
    var game : Pong;
    var bmp : h2d.Bitmap;

    var x : Float;
    var y : Float;

    var height : Float;
    var width : Float;

    var directionX : Int;
    var directionY : Int;

    var angleVar : Float;

    public function new(){
        game = Pong.inst;

        var ballImage = hxd.Res.ball;
        var ballTile = ballImage.toTile();
        bmp = new Bitmap(ballTile, game.s2d);

        height = ballTile.height;
        width = ballTile.width;

        x = (game.windowWidth/2) + (width/2);
        y = (game.windowHeight/2) + (height/2);

        bmp.x = x;
        bmp.y = y;

        game.console.log(Std.string(ballTile.height));

        if(Math.random() > 0.5){
            directionX = 1;
        }
        else{
            directionX = -1;
        }
        
        if(Math.random() > 0.5){
            directionY = 1;
        }
        else{
            directionY = -1;
        }

        angleVar = round2(Random.float(0.4,0.8),2);
    }

    public function update(dt:Float) {
        //* Ball movement
        bmp.x += (SPEED * dt * directionX);
        bmp.y += (SPEED * dt * directionY * angleVar);

        //* Collision Detection X
        if(bmp.getBounds().intersects(game.bar1.col) || bmp.getBounds().intersects(game.bar2.col)){
            directionX *= -1;
            angleVar = round2(Random.float(0.4,0.8),2);
        }

        //* Collision Detection Y
        if(bmp.y <= 0 || bmp.y >= (game.windowHeight - height)){
            directionY *= -1;
            angleVar = round2(Random.float(0.4,0.8),2);
            game.console.log(Std.string(angleVar));
        }
    }

    function round2( number : Float, precision : Int): Float {
        var num = number;
        num = num * Math.pow(10, precision);
        num = Math.round( num ) / Math.pow(10, precision);
        return num;
        }
}