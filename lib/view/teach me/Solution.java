
import java.io.*;

class Solution {
    public static void main(String[] args) {

        int arr[] = { 2, 4, 5, 1 };
        int n = arr.length;
        printTwoParts(arr, n);

    }

    // Returns split point. If
    // not possible, then return -1.
    static int findSplitPoint(int arr[], int n) {

        int leftSum = 0;

        // traverse array element
        for (int i = 0; i < n; i++) {
            // add current element to left Sum
            leftSum += arr[i];

            // find sum of rest array
            // elements (rightSum)
            int rightSum = 0;

            for (int j = i + 1; j < n; j++)
                rightSum += arr[j];

            // split point index
            if (leftSum == rightSum)
                return i + 1;
        }

        // if it is not possible to
        // split array into two parts
        return -1;
    }

    // Prints two parts after finding
    // split point using findSplitPoint()
    static void printTwoParts(int arr[], int n) {

        int sumadd = 5;
        int splitPoint = findSplitPoint(arr, n);

        if (splitPoint == -1 || splitPoint == n) {
            System.out.println("-1");
            return;
        }
        int sum = 1;
        for (int i = 0; i < n; i++) {
            if (splitPoint == i) {
                sumadd = sumadd + sum;
                sum = 1;
            }
            sum = sum * arr[i];
        }
        System.out.println(sumadd);
    }
}