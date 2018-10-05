//your code here
void setup()
{
	size(1000,1000);
	//your code here
}
void draw()
{
	//your code here
}
class NormalParticle
{
	double x, y, Color, angle, velocity;
	
	NormalParticle(double x, double y, double Color, double angle, double velocity){
		this.x = x;
		this.y = y;
		this.Color = Color;
		this.angle = angle;
		this.velocity = velocity;
	}

	void move(){
		x += (Math.cos(angle)*velocity);
		y += (Math.sin(angle)*velocity);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

