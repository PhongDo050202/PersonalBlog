package personalBlog.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import personalBlog.Model.User;
import personalBlog.Service.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService userService;

	// Phương thức xử lý yêu cầu truy cập vào trang quản trị
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model) {
		List<User> userList = userService.getAll();
		model.addAttribute("users", userList);
		return "admin";
	}

	// Phương thức xử lý yêu cầu khi thực hiện hành động suspend 0 hoặc enable 1 trên người dùng
	@RequestMapping(value = "/{enabledOrDisabled}/{user}", method = RequestMethod.GET)
	public String admin(Model model, @PathVariable("user") String username,
			@PathVariable("enabledOrDisabled") String enabledOrDisabled) {
		if (enabledOrDisabled.equals("suspend"))
			userService.suspendOrEnable(username, 0);
		else
			userService.suspendOrEnable(username, 1);

		List<User> userList = userService.getAll();
		model.addAttribute("users", userList);
		return "admin";
	}
}
