//your code here
ArrayList<Particle> SpaceThings = new ArrayList<Particle>();// creates an array list of particles, which are an interface
void setup()
{
	size(1000,1000);
	for(int i = 0; i < 1000; i++){
		double vel = Math.random()*4;
		Particle initialStar = new NormalParticle(500,500,255,Math.random()*2*(Math.PI),vel);
		SpaceThings.add(initialStar);
	}
	double Jvel = Math.random()*4;
	Particle bigStar = new JumboParticle(500,500,255,Math.random()*2*(Math.PI),Jvel);
	SpaceThings.add(bigStar);
	Particle oddStar = new OddballParticle(500,500,255,Math.random()*2*(Math.PI),Jvel);
	SpaceThings.add(oddStar);
	//Particle bigMan = new JumboParticle(500,500,255,Math.random()*2*(Math.PI),0.05);
	//SpaceThings.add(bigMan);
}
void draw()
{
	background(0);
	for(int i = 0; i < SpaceThings.size(); i++){
		if(SpaceThings.get(i).getPosition() != 500){
			SpaceThings.get(i).show();
		}
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
	void move(){ // updates the x and y components of velocity
		if(x > 1000 || x < 0){
			x = 500;
			y = 500;
		}
		if(y < 0 || y > 1000){
			x = 500;
			y = 500;
		}
		x += (Math.cos(angle)*velocity);
		y += (Math.sin(angle)*velocity);
		if(velocity <= 7){
			velocity += 0.01;
		}
	}
	void show(){ // draws the star at its position
		float x_radius, y_radius;
		float x_squared = (float)((x-500)*(x-500));
		float y_squared = (float)((y-500)*(y-500));
		float hypotenuse = (float)(Math.sqrt((x_squared)+(y_squared)));

		x_radius = map(hypotenuse,(float)0,(float)(500*Math.sqrt(2)),(float)(0.00001),(float)10);
		fill(247,255,0);
		stroke(247,255,0);
		ellipse((float)this.x,(float)this.y,x_radius,x_radius);
	}
	double getPosition(){
		return(x);
	}
}
interface Particle // collection of all particles
{
	public void show();
	public void move();
	public double getPosition();
	//your code here
}
class OddballParticle implements Particle //uses an interface, is a completely separate type of particle
{
	double x, y, Color, angle, velocity;

	OddballParticle(double x, double y, double Color, double angle, double velocity){
		this.x = x;
		this.y = y;
		this.Color = Color;
		this.angle = angle;
		this.velocity = velocity;
	}
	void show(){
		fill(0,0,255);
		stroke(0,0,255);
		ellipse((float)x, (float)y, (float)20, (float)200);
	}

	void move(){
		x+= (float)Math.random()*4-2;
		y+= (float)Math.random()*4-2;
	}

	public double getPosition(){
		return x;
	}

}
class JumboParticle extends NormalParticle //uses inheritance, is a larger version of normal particle
{
	JumboParticle(double x, double y, double Color, double angle, double velocity){
		super(x,y,Color,angle,velocity);
	}

	void show(){
		float x_radius, y_radius;
		float x_squared = (float)((x-500)*(x-500));
		float y_squared = (float)((y-500)*(y-500));
		float hypotenuse = (float)(Math.sqrt((x_squared)+(y_squared)));

		x_radius = map(hypotenuse,(float)0,(float)(500*Math.sqrt(2)),(float)(1),(float)500);
		fill(247,255,0);
		stroke(0,255,0);
		ellipse((float)this.x,(float)this.y,x_radius,x_radius);
	}

}
void mousePressed(){

}