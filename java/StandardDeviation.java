// Java program to calculate the standard deviation

class calculateSD2 {
	double sum = 0.0;
	double standardDeviation = 0.0;
	double mean = 0.0;
	double res = 0.0;
	double sq = 0.0;

	double SD()
	{
		int[] arr = { 12, 32, 11, 55, 10, 23, 14, 30 };
		int n = arr.length;
		
		System.out.println("Elements are:");
		for (int i = 0; i < n; i++) {
			System.out.println(arr[i]);
		}
		
		for (int i = 0; i < n; i++) {
			sum = sum + arr[i];
		}
		
		mean = sum / (n);

		for (int i = 0; i < n; i++) {
			
			standardDeviation
				= standardDeviation + Math.pow((arr[i] - mean), 2);
			
		}
		
		sq = standardDeviation / n;
		res = Math.sqrt(sq);
		return res;
	}
}

public class Standard {
	public static void main(String[] args)
	{

		calculateSD2 calsd = new calculateSD2();
		double res = calsd.SD();

		System.out.format("Standard Deviation = %.6f", res);
	}
}
