package cosc314.project;

public class ExtendedEuclidean {

	
	public static int gcd(int a, int b)
    {
        if (a == 0)
            return b;
         
        return gcd(b%a, a);
    }
//	static int[] gcd(int p, int q) {
//		if (q == 0)
//			return new int[] { p, 1, 0 };
//
//		int[] vals = gcd(q, p % q);
//		int d = vals[0];
//		int a = vals[2];
//		int b = vals[1] - (p / q) * vals[2];
//		return new int[] { d, a, b };
//	}

}
