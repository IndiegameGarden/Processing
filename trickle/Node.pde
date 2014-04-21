class Node {

  TrickleTimer tt = new TrickleTimer(Tmin, Tmax, doublingFactor);
  float nodeSize = 20;
  float radioRange = 100;
  float x, y;
  ArrayList<Message> msgBuffer = new ArrayList<Message>();

  Node() {
    x = random(width);
    y = random(height);
  }

  void receiveMsg(Message m) {
    msgBuffer.add(m);
    tt.reset();
  }

  float distanceTo(Node other) {
    return dist( this.x, this.y, other.x, other.y);
  }

  void sendMessageToNeighbors(Message m) {
    for (int i=0; i < aNodes.size(); i++ ) {
      Node n = aNodes.get(i);
      if (n.distanceTo(this) <= radioRange) {
        n.receiveMsg(m);
      }
    }
  }

  void draw() {
    tt.update();
    ellipse(x, y, nodeSize, nodeSize);
    if (tt.isFired) {
      if (msgBuffer.size() > 0 ) {
        sendMessageToNeighbors(msgBuffer.get(msgBuffer.lastIndexOf(msgBuffer)));
        pushStyle();
        noFill();
        ellipse(x, y, radioRange, radioRange);
        popStyle();
      }
    }
  }
}

