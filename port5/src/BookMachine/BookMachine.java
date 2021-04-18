package BookMachine;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class BookMachine implements BookSale{
	
	Scanner sc = new Scanner(System.in);
	
	ArrayList<BookVO> list = new ArrayList<>();
	
	private int cash=0;

	@Override
	public void insertCash() {
		int select;
		
		System.out.println("돈을 넣어주세요.");
		System.out.println("1:100원 / 2:500원 / 3:1000원 / 4:5000원 / 5:10000원 ");
		
		select=sc.nextInt();
		
		switch(select){
			case 1: 
				cash = cash + 100;
				System.out.println("100원 투입");
				break;
			
			case 2: 
				cash = cash + 500;
				System.out.println("500원 투입");
				break;
				
			case 3: 
				cash = cash + 1000;
				System.out.println("1000원 투입");
				break;
				
			case 4: 
				cash = cash + 5000;
				System.out.println("5000원 투입");
				break;
				
			case 5: 
				cash = cash + 10000;
				System.out.println("10000원 투입");
				break;
		}
		
		System.out.println("현재 금액 : " + cash);
		
	}

	@Override
	public void returnCash() {
		
		if(cash==0) {
			System.out.println("남은 금액은 0원입니다.");
		} else {
			cash = 0;
			System.out.println("반환되었습니다.");
			System.out.println("현재 금액 : " + cash);
		}
		
	}

	@Override
	public void BookList() {
		System.out.println("도서 목록");
		
		BookVO book = new BookVO();
		Iterator<BookVO> booklist = list.iterator();
		
		while (booklist.hasNext()) {
			
			book = booklist.next();
			
			System.out.println("도서번호 : " + book.getBookNum());
			System.out.println("도서명 : " + book.getBookName());
			System.out.println("가격 : " + book.getBookPrice());
			System.out.println();
		}
		
	}

	@Override
	public void selectBook() {
		System.out.println("도서 선택");
		
		BookList();
		
		BookVO book = new BookVO();
		Iterator<BookVO> booklist = list.iterator();
		
		int num;
		
		System.out.println("도서번호를 입력하세요.");
		
		num = sc.nextInt();
		
		while(booklist.hasNext()) {
			
			book = booklist.next();
			
			if(num == book.getBookNum()) {
				if(cash - book.getBookPrice() < 0) {
					System.out.println("잔액이 부족합니다.");
					
					break;
				}
				cash = cash - book.getBookPrice();
				System.out.println(book.getBookName() + "구매 완료되었습니다.");
				System.out.println("잔액 : " + cash);
				
			}
		}
		
	}

	@Override
	public void addBook() {
		
		BookVO book = new BookVO();
		
		System.out.println("도서 추가");
		
		System.out.print("도서 번호 : ");
		book.setBookNum(sc.nextInt());
		
		System.out.print("책 이름 : ");
		book.setBookName(sc.next());
		
		System.out.print("책 가격 : ");
		book.setBookPrice(sc.nextInt());
		
		list.add(book);
		
		System.out.println("등록되었습니다.");
		
	}
	
	

}
