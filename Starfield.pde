//your code here
double acceleration = 0.5;
double timer = 0;
ArrayList<Particle> SpaceThings = new ArrayList<Particle>();
void setup()
{
	size(1000,1000);
	for(int i = 0; i < (20); i++){
		Particle Star = new NormalParticle(500,500,255,Math.random()*2*(Math.PI),5);
		SpaceThings.add(Star);
	}
}
void draw()
{
	//your code here
	timer += 1;
	System.out.println(timer/60);
	background(0);
	for(int i = 0; i < SpaceThings.size(); i++){
		SpaceThings.get(i).show();
		SpaceThings.get(i).move();
	}

}
class NormalParticle implements Particle
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
	void show(){
		fill(247,255,0);
		stroke(247,255,0);
		ellipse((float)this.x,(float)this.y,3,3);
	}
}
interface Particle
{
	public void show();
	public void move();
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

