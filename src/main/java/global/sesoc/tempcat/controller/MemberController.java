package global.sesoc.tempcat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.tempcat.dao.MemberDao;
import global.sesoc.tempcat.util.PageNavigator;
import global.sesoc.tempcat.vo.Member;
import global.sesoc.tempcat.vo.NoticeBoard;
import global.sesoc.tempcat.vo.Profile;
import global.sesoc.tempcat.vo.SearchBoard;

@Controller
@RequestMapping("member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	boolean res;
	int intres;
	String stres;
	HashMap<String, String> map;
	String nickname;
	ArrayList<Integer> mynotice = new ArrayList<>();
	ArrayList<Integer> myfree = new ArrayList<>();
	ArrayList<Integer> noticereply = new ArrayList<>();
	ArrayList<Integer> freereply = new ArrayList<>();
	ArrayList<Integer> heartnotice = new ArrayList<>();
	ArrayList<Integer> heartfree = new ArrayList<>();

	@Autowired
	private MemberDao Mdao;
	private String name;
	private String id;

	@GetMapping(value = "login")
	public String login() {
		return "member/login";
	}

	@ResponseBody
	@PostMapping(value = "login")
	public String login2(String id, String pw, HttpSession session) {
		logger.debug("login 정보 아이디: {} 비밀번호 : {}", id, pw);

		Member member = new Member();
		member.setId(id);
		member.setPw(pw);
		res = Mdao.checkId(member);
		if (!res) {
			stres = "checkId error";
			logger.debug(stres);
			return stres;
		} else {
			map = Mdao.login(member);
			stres = map.get("stres");
			nickname = map.get("nickname");
			id = map.get("id");
			name = map.get("name");
			if (stres.equals("login success")) {
				session.setAttribute("id", id);
				session.setAttribute("nickname", nickname);
				session.setAttribute("name", name);
				logger.debug("id : {}, name : {}, nickname : {}", id, name, nickname);
			}
			logger.debug(stres);
			return stres;
		}
	}

	@GetMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping(value = "signup")
	public String signup() {
		return "member/signup";
	}

	@ResponseBody
	@PostMapping(value = "signup")
	public String signup2(Member member) {
		System.out.println(member);
		res = Mdao.checkId(member);
		if (res) {
			stres = "exist id";
			return stres;
		}
		stres = Mdao.signup(member);
		logger.debug(stres);
		return stres;
	}

	@GetMapping(value = "profile")
	public String profile(HttpSession session, Model model) {
		id = (String) session.getAttribute("id");
		Member member = Mdao.selectMember(id);

		ArrayList<Profile> profile = Mdao.selectProfile(id);
		mynotice.clear();
		myfree.clear();
		noticereply.clear();
		freereply.clear();
		heartnotice.clear();
		heartfree.clear();
		for (Profile i : profile) {
			if (i.getMynotice() != 0) {
				mynotice.add(i.getMynotice());
			} else if (i.getMyfree() != 0) {
				myfree.add(i.getMyfree());
			} else if (i.getNoticereply() != 0) {
				noticereply.add(i.getNoticereply());
			} else if (i.getFreereply() != 0) {
				freereply.add(i.getFreereply());
			} else if (i.getHeartnotice() != 0) {
				heartnotice.add(i.getHeartnotice());
			} else if (i.getHeartfree() != 0) {
				heartfree.add(i.getHeartfree());
			}
		}

		logger.debug(
				"member : {}, mynotice : {}, myfree : {}, noticereply : {}, freereply : {}, heartnotice {}, heartfree {}",
				member, mynotice, myfree, noticereply, freereply, heartnotice, heartfree);

		model.addAttribute("member", member);
		model.addAttribute("mynotice", mynotice);
		model.addAttribute("myfree", myfree);
		model.addAttribute("noticereply", noticereply);
		model.addAttribute("freereply", freereply);
		model.addAttribute("heartnotice", heartnotice);
		model.addAttribute("heartfree", heartfree);

		return "member/profile";
	}

	@ResponseBody
	@GetMapping(value = "changeNickname")
	public void changeNickname(String id, String nickname) {
		logger.debug("id : {}, nickname : {}", id, nickname);
		res = Mdao.changeNickname(id, nickname);
	}

	@ResponseBody
	@GetMapping(value = "changeEmail")
	public void changeEmail(String id, String email) {
		logger.debug("id : {}, email : {}", id, email);
		res = Mdao.changeEmail(id, email);
	}

	@GetMapping(value = "changepw")
	public String changePW() {

		return "member/changepw";
	}

	@ResponseBody
	@PostMapping(value = "changepw")
	public boolean checkPW(String id, String current_pw, String pw) {
		logger.debug("id : {}, current_pw : {}, pw : {}", id, current_pw, pw);
		res = Mdao.changePw(id, current_pw, pw);
		return res;
	}

	@GetMapping(value = "go-mynotice")
	public String go_mynotice(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "0") int currentPage, Model model) {
		// 전체글수랑 현재페이지를 가져와야함.

		int totalRecordsCount = mynotice.size();
		PageNavigator nav = new PageNavigator(10, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		ArrayList<SearchBoard> list = Mdao.mynoticeListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);
		model.addAttribute("searchText", searchText);

		return "board/searchlist";
	}

	@GetMapping(value = "go-myfree")
	public String go_myfree(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "0") int currentPage, Model model) {
		// 전체글수랑 현재페이지를 가져와야함.

		int totalRecordsCount = myfree.size();
		PageNavigator nav = new PageNavigator(10, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		ArrayList<SearchBoard> list = Mdao.myfreeListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);
		model.addAttribute("searchText", searchText);

		return "board/searchlist";
	}

	@GetMapping(value = "go-noticereply")
	public String go_noticereply(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "0") int currentPage, Model model) {
		// 전체글수랑 현재페이지를 가져와야함.

		int totalRecordsCount = noticereply.size();
		PageNavigator nav = new PageNavigator(5, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		ArrayList<SearchBoard> list = Mdao.noticereplyListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);
		model.addAttribute("searchText", searchText);

		return "board/searchlist";
	}

	@GetMapping(value = "go-freereply")
	public String go_freereply(@RequestParam(defaultValue = "") String searchText,
			@RequestParam(defaultValue = "0") int currentPage, Model model) {
		// 전체글수랑 현재페이지를 가져와야함.

		int totalRecordsCount = freereply.size();
		PageNavigator nav = new PageNavigator(5, currentPage, totalRecordsCount);
		// RowBounds에 보내줄 스타트레코드, 카운트퍼페이지
		int startRecord = nav.getStartRecord();
		int countPerPage = nav.getCountPerPage();
		ArrayList<SearchBoard> list = Mdao.freereplyListPage(searchText, startRecord, countPerPage);
		// 카운트퍼페이지 수만큼담긴 list랑, 커런트페이지 변경시켜줘야되니까 nav보냄
		model.addAttribute("nav", nav);
		model.addAttribute("list", list);
		model.addAttribute("searchText", searchText);

		return "board/searchlist";
	}

	@GetMapping(value = "deleteac")
	public String deleteAc() {

		return "member/deleteac";
	}

	@ResponseBody
	@PostMapping(value = "deleteac")
	public boolean deleteAc(String id, String current_pw, HttpSession session) {
		logger.debug("id : {}, pw : {}", id, current_pw);
		res = Mdao.deleteAc(id, current_pw);
		if (res) {
			session.invalidate();
		}
		return res;
	}
}
