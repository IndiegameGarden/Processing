class TrickleTimer {
  // Trickle timer stats
  float T, Tmin, Tmax;
  float tFire, t;
  float doublingFactor = 2.0;
  boolean isFired = false;
  int prevMillis = 0;
  
  TrickleTimer(float Tmin, float Tmax, float doublingFactor) {
    this.Tmin = Tmin;
    this.Tmax = Tmax;
    this.T = Tmin;
    this.tFire = T/2 + random(0, T/2);
    this.t=0;
  }

  void update() {
    float dt = ((float)(millis() - prevMillis))/1000;
    println("dt = "+dt);
    prevMillis = millis();
    t += dt;
    if (t >= tFire) {
      println("TT fires at "+tFire);
      isFired = true;
      T = T * doublingFactor;
      t = 0;
      tFire = T/2 + random(0, T/2);
    }else{
      isFired=false;
    }
  }

  void reset() {
    T = Tmin;
    t = 0;
    tFire = T/2 + random(0, T/2);
  }
}

