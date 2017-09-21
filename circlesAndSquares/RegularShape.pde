public class RegularShape {
    float x;
    float y;
    float angle;
    float xSpeed;
    float ySpeed;
    float spin;
    color fillColor;
    float size;
    
    /*
       Create a new circle at the given x,y point with a
       random speed, color, and size.
     */
    public RegularShape (float x, float y) {    
        this.x = x;
        this.y = y;
        this.angle = 0.0;
        this.xSpeed = random(-5,5);
        this.ySpeed = random(-5,5);
        this.spin = random(-0.2,0.2);
        // this creates a random color. We draw it with an
        // outline, so we'll be able to see it on a white
        // background regardless
        this.fillColor = color(random(0,180),
                               random(0,180),
                               random(0,180));
        this.size = random(5,75);
    }

    /* Update current location by speed. */
    public void update() {
        this.x += this.xSpeed;
        this.y += this.ySpeed;
        this.angle = this.angle + this.spin;
        while (this.x > width && this.xSpeed > 0) {
          this.x -= width;
        }
        while (this.x < 0 && this.xSpeed < 0) {
          this.x += width;
        }
        while (this.y > height && this.ySpeed > 0) {
          this.y -= height;
        }
        while (this.y < 0 && this.ySpeed < 0) {
          this.y += height;
        }
    }

    /* don't do anything, by default */
    public void display() {
    }
}