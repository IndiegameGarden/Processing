
// settings
int numberOfNodes = 10;
int K = 2;
float Tmin = 1;
float Tmax = 16;
float doublingFactor = 2.0;
float radioRange = 150.0;

ArrayList<Node> aNodes;

void setup() {
  size(600,400);
  aNodes = new ArrayList<Node>();
  
  // create nodes
  for(int i=0; i < numberOfNodes; i++ ){  
    Node n = new Node();
    n.radioRange = radioRange;
    aNodes.add( n );
  }
  
  // create single message
  Message m = new Message(1);
  aNodes.get(1).receiveMsg(m);
}

void draw() {
  background(51);
  for(int i=0; i < aNodes.size(); i++ ){
    Node n = aNodes.get(i);
    n.draw();
  }
}
