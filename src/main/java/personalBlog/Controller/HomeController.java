package personalBlog.Controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import personalBlog.Model.Blog;
import personalBlog.Service.BlogService;

@Controller
public class HomeController {

	@Autowired
	BlogService blogService;

	// Hiển thị 6 bài viết mới nhất
	@RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
	public String index(Model model, @RequestParam(value = "pageNumber", required = false) Integer pageNumber,
			Principal principal) {
		// Hiển thị tên đăng nhập nếu người dùng đã đăng nhập
		if (principal != null) {
			model.addAttribute("username", principal.getName());
			model.addAttribute("blogname", blogService.getBlogName(principal.getName()));
			System.out.println("principal not empty");
		}

		// Nếu không có tham số pageNumber được cung cấp, pageNumber sẽ là null
		if (pageNumber == null)
			pageNumber = 0;

		int temp = pageNumber * 6;
		// Lấy 6 bài viết mới nhất hoặc ít hơn từ cơ sở dữ liệu
		// temp là giá trị offset
		List<Blog> list = blogService.getAll(temp);

		// Kiểm tra xem danh sách Blog có rỗng hay không, nếu rỗng sẽ hiển thị lỗi trên
		// trang chủ
		if (list.isEmpty()) {
			model.addAttribute("error", 1);
			return "index";
		}

		// Danh sách cho mỗi dòng trên trang chủ
		List<Blog> temp1 = new ArrayList<Blog>();
		List<Blog> temp2 = new ArrayList<Blog>();
		for (int i = 0; i < list.size(); i++) {
			if (i < 3)
				temp1.add(list.get(i));
			else
				temp2.add(list.get(i));
		}

		// Nếu temp2 không có 3 bài viết, có nghĩa là không còn bài viết nào để hiển thị
		// trên trang chủ
		if (temp2.size() != 3) {
			model.addAttribute("nomorepages", true);
		}

		// Số trang kế tiếp là pageNumber + 1
		model.addAttribute("pageNumberNext", pageNumber + 1);
		// Số trang trước đó là pageNumber - 1
		model.addAttribute("pageNumberPrevious", pageNumber - 1);
		model.addAttribute("temp1", temp1);
		model.addAttribute("temp2", temp2);
		// Trả về tên của trang "index"
		return "index";
	}
}
