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
			System.out.println("1.현금 투입 / 2.잔돈 반환 / 3.도서 선택 / 4.도서 등록 / 5.종료");
			System.out.println("--------------------------------------------------");
			System.out.print("입력하세요 : ");
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
		System.out.println("다음에도 방문해주세요.");
	}

}
