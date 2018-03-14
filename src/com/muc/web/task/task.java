package com.muc.web.task;

import com.muc.service.UserService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.List;


@Component
public class task{

    private UserService userService;
    public UserService getUserService() {
        return userService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Scheduled(cron = "0 0 0 1 9 *")
    public void task(){
        List<User> users = userService.getAllUser();
        List<User> list = userService.getAllUser();
        for (User user : users) {
            String s="已毕业";
            if(user.getGrade().equals("大一")) s="大二";
            else if(user.getGrade().equals("大二")) s="大三";
            else if(user.getGrade().equals("大三")) s="大四";
            else if(user.getGrade().equals("大四")) s="已毕业";
            else if(user.getGrade().equals("研一")) s="研二";
            else if(user.getGrade().equals("研二")) s="研三";
            else if(user.getGrade().equals("研三")) s="已毕业";

            list.get(users.indexOf(user)).setGrade(s);
            list.get(users.indexOf(user)).setPassword("");

            userService.setting(list.get(users.indexOf(user)),list.get(users.indexOf(user)).getPassword());
        }
    }

    @Scheduled(cron = "0 0 0 ? * MON")
    public void weeklyCheck() throws UnsupportedEncodingException {

        List<User> users = userService.weeklyCheck();
        Calendar now = Calendar.getInstance();
        Message message = new Message();
        message.setSender_id(5);
        message.setSender_name("管理员");
        message.setReceiver_id(1);
        message.setReceiver_name("kevin");
        message.setYear(now.get(Calendar.YEAR));
        message.setMonth((now.get(Calendar.MONTH) + 1));
        message.setDay(now.get(Calendar.DAY_OF_MONTH));

        StringBuffer res = new StringBuffer();
        res.append("本周有如下同学没有完成周记：");
        int i=1;
        for(User user :users)
        {
            if(user.getId()==5) continue;
            res.append(i+"."+user.getName()+" ");
            i+=1;
        }
        message.setContent(res.toString());
        userService.addMessage(message);
    }

}
