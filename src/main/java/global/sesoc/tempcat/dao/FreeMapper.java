package global.sesoc.tempcat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.tempcat.vo.FreeBoard;
import global.sesoc.tempcat.vo.FreeReply;

public interface FreeMapper {

	int freeWrite(FreeBoard fBoard);

	ArrayList<FreeBoard> freeList(String searchText);

	ArrayList<FreeBoard> freeList2(String searchText, RowBounds rB);

	FreeBoard freeRead(String freenum);

	void freeHits(String freenum);

	int replyWrite(FreeReply fReply);

	ArrayList<FreeReply> fReplyList(String freenum);

	void fReplyDelete(String num);

	void fReplyUpdate(FreeReply fReply);

	ArrayList<FreeReply> fReplyList(RowBounds rB, String freenum);

	ArrayList<FreeBoard> setFree();

	int selectMyfreeNum(String id);

	int selectFreereplyNum(String id);

	int freeBoardDelete(HashMap<String, String> map);

	void freeUpdate(FreeBoard fBoard);

	int freeWrite2(FreeBoard fBoard);

}
