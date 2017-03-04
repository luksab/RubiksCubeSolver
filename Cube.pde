import java.util.Hashtable;

public class Cube
{
  Hashtable<Integer, Edge> edges = new Hashtable<Integer, Edge>(12, 1);
  Hashtable<Integer, Corner> corners = new Hashtable<Integer, Corner>(8, 1);

  public Cube()
  {
    for (int i = 0; i < 12; i++)
    {
      edges.put(i, new Edge(i, 0));
    }
    for (int i = 0; i < 8; i++)
    {
      corners.put(i, new Corner(i, 0));
    }
  }

  public Cube(int[][] c)
  {
    int e;
    int z;
    int d;
    e=c[0][7];
    z=c[1][1];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 0, 1)));

    e=c[0][5];
    z=c[2][1];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 0, 2)));

    e=c[0][1];
    z=c[3][1];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 0, 3)));

    e=c[0][3];
    z=c[4][1];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 0, 4)));

    e=c[1][5];
    z=c[2][3];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 1, 2)));

    e=c[2][5];
    z=c[3][3];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 2, 3)));

    e=c[3][5];
    z=c[4][3];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 3, 4)));

    e=c[4][5];
    z=c[1][3];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 4, 1)));

    e=c[1][7];
    z=c[5][5];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 1, 5)));

    e=c[2][7];
    z=c[5][7];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 2, 5)));

    e=c[3][7];
    z=c[5][3];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 3, 5)));

    e=c[4][7];
    z=c[5][1];
    edges.put(intToEdgeE(e, z), new Edge(intToEdgeE(e, z), intToOrientE(e, z, 4, 5)));


    e=c[0][8];
    z=c[1][2];
    d=c[2][2];
    corners.put(intToEdgeC(e, z, d), new Corner(intToEdgeC(e, z, d), intToOrientC(e, z, d, 0, 1, 2)));

    e=c[0][2];
    z=c[2][2];
    d=c[3][0];
    corners.put(intToEdgeC(e, z, d), new Corner(intToEdgeC(e, z, d), intToOrientC(e, z, d, 0, 2, 3)));
    
    e=c[0][0];
    z=c[3][2];
    d=c[4][0];
    corners.put(intToEdgeC(e,z,d), new Corner(intToEdgeC(e,z,d), intToOrientC(e,z,d,0,3,4)));
    
    e=c[0][6];
    z=c[1][0];
    d=c[4][2];
    corners.put(intToEdgeC(e,z,d), new Corner(intToEdgeC(e,z,d), intToOrientC(e,z,d,0,1,4)));
    
    e=c[1][8];
    z=c[2][6];
    d=c[5][8];
    corners.put(intToEdgeC(e,z,d), new Corner(intToEdgeC(e,z,d), intToOrientC(e,z,d,1,2,5)));
    
    e=c[2][8];
    z=c[3][6];
    d=c[5][6];
    corners.put(intToEdgeC(e,z,d), new Corner(intToEdgeC(e,z,d), intToOrientC(e,z,d,2,3,5)));
    
    e=c[3][8];
    z=c[4][6];
    d=c[5][0];
    corners.put(intToEdgeC(e,z,d), new Corner(intToEdgeC(e,z,d), intToOrientC(e,z,d,3,4,5)));
    
    e=c[1][6];
    z=c[4][8];
    d=c[5][2];
    corners.put(intToEdgeC(e,z,d), new Corner(intToEdgeC(e,z,d), intToOrientC(e,z,d,1,4,5)));
  }

  private byte intToOrientC(int a, int b, int c, int d, int e, int f) {
    if (d==min(d, e, f)) {
      if (a==min(a, b, c)) 
        return 0;
      else if (a==min(a, b, c))
        return 2;
      else
        return 1;
    } else if (e==min(d, e, f)) {
      if (b==min(a, b, c)) 
        return 0;
      else if (b==max(a, b, c))
        return 2;
      else
        return 1;
    } else {
      if (c==min(a, b, c)) 
        return 0;
      else if (c==max(a, b, c))
        return 2;
      else
        return 1;
    }
}

