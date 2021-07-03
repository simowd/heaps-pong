import h2d.Bitmap;

class Ball {
    static var SPEED : Int = 150;
    
    var game : Pong;
    var bmp : h2d.Bitmap;

    var x : Float;
    var y : Float;

    var directionX : Int;

    public function new(){
        game = Pong.inst;

        var ballImage = hxd.Res.ball;
        var ballTile = ballImage.toTile();
        bmp = new Bitmap(ballTile, game.s2d);

        x = (game.windowWidth/2) + (bmp.width/2);
        y = (game.windowHeight/2) + (bmp.height/2);

        bmp.x = x;
        bmp.y = y;

        game.console.log(Std.string(bmp.getBounds()));

        if(Math.random() > 0.5){
            directionX = 1;
        }
        else{
            directionX = -1;
        }
        
    }

    public function update(dt:Float) {
        //* Ball movement
        bmp.x = bmp.x + (SPEED * dt * directionX);

        //* Collision Detection
        if(bmp.getBounds().intersects(game.bar1.col) || bmp.getBounds().intersects(game.bar2.col)){
            directionX *=  -1;
        }
    }
}