package com.noob.web;

import com.noob.domain.Employee;
import com.noob.domain.Reply;
import com.noob.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;

@Controller
@RequestMapping("/reply")
public class ReplyController {
    ReplyService replyService;


    //提交回复
    @RequestMapping("/commitReply.action")
    @ResponseBody
    public Reply commitReply(HttpServletRequest request,
                                    @RequestParam("content") String str,
                                    @RequestParam("messageID") int messageID) {

        Reply reply = new Reply();
        Employee employee = (Employee)request.getSession().getAttribute("employee");

        try {
            //str = new String(str.getBytes("ISO-8859-1"), "UTF-8");
            str = URLDecoder.decode(str, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        reply.setReplyContext(str);
        reply.setEmployeeID(employee.getEmployeeID());
        reply.setMessageID(messageID);
        reply.setReplyTime(new Date());

        replyService.publishReply(reply);
        //重定向时携带参数

        return reply;
    }

    @Autowired
    public void setReplyService(ReplyService replyService) {
        this.replyService = replyService;
    }
}
