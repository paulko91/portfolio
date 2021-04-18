package BookMachine;

public interface BookSale {
	
	public void insertCash();	// 현금투입
	public void returnCash();	// 잔돈반환
	public void BookList();		// 도서목록
	public void selectBook();	// 도서선택
	public void addBook();		// 도서추가
}