private int intToEdgeC(int a, int b, int c) {
  switch(a) {
  case 0:
    switch(b) {
    case 1:
      switch(c) {
      case 2:
        return 0;
      case 4:
        return 3;
      }
    case 2:
      switch(c) {
      case 1:
        return 0;
      case 3:
        return 1;
      }
    case 3:
      switch(c) {
      case 2:
        return 1;
      case 4:
        return 2;
      }
    case 4:
      switch(c) {
      case 3:
        return 2;
      case 1:
        return 3;
      }
    }
  case 1:
    switch(b) {
    case 0:
      switch(c) {
      case 2:
        return 0;
      case 4:
        return 3;
      }
    case 2:
      switch(c) {
      case 0:
        return 0;
      case 5:
        return 4;
      }
    case 4:
      switch(c) {
      case 0:
        return 3;
      case 5:
        return 7;
      }
    case 5:
      switch(c) {
      case 4:
        return 7;
      case 2:
        return 4;
      }
    }
  case 2:
    switch(b) {
    case 0:
      switch(c) {
      case 1:
        return 0;
      case 3:
        return 1;
      }
    case 1:
      switch(c) {
      case 0:
        return 0;
      case 5:
        return 4;
      }
    case 3:
      switch(c) {
      case 0:
        return 1;
      case 5:
        return 5;
      }
    case 5:
      switch(c) {
      case 3:
        return 5;
      case 1:
        return 4;
      }
    }
  case 3:
    switch(b) {
    case 0:
      switch(c) {
      case 2:
        return 1;
      case 4:
        return 2;
      }
    case 2:
      switch(c) {
      case 0:
        return 1;
      case 5:
        return 5;
      }
    case 4:
      switch(c) {
      case 0:
        return 2;
      case 5:
        return 6;
      }
    case 5:
      switch(c) {
      case 2:
        return 5;
      case 4:
        return 6;
      }
    }
  case 4:
    switch(b) {
    case 0:
      switch(c) {
      case 1:
        return 3;
      case 3:
        return 2;
      }
    case 1:
      switch(c) {
      case 0:
        return 0;
      case 5:
        return 7;
      }
    case 3:
      switch(c) {
      case 0:
        return 2;
      case 5:
        return 6;
      }
    case 5:
      switch(c) {
      case 3:
        return 6;
      case 1:
        return 7;
      }
    }
  case 5:
    switch(b) {
    case 1:
      switch(c) {
      case 2:
        return 4;
      case 4:
        return 7;
      }
    case 2:
      switch(c) {
      case 1:
        return 4;
      case 3:
        return 5;
      }
    case 3:
      switch(c) {
      case 2:
        return 5;
      case 4:
        return 6;
      }
    case 4:
      switch(c) {
      case 3:
        return 6;
      case 1:
        return 7;
      }
    }
  }
  return -1;
}



private int intToEdgeE(int e, int z) {
  switch(e) {
  case 0:
    switch(z) {
    case 1:
      return 0;
    case 2:
      return 1;
    case 3:
      return 2;
    case 4:
      return 3;
    }
  case 1:
    switch(z) {
    case 0:
      return 0;
    case 2:
      return 4;
    case 5:
      return 8;
    case 4:
      return 7;
    } 
  case 2:
    switch(z) {
    case 0:
      return 1;
    case 1:
      return 4;
    case 3:
      return 5;
    case 5:
      return 9;
    }
  case 3:
    switch(z) {
    case 0:
      return 2;
    case 2:
      return 5;
    case 4:
      return 6;
    case 5:
      return 10;
    } 
  case 4:
    switch(z) {
    case 0:
      return 3;
    case 3:
      return 6;
    case 5:
      return 11;
    case 1:
      return 7;
    } 
  case 5:
    switch(z) {
    case 1:
      return 8;
    case 2:
      return 9;
    case 3:
      return 10;
    case 4:
      return 11;
    }
  }
  return -1;
}

