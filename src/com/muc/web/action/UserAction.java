package com.muc.web.action;

import com.muc.domain.*;
import com.muc.service.UserService;
import com.muc.web.form.LoginUser;
import com.muc.web.form.RegisterUser;
import com.muc.web.form.UserTask;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.*;
import java.util.List;

public class UserAction extends ActionSupport{

    private LoginUser loginUser;
    public LoginUser getLoginUser() {
        return loginUser;
    }
    public void setLoginUser(LoginUser loginUser) {
        this.loginUser = loginUser;
    }

    private RegisterUser registerUser;
    public RegisterUser getRegisterUser() {
        return registerUser;
    }
    public void setRegisterUser(RegisterUser registerUser) {
        this.registerUser = registerUser;
    }

    private UserTask userTask;
    public UserTask getUserTask() {
        return userTask;
    }
    public void setUserTask(UserTask userTask) {
        this.userTask = userTask;
    }

    private Agenda userAgenda;
    public Agenda getUserAgenda() {
        return userAgenda;
    }
    public void setUserAgenda(Agenda userAgenda) {
        this.userAgenda = userAgenda;
    }

    private News userNews;
    public News getUserNews() {
        return userNews;
    }
    public void setUserNews(News userNews) {
        this.userNews = userNews;
    }

    private Weekly userWeekly;
    public Weekly getUserWeekly() {
        return userWeekly;
    }
    public void setUserWeekly(Weekly userWeekly) {
        this.userWeekly = userWeekly;
    }

    private UserService userService;
    public UserService getUserService() {
        return userService;
    }
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private Message userMessage;
    public Message getUserMessage() {
        return userMessage;
    }
    public void setUserMessage(Message userMessage) {
        this.userMessage = userMessage;
    }

    private File avatar_file;
    private String avatar_fileFileName;
    private String avatar_data;
    public File getAvatar_file() {
        return avatar_file;
    }
    public void setAvatar_file(File avatar_file) {
        this.avatar_file = avatar_file;
    }
    public String getAvatar_fileFileName() {
        return avatar_fileFileName;
    }
    public void setAvatar_fileFileName(String avatar_fileFileName) {
        this.avatar_fileFileName = avatar_fileFileName;
    }
    public String getAvatar_data() {
        return avatar_data;
    }
    public void setAvatar_data(String avatar_data) {
        this.avatar_data = avatar_data;
    }

    private RegisterUser settingsUser;
    public RegisterUser getSettingsUser() {
        return settingsUser;
    }
    public void setSettingsUser(RegisterUser settingsUser) {
        this.settingsUser = settingsUser;
    }

    @Override
    public String execute() throws Exception {
        return NONE;
    }

    //LoginUI and relevant Action
    public String LoginUI() throws Exception {
        return "LoginUI";
    }
    public String Login() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        User user = userService.login(loginUser);

        if(user!=null){
            request.getSession().setAttribute("user",user);
            return NONE;
        }

