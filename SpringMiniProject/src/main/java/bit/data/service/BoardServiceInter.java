package bit.data.service;

import bit.data.dto.BoardDto;

import java.util.List;
import java.util.Map;

public interface BoardServiceInter {

    public void insertBoard(BoardDto dto);
    public List<BoardDto> getPagingList(String searchcolumn, String searchword, int startnum, int perpage);
    public int getTotalCount(String searchcolumn, String searchword);
    public BoardDto selectByNum(int boardnum);
    public void updateReadCount(int boardnum);



}