private byte intToOrientE(int a, int b, int c, int d) {
  if ((a-b)*(c-d) > 0)
    return 0;
  else return 1;
}

public void test()
{
  /*move(0, 2);
   *move(5, 2); 
   *move(1, 2); 
   *move(4, 2);
   *move(2, 2);
   *move(3, 2);
   */
  move(0, 1);
  move(2, 2);
  move(1, 1);
  move(3, 1);
  move(2, 1);
  move(3, 2);
  move(2, 1);
  move(0, 2);
  move(4, 1);
  move(3, 2);
  move(2, 1);
  move(0, 3);
  move(5, 3);
  move(2, 2);
  move(1, 1);
  move(2, 3);
  move(4, 1);
  move(3, 2);
  move(0, 2);
  move(1, 2);
  print();
}

public void move(int f, int d)
{
  for (int i = 0; i < d % 4; i++)
  {
    switch(f)
    {
    case 0: 
      u();
      break;
    case 1: 
      f();    
      break;
    case 2: 
      r();
      break;
    case 3: 
      b();    
      break;
    case 4: 
      l();   
      break;
    case 5: 
      d();    
      break;
    }
  }
}

public void print()
{
  for (int i = 0; i < 12; i++)
  {
    println("Edge " + i  + "  |  " + edges.get(i).n + "  |  " +  edges.get(i).o);
  }
  println("-----------------------------------------------------------");
  for (int i = 0; i < 8; i++)
  {
    println("Corner " + i  + "  |  " + corners.get(i).n + "  |  " +  corners.get(i).o);
  }
}

private void u()
{
  swapE(0, 1, 2, 3);
  turn(0, 1);
  turn(3, 1);
  swapC(0, 1, 2, 3);
}

private void f()
{
  turn(0);
  turn(7);
  swapE(0, 7, 8, 4);
  turn(0, 0); 
  turn(3, 2);
  turn(7, 0);
  turn(4, 1);
  swapC(0, 3, 7, 4);
}

private void r()
{
  turn(1);
  turn(9);
  swapE(1, 4, 9, 5);
  turn(0, 3); 
  turn(4, 1);
  turn(5, 4);
  turn(1, 0);
  swapC(0, 4, 5, 1);
}

private void b()
{
  turn(2);
  turn(10);
  swapE(2, 5, 10, 6);
  turn(1, 3);
  turn(5, 1);
  turn(6, 4);
  turn(2, 0);
  swapC(1, 5, 6, 2);
}

private void l()
{
  turn(7);
  turn(11);
  swapE(3, 6, 11, 7);
  turn(2, 0);
  turn(6, 1);
  turn(7, 2);
  turn(3, 1);
  swapC(2, 6, 7, 3);
}

private void d()
{
  swapE(8, 11, 10, 9);
  turn(6, 0);
  turn(7, 0);
  swapC(4, 7, 6, 5);
}

private void turn(int a)
{
  edges.get(a).o = (edges.get(a).o + 1) % 2;
}

private void turn(int a, int t)
{
  switch(t) {
  case 0:
    corners.get(a).o = corners.get(a).o < 2? (corners.get(a).o + 1) % 2 : 2;
    break;
  case 1:
    corners.get(a).o = corners.get(a).o > 0? (corners.get(a).o % 2) + 1 : 0;
    break;
  case 2:
    corners.get(a).o = 2 - corners.get(a).o;
    break;
  case 3:
    corners.get(a).o = (corners.get(a).o + 2) % 3;
    break;
  case 4:
    corners.get(a).o = (corners.get(a).o + 1) % 3;
    break;
  }
}

private void swapE(int a, int b, int c, int d)
{
  Edge swap = edges.get(a);
  edges.put(a, edges.get(b));
  edges.put(b, edges.get(c));
  edges.put(c, edges.get(d));
  edges.put(d, swap);
}

private void swapC(int a, int b, int c, int d)
{
  Corner swap = corners.get(a);
  corners.put(a, corners.get(b));
  corners.put(b, corners.get(c));
  corners.put(c, corners.get(d));
  corners.put(d, swap);
}
}