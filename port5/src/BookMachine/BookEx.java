package BookMachine;

import java.util.Scanner;

public class BookEx {

	public static void main(String[] args) {
		
		BookMachine bm = new BookMachine();
		
		Scanner sc = new Scanner(System.in);
		
		int num;
		
		boolean run = true;
		
		while (run) {
			
			System.out.println("--------------------------------------------------");
			System.out.println("1.���� ���� / 2.�ܵ� ��ȯ / 3.���� ���� / 4.���� ��� / 5.����");
			System.out.println("--------------------------------------------------");
			System.out.print("�Է��ϼ��� : ");
			num = sc.nextInt();
			
			if (num == 1) {
				bm.insertCash();
			} else if (num == 2) {
				bm.returnCash();
			} else if (num == 3) {
				bm.selectBook();
			} else if (num == 4) {
				bm.addBook();
			} else if (num == 5) {
				run = false;
			}
			
		}
		System.out.println("�������� �湮���ּ���.");
	}

}
