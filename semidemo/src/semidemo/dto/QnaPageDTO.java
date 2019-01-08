package semidemo.dto;

public class QnaPageDTO {
	private int currentPage; // 현재페이지 1 2 3 4 다음  중에 1이나 2나 3이나 4. 초기에는 1 선택하면 선택한 페이지의 값을 저장.
	private int totalCount; // 총 레코드수 
	private int blockCount = 5; // 한 페이지에 보여줄 레코드수 (원래는 10개정도, 테스트 용으로 적게 줄임)
	private int blockPage = 3; // 한 블록에 보여줄 페이지수
	private int totalPage; // 총 페이지수
	private int startRow; // 시작 레코드 번호
	private int endRow; // 끝 레코드번호
	private int startPage; // 한 블록의 시작 페이지 번호
	private int endPage; // 한 블록의 끝페이지 번호
	private int number;
	private String searchKey; //검색어 이용한 조회
	private String searchWord;
}
