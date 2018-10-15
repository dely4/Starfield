//your code here
double acceleration = 0.75;
double jumboAccel = 0.25;
double timer = 0;
ArrayList<Particle> SpaceThings = new ArrayList<Particle>();// creates an array list of particles, which are an interface
void setup()
{
	size(1000,1000);
	//Particle bigMan = new JumboParticle(500,500,255,Math.random()*2*(Math.PI),0.05);
	//SpaceThings.add(bigMan);
}
void draw()
{
	//your code here
	if(timer%45 == 0){
		Particle timedStar = new NormalParticle(500,500,255,Math.random()*2*(Math.PI),0.05);
		SpaceThings.add(timedStar);
	}
	timer += 1;
	background(0);
	for(int i = 0; i < SpaceThings.size(); i++){
		SpaceThings.get(i).show();
		SpaceThings.get(i).move();
	}
}
class NormalParticle implements Particle //Normal particle
{
	double x, y, Color, angle, velocity;
	
	NormalParticle(double x, double y, double Color, double angle, double velocity){ //constuctor for normal particles
		this.x = x;
		this.y = y;
		this.Color = Color;
		this.angle = angle;
		this.velocity = velocity;
	}
	double getVelocity(){
		return(velocity);
	}
	void move(){ // updates the x and y components of velocity
		x += (Math.cos(angle)*velocity);
		y += (Math.sin(angle)*velocity);
		this.velocity += acceleration;
	}
	void show(){ // draws the star at its position
		fill(247,255,0);
		stroke(247,255,0);
		ellipse((float)this.x,(float)this.y,3,3);
	}
}
interface Particle // collection of all particles
{
	public void show();
	public void move();
	public double getVelocity();
	//your code here
}
class OddballParticle //uses an interface, is a completely separate type of particle
{
	//your code here
}
/*class JumboParticle extends NormalParticle //uses inheritance, is a larger version of normal particle
{

	/*double x, y, Color, angle, velocity;

	JumboParticle(double x, double y, double Color, double angle, double velocity){
		this.x = x;
		this.y = y;
		this.Color = Color;
		this.angle = angle;
		this.velocity = velocity;
	}
	void show(){ // draws the star at its position
		fill(247,255,0);
		stroke(247,255,0);
		ellipse((float)this.x,(float)this.y,50,50);
	}
}*/
void mousePressed(){

	Particle newStar = new NormalParticle(500,500,255,Math.random()*2*(Math.PI),0.05);
	SpaceThings.add(newStar);

}