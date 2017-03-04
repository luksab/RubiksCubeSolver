import java.util.Hashtable;

public class Cube
{
    Hashtable<Integer, Edge> edges = new Hashtable<Integer, Edge>(12, 1);
    Hashtable<Integer, Corner> corners = new Hashtable<Integer, Corner>(8, 1);

    public Cube()
    {
        for(int i = 0; i < 12; i++)
        {
            edges.put(i, new Edge(i, 0));
        }
        for(int i = 0; i < 8; i++)
        {
            corners.put(i, new Corner(i, 0));
        }
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
    
    public void move(int f,int d)
    {
        for(int i = 0; i < d % 4; i++)
        {
            switch(f)
            {
                case 0: u();
                    break;
                case 1: f();    
                    break;
                case 2: r();
                    break;
                case 3: b();    
                    break;
                case 4: l();   
                    break;
                case 5: d();    
                    break;
            }
        }
    }
    
    public void print()
    {
        for(int i = 0; i < 12; i++)
        {
            System.out.println("Edge " + i  + "  |  " + edges.get(i).n + "  |  " +  edges.get(i).o);
        }
        System.out.println("-----------------------------------------------------------");
        for(int i = 0; i < 8; i++)
        {
            System.out.println("Corner " + i  + "  |  " + corners.get(i).n + "  |  " +  corners.get(i).o);
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
        switch(t){
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