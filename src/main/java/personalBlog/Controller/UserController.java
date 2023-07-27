package personalBlog.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import personalBlog.Model.User;
import personalBlog.Service.UserService;

@Controller
public class UserController {

    @Autowired
    private UserService userService;
    

    // Setter cho UserService
    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    // Xử lý yêu cầu POST để tạo người dùng và lưu vào cơ sở dữ liệu
    @RequestMapping(value = "/createUser", method = RequestMethod.POST)
    public String createAccount(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
    	model.addAttribute("user", new User());
    	userService.create(user);
        return "redirect:/accountSuccess?username=" + user.getUsername();
//        if (result.hasErrors()) {
//            return "error"; 
//        } else {
//            userService.create(user);
//            return "redirect:/accountSuccess?username=" + user.getUsername();
//        }
    }

    // Hiển thị trang "accountCreation" và form tạo tài khoản
    @RequestMapping(value = "/createUser", method = RequestMethod.GET)
    public String createAccount(Model model) {
        model.addAttribute("user", new User());
        //userService.createSampleUser();
        return "createUser";
    }
    
    // Hiển thị trang tạo tài khoản thành công
    @RequestMapping(value = "/accountSuccess", method = RequestMethod.GET)
    public String accountSuccess(Model model, @RequestParam("username") String username) {
        model.addAttribute("username", username);
        return "accountSuccess";
    }
}


