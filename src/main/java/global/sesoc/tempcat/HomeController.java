package global.sesoc.tempcat;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.tempcat.dao.HomeDao;
import global.sesoc.tempcat.vo.NoticeBoard;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	HomeDao Hdao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		logger.info("메인 화면으로 이동");
		ArrayList<NoticeBoard> noticeList = Hdao.setNotice();
		logger.debug(noticeList.toString());
		model.addAttribute("noticeList", noticeList);
		return "home";
	}

}
