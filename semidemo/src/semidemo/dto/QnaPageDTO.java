package semidemo.dto;

public class QnaPageDTO {
	private int currentPage; // 현재페이지 1 2 3 4 다음  중에 1이나 2나 3이나 4. 초기에는 1 선택하면 선택한 페이지의 값을 저장.
	private int recordTotalCount; // 총 레코드수  게시물의 수. 20개있으면 20, 30개의 게시물이 있으면 30.
	private int recordCount = 10; // 한 페이지에 보여줄 레코드수 / 한페이지에 보여줄 게시물의 수.
	private int blockShowPage = 5; // 한 블록에 보여줄 페이지수// 한번에 보여줄 페이지의 수. 1 2 3 4 5 다음 <<이런식으로.
	private int totalPage; // 총 페이지수 // 30개의 게시물이 있으면 3개의 페이지.  31개 게시물이면 4개의 페이지. 10 10 10 1 
	private int startRow; // 시작 레코드 번호
	private int endRow; // 끝 레코드 번호
	private int startPage; // 한 블록의 시작 페이지 번호 blockCount 
	private int endPage; // 한 블록의 끝페이지 번호
	private int number;
	
	public QnaPageDTO() {

	}

	public QnaPageDTO(int currentPage, int totalCount) {
		this.currentPage = currentPage;
		this.recordTotalCount = totalCount;

		// 총페이지수 = 총 게시물의 수/한번에보여줄 게시물 수(10) + 나누고 남은 나머지. 0이면 0 아니면 1.
		// 총 게시물이          30개면 3+0= 3       32개면 3+1= 4       39개면  3+1= 4
		totalPage = totalCount / recordCount +   
				    (totalCount % recordCount == 0 ? 0 : 1);
		
		// 총 페이지 수가 현재 페이지보다 작으면
		// 현재 페이지에 총페이지 수를 넣는다. // 아마도 현재페이지가 게시물 페이지보다 초과되는 일을 막아주는듯하다.
		if (totalPage < currentPage)
			this.currentPage = totalPage;

		// 시작레코드 
		// (현재페이지-1) x (한번에보여줄 게시물 수(10)) + 1  
		// (첫페이지(1) -1 ) x 10 +1 => 1
		// (2페이지 - 1) x 10 +1 => 11 
		startRow = (this.currentPage - 1) * recordCount + 1;

		// 끝레코드
		// (시작 레코드번호) + 한번에보여줄 게시물 수(10) -1
		// 1 + 10-1 => 10   1페이지에서 끝레코드=>10
		// 11 + 10-1 => 20  2페이지에서 끝레코드=>20
		endRow = startRow + recordCount - 1;

		// 시작페이지
		// ((현재페이지 - 1) / 한블록에보여줄 페이지의 수(5)) * 5 + 1 => 
		//      ((1 - 1) / 5) * 5 + 1 => 1
		//      ((2 - 1) / 5) * 5 + 1 => 1
		//		((6 - 1) / 5) * 5 + 1 => 6
		startPage = (int) ((this.currentPage - 1) / blockShowPage) * blockShowPage + 1;

		// 끝페이지
		// 1 + 5 - 1 => 5
		// 6 + 5 - 1 => 10
		endPage = startPage + blockShowPage - 1;
		// 총페이지의수가 끝페이지보다 작으면
		// 끝페이지 값에 총페이지의수를 넣는다. // 아마도 초과되서 오류나는 상황을 방지하기 위한것 같다.
		if (totalPage < endPage)
			endPage = totalPage;

		// 리스트페이지에 출력번호  
		// 게시물의 번호. 마지막페이지의 마지막 게시물. 가장 오래된 게시물이 1 가장 최근 게시물의 number가 recordTotalCount(레코드의 총 개수)와 같다. 
		// 레코드의 총 개수 - (현재페이지 - 1) x 한페이지에 보여줄 레코드의 수(10)
		// 총 레코드 수가 32 - (2 - 1) x 10 => 0   
		number = recordTotalCount - (this.currentPage - 1) * recordCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getRecordTotalCount() {
		return recordTotalCount;
	}

	public void setRecordTotalCount(int recordTotalCount) {
		this.recordTotalCount = recordTotalCount;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	public int getBlockShowPage() {
		return blockShowPage;
	}

	public void setBlockShowPage(int blockShowPage) {
		this.blockShowPage = blockShowPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
}
