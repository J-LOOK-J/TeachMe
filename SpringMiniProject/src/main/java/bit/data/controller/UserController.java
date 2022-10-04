package bit.data.controller;

import bit.data.service.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class UserController {

    @Autowired
    UserServiceInter userService;


    @GetMapping("/student/updateStudent")
    public String updateStudent()
    {
        return "/mypage/student/updateStudent";
    }

/*    @GetMapping("/")
    public String myPageChange(){

        return "/mypage/student/timeTable";

    }*/


    @GetMapping("/layoutMypage/change")
    public String mypage(){

        return "/mypage/layoutMypage/change";
    }
    @GetMapping("layoutMypage/change")
    public String myPageHome() {
    	
    	return "/mypage/layoutMypage/change"; 
    }
    

}
