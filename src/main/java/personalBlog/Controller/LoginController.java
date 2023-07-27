package personalBlog.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import personalBlog.Model.User;
import personalBlog.Service.UserService;
/*
Được sử dụng để xử lý đăng nhập và đăng xuất.
*/
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
 
    // Xử lý yêu cầu POST khi người dùng đăng nhập
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String processLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
        User user = userService.getUserByUsername(username);

        // Kiểm tra xem người dùng có tồn tại không và mật khẩu có khớp hay không
        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            return "redirect:/index";
        } else {
            return "redirect:/login";
        }
    }

	
	// Hiển thị trang đăng nhập
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	// Xử lý khi đăng nhập thành công
    @RequestMapping(value = "/loginSuccess", method = RequestMethod.GET)
    public String loginSuccess() {
        return "redirect:/index"; 
    }


	// Xử lý khi đăng nhập không thành công
	@RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
	public String loginFailed(Model model) {
		model.addAttribute("error", "true");
		return "login";
	}


    // Xử lý khi đăng xuất
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/index";
    }
}
