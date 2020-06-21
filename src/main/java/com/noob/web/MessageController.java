package com.noob.web;

import com.noob.domain.Employee;
import com.noob.domain.Message;
import com.noob.domain.Page;
import com.noob.domain.Reply;
import com.noob.service.MessageService;
import com.noob.service.ReplyService;
import com.noob.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/msg")
public class MessageController {
    MessageService messageService;
    ReplyService replyService;

    @RequestMapping(value = "/message.html")
    public String messagePage() {
        return "publishNewMsg";
    }

    @RequestMapping(value = "/sendMsg.html")
    @ResponseBody
    public ModelAndView sendMsg(HttpServletRequest request,
                                @RequestParam("title")String title,
                                @RequestParam("content")String s) {
        Message message = new Message();
        Employee employee = (Employee)request.getSession().getAttribute("employee");

        String str = null;
        try {
            //标题没有乱码问题，但是输入内容有

            //或许是 tomcat 服务器默认采用 ISO 模式解码
            //此处解决乱码问题
            s = new String(s.getBytes("ISO-8859-1"), "UTF-8");
            str = URLDecoder.decode(s, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        message.setMessageTitle(title);
        message.setMessageContent(str);
        message.setPublishTime(new Date());
        message.setEmployeeID(employee.getEmployeeID());
        messageService.publishMsg(message);

        return new ModelAndView("main");
    }

    @RequestMapping(value = "/msgList.html")
    public ModelAndView msgList(HttpServletRequest request) {
        int currentPage = 0;
        String str = request.getParameter("currentPage");
        if (str == null || "".equals(str)) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(str);
        }

        Page page = PageUtil.createPage(5, messageService.findAllCount(), currentPage);
        List<Message> messages = messageService.findMessagesByPage(page);
        request.setAttribute("messages", messages);
        request.setAttribute("page", page);

        return new ModelAndView("msgList");
    }

    @RequestMapping(value = "/showMsg.html")
    public ModelAndView showMsg(HttpServletRequest request,
                                @RequestParam("messageID") Integer messageID) {
        Message message = messageService.findMessageById(messageID);
        List<Reply> list = replyService.getReplyByMessageID(messageID);
        request.setAttribute("message", message);
        request.setAttribute("replyList", list);

        System.out.println(list);
        return new ModelAndView("showMsg");
    }


    @Autowired
    public void setReplyService(ReplyService replyService) {
        this.replyService = replyService;
    }

    @Autowired
    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }
}