        response.getWriter().write("用户名或密码错误");
        return NONE;
    }
    public String Logout() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        HttpSession session = request.getSession();

        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        return "LoginUI";
    }
    public String Register() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        User user = new User();

        if(registerUser.getUsername()==null || registerUser.getUsername().trim().equals("")){
            response.getWriter().write("用户名不能为空");
            return NONE;
        }else if(!registerUser.getUsername().matches("^[a-zA-Z]\\w{3,15}$"))
        {
                response.getWriter().write("用户名应不少于四位且首位应为英文字母");
                return NONE;
        }
        user.setUsername(registerUser.getUsername());

        if(registerUser.getPassword()==null || registerUser.getPassword().trim().equals("")){
            response.getWriter().write("密码不能为空");
            return NONE;
        }else if(!registerUser.getPassword().matches("^\\S{6,22}$")){
                response.getWriter().write("密码应为六到二十二位");
                return NONE;
        }

        if(registerUser.getPassword2()==null || registerUser.getPassword2().trim().equals("")){
            response.getWriter().write("请输入第二次密码");
            return NONE;
        }else if(!registerUser.getPassword().equals(registerUser.getPassword2())){
                response.getWriter().write("两次密码不一致");
                return NONE;
        }
        user.setPassword(registerUser.getPassword());

        if(registerUser.getName()==null || registerUser.getName().trim().equals("")){
            response.getWriter().write("姓名不能为空");
            return NONE;
        } else if (!registerUser.getName().matches("[\\u4E00-\\u9FA5]{2,5}(?:·[\\u4E00-\\u9FA5]{2,5})*")){
                response.getWriter().write("姓名不合规范");
                return NONE;
        }
        user.setName(registerUser.getName());

        if(registerUser.getStudent_id()==null || registerUser.getStudent_id().trim().equals("")){
            response.getWriter().write("学号不能为空");
            return NONE;
        }else if(!registerUser.getStudent_id().matches("[A-Z0-9_]{7,8}")){
                response.getWriter().write("学号不合规范");
                return NONE;
        }
        user.setStudent_id(registerUser.getStudent_id());

        if((registerUser.getGrade().equals("年级"))||(!(registerUser.getGrade().equals("大一")||registerUser.getGrade().equals("大二")||registerUser.getGrade().equals("大三")||registerUser.getGrade().equals("大四")||registerUser.getGrade().equals("研一")||registerUser.getGrade().equals("研二")||registerUser.getGrade().equals("研三")))){
            response.getWriter().write("请选择年级");
            return NONE;
        }
        user.setGrade(registerUser.getGrade());

        if((registerUser.getStudent_group().equals("组别"))||(!(registerUser.getStudent_group().equals("大数据")||registerUser.getStudent_group().equals("深度学习")||registerUser.getStudent_group().equals("其他")))){
            response.getWriter().write("请选择组别");
            return NONE;
        }
        user.setStudent_group(registerUser.getStudent_group());

        if(registerUser.getEmail()==null || registerUser.getEmail().trim().equals("")){
            response.getWriter().write("邮箱不能为空");
            return NONE;
        }else if(!registerUser.getEmail().matches("^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$")){
                response.getWriter().write("邮箱不合规范");
                return NONE;
        }
        user.setEmail(registerUser.getEmail());

        if(registerUser.getPhone_number()==null || registerUser.getPhone_number().trim().equals("")) {
            response.getWriter().write("手机号码不能为空");
            return NONE;
        } else if (!registerUser.getPhone_number().matches("^1(3|4|5|7|8)[0-9]{9}$")) {
                response.getWriter().write("手机号码不合规范");
                return NONE;
        }
        user.setPhone_number(registerUser.getPhone_number());

        if(userService.find(registerUser.getUsername()))
        {
            response.getWriter().write("用户名已存在");
            return NONE;
        }

        try {
            userService.register(user);
            Notification notification = new Notification();
            notification.setFirst_link(Grade(user.getGrade()));
            notification.setName(user.getName());
            notification.setFirst_words("完成了注册");
            Date date = new Date();
            notification.setTime(date.getTime()/3600000);
            notification.setReceiver_id(0);
            userService.addNotification(notification);

            Task task1 = new Task();
            task1.setContent("尝试一下在发送消息时通过“↑”“↓”来快速匹配小伙伴");
            task1.setBadge("重要但不紧急");
            userService.addTask(user,task1);

            Task task2 = new Task();

            task2.setContent("到“设置”处换个头像让实验室的小伙伴们更好地认识你吧");
            task2.setBadge("重要且紧急");
            userService.addTask(user,task2);

            String dir = ServletActionContext.getServletContext().getRealPath("/assets/img/avatar/");
            FileInputStream is = new FileInputStream(new File(dir + "ui-sam.jpg"));
            FileOutputStream os = new FileOutputStream(new File(dir+ user.getId() + ".jpg"));

            byte[] buf = new byte[1024];

            while (is.read(buf) != -1) {
                os.write(buf);
            }
                response.getWriter().write("注册成功，快去登陆吧");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }

    //IndexUI and Action for Task
    public String IndexUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        List<Task> list_task = userService.getAllTask(user.getId());
        request.setAttribute("list_task",list_task);
        List<Notification> list_notification = userService.getAllNotification(user.getId());

        Collections.reverse(list_notification);
        Date date = new Date();
        for(Notification notification : list_notification) {
            notification.setTime(date.getTime()/3600000 - notification.getTime());
        }
        request.setAttribute("list_notification",list_notification);

        if(user.getLast_login()=="first"){
            request.setAttribute("first","first");
        }
        return "IndexUI";
    }
    public String AddTask() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        Task task = new Task();

        if(userTask.getContent()==null || userTask.getContent().trim().equals("")) {
            response.getWriter().write("任务内容不能为空");
            return NONE;
        }
        task.setContent(userTask.getContent());

        if(userTask.getBadge()==null || userTask.getBadge().trim().equals("")) {
            response.getWriter().write("任务标签不能为空");
            return NONE;
        }
        task.setBadge(userTask.getBadge());

        try {
            userService.addTask(user,task);
            response.getWriter().write("添加完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String EditTask() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        Task task = new Task();

        task.setTid(userTask.getTid());
        if(userTask.getContent()==null || userTask.getContent().trim().equals("")) {
            response.getWriter().write("任务内容不能为空");
            return NONE;
        }
        task.setContent(userTask.getContent());

        if(userTask.getBadge()==null || userTask.getBadge().trim().equals("")) {
            response.getWriter().write("任务标签不能为空");
            return NONE;
        }
        task.setBadge(userTask.getBadge());

        try {
            userService.editTask(user,task);
            response.getWriter().write("修改完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String DeleteTask() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        HttpSession session = request.getSession();

        User user = (User)session.getAttribute("user");

        Task task = new Task();

        task.setTid(userTask.getTid());

        try {
            userService.deleteTask(user,task);
            response.getWriter().write("删除完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }

    //CalendarUI and Action for Agenda
    public String CalendarUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        List<Agenda> list_agenda = userService.getAllAgenda();
        request.setAttribute("list_agenda",list_agenda);

        return "CalendarUI";
    }
    public String Calendar() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        List<Agenda> list = userService.getAllAgenda();
        StringBuffer res = new StringBuffer();
        if(list!=null && list.size()>0){
            for(Agenda agenda :list){
                res.append("<id>");
                res.append(agenda.getAid());
                res.append("<title>");
                res.append(agenda.getTitle());
                res.append("<start>");
                res.append(agenda.getStart());
                res.append("<end>");
                res.append(agenda.getEnd());
            }
        }
        response.getOutputStream().write(res.toString().getBytes("utf-8"));
        return NONE;
    }
    public String AddAgenda() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Agenda agenda = new Agenda();

        if(userAgenda.getTitle()==null || userAgenda.getTitle().trim().equals("")) {
            response.getWriter().write("事务内容不能为空");
            return NONE;
        }
        agenda.setTitle(userAgenda.getTitle());

        if(userAgenda.getStart()==null || userAgenda.getStart().trim().equals("")) {
            response.getWriter().write("起止时间不能为空");
            return NONE;
        }

        String[] time1 = userAgenda.getStart().split(" - ");
        agenda.setStart(time1[0]);
        agenda.setEnd(time1[1]);

        try {
            userService.addAgenda(agenda);
            Notification notification = new Notification();
            notification.setFirst_link(Grade(user.getGrade()));
            notification.setName(user.getName());
            notification.setFirst_words("增加了新日历事件:");
            notification.setSecond_link("CalendarUI");
            notification.setSecond_words(agenda.getTitle());
            Date date = new Date();
            notification.setTime(date.getTime()/3600000);
            notification.setReceiver_id(0);
            userService.addNotification(notification);
            response.getWriter().write("添加完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String EditAgenda() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Agenda agenda = new Agenda();

        agenda.setAid(userAgenda.getAid());
        if(userAgenda.getTitle()==null || userAgenda.getTitle().trim().equals("")) {
            response.getWriter().write("事务内容不能为空");
            return NONE;
        }
        agenda.setTitle(userAgenda.getTitle());

        if(userAgenda.getStart()==null || userAgenda.getStart().trim().equals("")) {
            response.getWriter().write("起止时间不能为空");
            return NONE;
        }

        String[] time1 = userAgenda.getStart().split(" - ");
        agenda.setStart(time1[0]);
        agenda.setEnd(time1[1]);

        try {
            userService.editAgenda(agenda);
            Notification notification = new Notification();
            notification.setFirst_link(Grade(user.getGrade()));
            notification.setName(user.getName());
            notification.setFirst_words("编辑了日历事件:");
            notification.setSecond_link("CalendarUI");
            notification.setSecond_words(agenda.getTitle());
            Date date = new Date();
            notification.setTime(date.getTime()/3600000);
            notification.setReceiver_id(0);
            userService.addNotification(notification);
            response.getWriter().write("修改完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String DeleteAgenda() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Agenda agenda = new Agenda();

        agenda.setAid(userAgenda.getAid());
        agenda.setTitle(userAgenda.getTitle());
        try {
            userService.deleteAgenda(agenda);
            response.getWriter().write("删除完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }

    //UserUI and relevant Action
    public String GetUndergraduate() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        List<User> list_user = userService.getUndergraduate();
        request.setAttribute("list_user",list_user);
        request.setAttribute("grade","1");

        return "UserUI";
    }
    public String GetGraduate() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        List<User> list_user = userService.getGraduate();
        request.setAttribute("list_user",list_user);
        request.setAttribute("grade","2");

        return "UserUI";
    }
    public String GetAdmin() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        List<User> list_user = userService.getAdmin();
        request.setAttribute("list_user",list_user);
        request.setAttribute("grade","3");

        return "UserUI";
    }

    //MessageUI and Action for Message
    public String MessageUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        List<Message> list_message = userService.getAllMessage(user.getId());
        List<Message> list_message1 = userService.getAllMessage(user.getId());
        Collections.reverse(list_message);
        Collections.reverse(list_message1);

        for(Message message : list_message) {
            if(message.getContent().length()>5)
            {
                message.setContent(message.getContent().substring(0,5)+"...");
            }
        }

        List<User> users = userService.getAllUser();
        request.setAttribute("list_user",users);

        Calendar now = Calendar.getInstance();
        request.setAttribute("list_message",list_message);
        request.setAttribute("list_message1",list_message1);
        request.setAttribute("year",now.get(Calendar.YEAR));
        request.setAttribute("month",(now.get(Calendar.MONTH) + 1));
        request.setAttribute("day",now.get(Calendar.DAY_OF_MONTH));

        return "MessageUI";
    }
    public String SentMessageUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        List<Message> list_message = userService.getAllSentMessage(user.getId());
        List<Message> list_message1 = userService.getAllSentMessage(user.getId());
        Collections.reverse(list_message);
        Collections.reverse(list_message1);

        for(Message message : list_message) {
            if(message.getContent().length()>5)
            {
                message.setContent(message.getContent().substring(0,5)+"...");
            }
        }

        Calendar now = Calendar.getInstance();
        request.setAttribute("list_message",list_message);
        request.setAttribute("list_message1",list_message1);
        request.setAttribute("year",now.get(Calendar.YEAR));
        request.setAttribute("month",(now.get(Calendar.MONTH) + 1));
        request.setAttribute("day",now.get(Calendar.DAY_OF_MONTH));
        request.setAttribute("type","sent");

        return "MessageUI";
    }
    public String AddMessage() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Message message = new Message();

        if(userMessage.getReceiver_name()==null || userMessage.getReceiver_name().trim().equals("")) {
            response.getWriter().write("收件人不能为空");
            return NONE;
        }

        message.setReceiver_id(userService.findReceiver(userMessage.getReceiver_name()));

        if(message.getReceiver_id() == null) {
            response.getWriter().write("未找到收件人");
            return NONE;
        }
        message.setReceiver_name(userMessage.getReceiver_name());

        if(userMessage.getContent()==null || userMessage.getContent().trim().equals("")) {
            response.getWriter().write("消息内容不能为空");
            return NONE;
        }
        message.setContent(userMessage.getContent());

        message.setSender_id(user.getId());
        message.setSender_name(user.getName());

        Calendar now = Calendar.getInstance();
        message.setYear(now.get(Calendar.YEAR));
        message.setMonth((now.get(Calendar.MONTH) + 1));
        message.setDay(now.get(Calendar.DAY_OF_MONTH));

        try {
            userService.addMessage(message);
            Notification notification = new Notification();
            notification.setFirst_link(Grade(user.getGrade()));
            notification.setName(user.getName());
            notification.setFirst_words("发给我一条消息:");
            notification.setSecond_link("MessageUI");
            if(message.getContent().length()>5)
            {
                message.setContent(message.getContent().substring(0,5)+"...");
            }
            notification.setSecond_words(message.getContent());
            Date date = new Date();
            notification.setTime(date.getTime()/3600000);
            notification.setReceiver_id(message.getReceiver_id());
            userService.addNotification(notification);
            response.getWriter().write("发送完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }


//        String jsonStr = request.getParameter("前台传送json字符串的参数名");
//        JSONObject json = JSONObject.fromObject(jsonStr);
//        Iterator iter = json.keySet().iterator();
//        Map<String,String> map = new HashMap<String,String>();
//        while (iter.hasNext()) {
//            String key = (String) iter.next();
//            String value = json.getString(key);
//            map.put(key, value);
//        }
    }
    public String DeleteMessage() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");

        Message message = new Message();

        message.setMid(userMessage.getMid());

        try {
            userService.deleteMessage(message);
            response.getWriter().write("删除完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }

    //SettingsUI and Action for Settings(including Avatar)
    public String SettingsUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        User user1 = userService.getUser(user.getId());
        request.setAttribute("user1",user1);

        return "SettingsUI";
    }
    public String Settings() throws Exception {


        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user1 = (User)session.getAttribute("user");

        User user = new User();

        user.setId(user1.getId());
        user.setUsername(user1.getUsername());

        if(!(settingsUser.getPassword()==null || settingsUser.getPassword().trim().equals(""))) {

            if (!settingsUser.getPassword().matches("^\\S{6,22}$")) {
                response.getWriter().write("密码应为六到二十二位");
                return NONE;
            }

        if(settingsUser.getPassword2()==null || settingsUser.getPassword2().trim().equals("")){
            response.getWriter().write("请输入第二次密码");
            return NONE;
        }else if(!settingsUser.getPassword().equals(settingsUser.getPassword2())){
            response.getWriter().write("两次密码不一致");
            return NONE;
        }
        }
        user.setPassword(settingsUser.getPassword());

        if(settingsUser.getName()==null || settingsUser.getName().trim().equals("")){
            response.getWriter().write("姓名不能为空");
            return NONE;
        } else if (!settingsUser.getName().matches("[\\u4E00-\\u9FA5]{2,5}(?:·[\\u4E00-\\u9FA5]{2,5})*")){
            response.getWriter().write("姓名不合规范");
            return NONE;
        }
        user.setName(settingsUser.getName());

        if(settingsUser.getStudent_id()==null || settingsUser.getStudent_id().trim().equals("")){
            response.getWriter().write("学号不能为空");
            return NONE;
        }else if(!settingsUser.getStudent_id().matches("[A-Z0-9_]{7,8}")){
            response.getWriter().write("学号不合规范");
            return NONE;
        }
        user.setStudent_id(settingsUser.getStudent_id());

        if(settingsUser.getGrade()==null || settingsUser.getGrade().trim().equals("")){
            response.getWriter().write("年级不能为空");
            return NONE;
        }else if((settingsUser.getGrade().equals("年级"))||(!(settingsUser.getGrade().equals("大一")||settingsUser.getGrade().equals("大二")||settingsUser.getGrade().equals("大三")||settingsUser.getGrade().equals("大四")||settingsUser.getGrade().equals("研一")||settingsUser.getGrade().equals("研二")||settingsUser.getGrade().equals("研三")))){
            response.getWriter().write("请选择年级");
            return NONE;
        }
        user.setGrade(settingsUser.getGrade());

        if(settingsUser.getStudent_group()==null || settingsUser.getStudent_group().trim().equals("")){
            response.getWriter().write("组别不能为空");
            return NONE;
        }else if((settingsUser.getStudent_group().equals("组别"))||(!(settingsUser.getStudent_group().equals("大数据")||settingsUser.getStudent_group().equals("深度学习")||settingsUser.getStudent_group().equals("其他")))){
            response.getWriter().write("请选择组别");
            return NONE;
        }
        user.setStudent_group(settingsUser.getStudent_group());

        if(settingsUser.getEmail()==null || settingsUser.getEmail().trim().equals("")){
            response.getWriter().write("邮箱不能为空");
            return NONE;
        }else if(!settingsUser.getEmail().matches("^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$")){
            response.getWriter().write("邮箱不合规范");
            return NONE;
        }
        user.setEmail(settingsUser.getEmail());

        if(settingsUser.getPhone_number()==null || settingsUser.getPhone_number().trim().equals("")) {
            response.getWriter().write("手机号码不能为空");
            return NONE;
        } else if (!settingsUser.getPhone_number().matches("^1(3|4|5|7|8)[0-9]{9}$")) {
            response.getWriter().write("手机号码不合规范");
            return NONE;
        }
        user.setPhone_number(settingsUser.getPhone_number());

        try {
            userService.setting(user,user1.getPassword());
            response.getWriter().write("修改成功，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String Avatar() throws Exception {

        HttpServletResponse response = ServletActionContext.getResponse();
        HttpServletRequest request = ServletActionContext.getRequest();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        List types = Arrays.asList("jpg","gif","jpeg","bmp","png");

        String dir = ServletActionContext.getServletContext().getRealPath("/assets/img/avatar/");
        String prefix=avatar_fileFileName.substring(avatar_fileFileName.lastIndexOf(".")+1);
        File newFile = new File(dir + user.getId() +"."+ prefix);
        try {
            if(!types.contains(prefix)){
                response.getWriter().write("不支持" + prefix + "这种类型");
                return NONE;
            }
            if(avatar_file.length()>10485760){
                response.getWriter().write("文件大小不能超过10M");
                return NONE;
            }
            if(newFile.exists()) newFile.delete();
            avatar_file.renameTo(newFile);
        }catch (Exception e){
            throw new RuntimeException(e);
        }

        JSONObject jsonObject = JSONObject.fromString(avatar_data);
        Avatar avatar = new Avatar();
        avatar.setX(jsonObject.getInt("x"));
        avatar.setY(jsonObject.getInt("y"));
        avatar.setHeight(jsonObject.getInt("height"));
        avatar.setWidth(jsonObject.getInt("width"));

        FileInputStream is = null;
        ImageInputStream iis = null;
        try {

            is = new FileInputStream(dir + user.getId()+ "." + prefix);

            Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName(prefix);

            ImageReader reader = it.next();

            iis = ImageIO.createImageInputStream(is);

            reader.setInput(iis, true);

            ImageReadParam param = reader.getDefaultReadParam();

            Rectangle rect = new Rectangle(avatar.getX(), avatar.getY(), avatar.getWidth(), avatar.getHeight());

            param.setSourceRegion(rect);

            BufferedImage bi = reader.read(0,param);

            // 保存新图片
            ImageIO.write(bi, prefix, new File(dir + user.getId() +"."+ prefix));
        } finally {
            if (is != null)
                is.close();
            if (iis != null)
                iis.close();
        }
        response.getWriter().write("上传成功，即将刷新");
        return NONE;
    }

    //NewsUI and Action for News
    public String NewsUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        List<News> list_news = userService.getAllNews();
        Collections.reverse(list_news);
        Calendar now = Calendar.getInstance();
        request.setAttribute("list_news",list_news);
        request.setAttribute("year",now.get(Calendar.YEAR));
        request.setAttribute("month",(now.get(Calendar.MONTH) + 1));
        request.setAttribute("day",now.get(Calendar.DAY_OF_MONTH));

        return "NewsUI";
    }
    public String AddNews() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        News news = new News();

        if(userNews.getTitle()==null || userNews.getTitle().trim().equals("")) {
            response.getWriter().write("新闻标题不能为空");
            return NONE;
        }
        news.setTitle(userNews.getTitle());

        if(userNews.getContent()==null || userNews.getContent().trim().equals("")) {
            response.getWriter().write("新闻内容不能为空");
            return NONE;
        }
        news.setContent(userNews.getContent());

        news.setAuthor_id(user.getId());
        news.setAuthor_name(user.getName());

        Calendar now = Calendar.getInstance();
        news.setYear(now.get(Calendar.YEAR));
        news.setMonth((now.get(Calendar.MONTH) + 1));
        news.setDay(now.get(Calendar.DAY_OF_MONTH));

        try {
            userService.addNews(news);
            Notification notification = new Notification();
            notification.setFirst_link(Grade(user.getGrade()));
            notification.setName(user.getName());
            notification.setFirst_words("发布了一条新闻:");
            notification.setSecond_link("NewsUI");
            notification.setSecond_words(news.getTitle());
            Date date = new Date();
            notification.setTime(date.getTime()/3600000);
            notification.setReceiver_id(0);
            userService.addNotification(notification);
            response.getWriter().write("添加完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String DeleteNews() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        News news = new News();

        news.setNid(userNews.getNid());
        try {
            userService.deleteNews(news);
            response.getWriter().write("删除完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }

    //WeeklyUI and Action for Weekly
    public String WeeklyUI() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        List<Weekly> list_weekly = userService.getAllWeekly();
        Collections.reverse(list_weekly);
        Calendar now = Calendar.getInstance();
        request.setAttribute("list_weekly",list_weekly);
        request.setAttribute("year",now.get(Calendar.YEAR));
        request.setAttribute("month",(now.get(Calendar.MONTH) + 1));
        request.setAttribute("day",now.get(Calendar.DAY_OF_MONTH));

        return "WeeklyUI";
    }
    public String AddWeekly() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Weekly weekly = new Weekly();

        weekly.setContent(userWeekly.getContent());

        weekly.setAuthor_id(user.getId());
        weekly.setAuthor_name(user.getName());

        Calendar now = Calendar.getInstance();
        weekly.setYear(now.get(Calendar.YEAR));
        weekly.setMonth((now.get(Calendar.MONTH) + 1));
        weekly.setDay(now.get(Calendar.DAY_OF_MONTH));

        try {
            userService.addWeekly(weekly);
            response.getWriter().write("添加完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String UpdateWeekly() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Weekly weekly = new Weekly();

        weekly.setWid(userWeekly.getWid());
        weekly.setContent(userWeekly.getContent());

        weekly.setAuthor_id(user.getId());
        weekly.setAuthor_name(user.getName());

        Calendar now = Calendar.getInstance();
        weekly.setYear(now.get(Calendar.YEAR));
        weekly.setMonth((now.get(Calendar.MONTH) + 1));
        weekly.setDay(now.get(Calendar.DAY_OF_MONTH));

        try {
            userService.updateWeekly(weekly);
            response.getWriter().write("修改完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }
    public String DeleteWeekly() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");

        Weekly weekly = new Weekly();

        weekly.setWid(userWeekly.getWid());
        try {
            userService.deleteWeekly(weekly);
            response.getWriter().write("删除完成，即将刷新");
            return NONE;
        }catch (Exception e){
            response.getWriter().write("未知错误");
            return NONE;
        }
    }

    //Get Grade Link when add Notification
    private String Grade(String grade) throws Exception{
        if(grade.equals("大一")||grade.equals("大二")||grade.equals("大三")||grade.equals("大四"))
            return "GetUndergraduate";
        else if(grade.equals("研一")||grade.equals("研二")||grade.equals("研三"))
            return "GetGraduate";
        else
            return "GetAdmin";
    }
}
