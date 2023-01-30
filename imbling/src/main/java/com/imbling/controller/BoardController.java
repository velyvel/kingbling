package com.imbling.controller;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.imbling.common.Util;
import com.imbling.dto.AccountDto;
import com.imbling.dto.BoardAttachDto;
import com.imbling.dto.BoardCommentDto;
import com.imbling.dto.BoardDto;
import com.imbling.entity.BoardEntity;
import com.imbling.service.BoardService;
import com.imbling.ui.BoardPager;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(path = { "/board" })
public class BoardController {
	private final int PAGE_SIZE = 3;
	private final int PAGER_SIZE = 3;
	private final String E_LINK_URL = "event";

	@Autowired
	@Qualifier("boardService")
	private BoardService boardService;

//이벤트(메인)페이지 보여주기
	@GetMapping(path = {"/event"})
	public String showBoardHome(@RequestParam(defaultValue = "1") int pageNo, BoardDto board, Model model){

		board.setBoardCategory(1);
		List<BoardDto> boards = boardService.findEventBoard();
		model.addAttribute("boards", boards);
		model.addAttribute("pageNo", pageNo);

		return "board/event";
	}



//============================ 공지사항 ============================
//공지사항 페이지 보여주기
	@GetMapping(path = { "/notice" })
	public String showBoardNotice(@RequestParam (defaultValue = "1") int pageNo, BoardDto board, Model model) {

		board.setBoardCategory(2);
		List<BoardDto> boards = boardService.findNoticeBoard();
		model.addAttribute("boards", boards);
		model.addAttribute("pageNo", pageNo);


		return "board/notice";
	}
//공지사항 작성 페이지 보여주기
	@GetMapping(path = {"/noticeWrite"})
	public String showWriteNotice(@RequestParam(defaultValue = "1") int boardCategory, Model model){

		model.addAttribute("boardCategory", boardCategory);
		return "board/noticeWrite";
	}

	@PostMapping(path = {"/uploadNoticeImageFile"})
	@ResponseBody
	public HashMap<String, Object> uploadNoticeImage(MultipartHttpServletRequest req){

		HashMap<String, Object> response = new HashMap<>();

		MultipartFile attach = req.getFile("file");

		if(attach != null){
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/board-attachments");
			String fileName = attach.getOriginalFilename();
			response.put("attachName", fileName);

			if(fileName != null && fileName.length()>0){
				String uniqueFileName = Util.makeUniqueFileName(fileName); //파일 저장하는 코드입니다
				response.put("savedFileName", uniqueFileName);

				try {
					attach.transferTo(new File(path, uniqueFileName));
					response.put("url", "/board-attachments/"+uniqueFileName);
				}catch (Exception ex){
					ex.printStackTrace();
				}
			}
		}

		return response;

	}
//공지사항 작성(카테고리별로 나눔)//
	@PostMapping(path = {"/noticeWrite"})
	public String writeNotice(BoardDto board){

		int boardCategory = board.getBoardCategory();
		boardService.writeBoardNotice(board);
		//System.out.println(board);

		if(boardCategory == 1) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:event";
		}else if(boardCategory == 2) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:notice";
		} else {
			return "board/noticeWrite";
		}

	}


	@GetMapping(path = {"/noticeDetail"})
	public String showNoticeDetail(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardCategory, Model model){

		boardService.increaseBoardCount(boardNo);

		BoardDto board = boardService.findBoardByBoardNo(boardNo, boardCategory);
		model.addAttribute("board",board);
		model.addAttribute("pageNo", pageNo);

		return "board/noticeDetail";
	}

// 공지사항 수정화면 보여주기
	@GetMapping(path = {"/noticeEdit"})
	public String showNoticeEdit(@RequestParam(defaultValue = "-1") int boardNo, @RequestParam(defaultValue = "-1") int pageNo, @RequestParam(defaultValue = "1") int boardCategory, Model model){
		BoardDto board = boardService.findBoardByBoardNo(boardNo, boardCategory);
		model.addAttribute("board", board);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("boardCategory", boardCategory);

		return "board/noticeEdit";
	}
// 공지사항 서머노트로 편집(첨부파일도 같이 편집)
	@PostMapping(path = {"/editNoticeImageFile"})
	@ResponseBody
	public HashMap<String, Object> editNoticeImage(MultipartHttpServletRequest req){

		HashMap<String, Object> response = new HashMap<>();

		MultipartFile attach = req.getFile("file");

		if(attach != null){
			ServletContext application = req.getServletContext();
			String path = application.getRealPath("/board-attachments");
			String fileName = attach.getOriginalFilename();
			response.put("attachName", fileName);

			if(fileName != null && fileName.length()>0){
				String uniqueFileName = Util.makeUniqueFileName(fileName); //파일 저장하는 코드입니다
				response.put("savedFileName", uniqueFileName);

				try {
					attach.transferTo(new File(path, uniqueFileName));
					response.put("url", "/board-attachments/"+uniqueFileName);
				}catch (Exception ex){
					ex.printStackTrace();
				}
			}
		}

		return response;

	}


 //공지사항 수정(기능)
	@PostMapping(path = {"/noticeEdit"})
	public String noticeEdit(@RequestParam(defaultValue = "-1") int pageNo,@RequestParam(defaultValue = "1") int boardCategory, BoardDto board){

		boardService.modifiedNoticeBoard(board);
		//System.out.println(board);

		return "redirect:noticeDetail?boardNo=" + board.getBoardNo() + "&pageNo=" + pageNo + "&boardCategory=" + board.getBoardCategory() ;
	}

//게시글삭제
	@GetMapping(path = {"/{boardNo}/delete"})
	public String deleteBoard(@PathVariable("boardNo") int boardNo, @RequestParam(defaultValue = "-1")int pageNo){
		boardService.deleteBoard(boardNo);

		return "redirect:/board/event?pageNo=" + pageNo;
	}
//============================ 댓글 ============================
	//댓글 리스트 조회
	@GetMapping(path = "/commentList")
	public String showCommentList(int boardNo, Model model){

		List<BoardCommentDto> comments = boardService.findComments(boardNo);
		model.addAttribute("comments", comments);

		return "board/commentList";
	}

	// 댓글 쓰기
	@PostMapping(path = {"/commentForm"})
	@ResponseBody
	public String writeComment(BoardCommentDto comment){
		boardService.writeComment(comment);
		//boardService.updateGroupNo(comment.getCommentNo(), comment.getCommentGroup());
		return "success";
	}


//============================ 1:1 문의 ============================

	@PostMapping(path = {"/boardModal.action"})
	public String writeModal(BoardDto board){
		int boardCategory = board.getBoardCategory();
		boardService.writeBoardModal(board);
		System.out.println(board);

		if(boardCategory == 3) {
			board.setBoardCategory(board.getBoardCategory());
			return "redirect:notice";
		}else{
			return "/";
		}

	}
// 모달 리스트 불러오기(이건 실패, 오류는 아님)
	@GetMapping(path = {"/showModal.action"})
	public String showModalList(@RequestParam (defaultValue = "1") int pageNo, BoardDto board, Model model){
		board.setBoardCategory(3);
		List<BoardDto> boards = boardService.findModalBoard();
		model.addAttribute("boards", boards);
		model.addAttribute("pageNo", pageNo);
//이거 jsp하나 더 만들고 넣어보기
		return "board/showModal.action";
	}

}

