package cosc314.project;
import java.util.*;

public class Driver {

	public Driver() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) {
		int p, r, t, alpha, beta;
		Scanner input = new Scanner(System.in);
		System.out.println("This is a toy version of El Gamal cryptosystem using p <= 10,000");
		System.out.println("Please enter the correspoding parameters for the public key (p, alpha, beta)");
		p = input.nextInt();
		alpha = input.nextInt();
		beta = input.nextInt();
	}

}
