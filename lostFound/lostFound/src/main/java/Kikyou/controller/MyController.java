package Kikyou.controller;

import Kikyou.model.BlogEntity;
import Kikyou.model.UserEntity;
import Kikyou.repository.BlogRepository;
import Kikyou.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by dwight12 on 2016/3/12.
 */

/**
 * @Controller 用于标注控制层组件
 * @Autowired 自动装配
 * @RequestMapping 用来处理请求地址映射的注解
 */

@Controller
@SessionAttributes("user")
public class MyController {

    @Autowired
    private UserRepository userRepository;
    //卧槽对每个变量都得加上Autowired不然就报HTTP Status 500 - Request processing failed;
    //nested exception is java.lang.NullPointerException
    @Autowired
    private BlogRepository blogRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "register/index";
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String users(ModelMap modelMap){

        List<UserEntity> userEntityList = userRepository.findAll();
        modelMap.addAttribute("userList", userEntityList);

        return "user/userManagement";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(){
        return "register/addUser";
    }

    @RequestMapping(value = "/addUserPost", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("userMessage") UserEntity userEntity){

        userRepository.saveAndFlush(userEntity);

        return "register/login";
    }

    @RequestMapping(value = "/showUser", method = RequestMethod.GET)
    public String showUser(@ModelAttribute("user") UserEntity userEntity){
        return "user/userDetail";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.GET)
    public String updateUser(@ModelAttribute("user") UserEntity userEntity){

        return "user/updateUser";

    }

    @RequestMapping(value = "/updateUserPost", method = RequestMethod.POST)
    public String updateUserPost(@ModelAttribute("user") UserEntity userEntity){

        userRepository.updateUser(
                userEntity.getNickname(),
                userEntity.getFirstName(),
                userEntity.getLastName(),
                userEntity.getPassword(),
                userEntity.getId()
        );

        userRepository.flush();
        return "user/userDetail";
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public String deleteUser(@ModelAttribute("user") UserEntity userEntity){

        userRepository.delete(userEntity.getId());
        userRepository.flush();

        return "redirect:/register/login";
    }

    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("userId") Integer userId){

        userRepository.delete(userId);
        userRepository.flush();

        return "redirect:/users";
    }

    @RequestMapping(value="/login", method=RequestMethod.GET)
    public String login() {return "register/login";}

    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginPost(UserEntity userEntity, ModelMap modelMap) {


        String username = userEntity.getNickname();
        String password = userEntity.getPassword();

        List<UserEntity> userEntityList = userRepository.findAll();

        for (UserEntity u: userEntityList
             ) {
            if (u.getNickname().equals(username) && u.getPassword().equals(password)) {

                modelMap.addAttribute("user",u);
                List<BlogEntity> blogEntityList = blogRepository.findAll();
                modelMap.addAttribute("blogList", blogEntityList);

                return "register/success";
            }

        }

        return "register/error";
    }


    @RequestMapping(value = "/showBlog" , method = RequestMethod.GET)
    public String showBlog(ModelMap modelMap,
                           @ModelAttribute("user") UserEntity userEntity){

            List<BlogEntity> blogEntityList = blogRepository.findAll();
            modelMap.addAttribute("blogList", blogEntityList);
        return "blog/showBlog";
    }

    @RequestMapping(value = "/tourists" , method = RequestMethod.GET)
    public String showBlogForTourists(ModelMap modelMap){

        List<BlogEntity> blogEntityList = blogRepository.findAll();
        modelMap.addAttribute("blogList", blogEntityList);
        return "blog/tourists";
    }


    @RequestMapping(value = "/addBlog", method = RequestMethod.GET)
    public String addBlog(){
        return "blog/addBlog";
    }

    @RequestMapping(value = "/addBlogPost", method = RequestMethod.POST)
    public String addBlogPost(@ModelAttribute("blog") BlogEntity blogEntity,
                              @ModelAttribute("user") UserEntity userEntity){
        //blog表里的总数再加上1
        blogEntity.setId((int) (blogRepository.count()+1));
        //本来应该由session中获得登录ID的……不能写死
        blogEntity.setUserByUserId(userRepository.findOne(userEntity.getId()));


        String  dateStringToParse  =  "2016-03-20";
        java.util.Date  date  = null;
        try {
            date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStringToParse);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        java.sql.Date  sqlDate  =  new java.sql.Date(date.getTime());

        blogEntity.setPubDate(sqlDate);

        blogRepository.saveAndFlush(blogEntity);
        return "redirect:/showBlog";
    }

}


