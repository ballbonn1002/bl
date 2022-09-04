package com.cubesofttech.listener;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;
import com.cubesofttech.system.Constant;

public class SessionListener
        implements HttpSessionListener {

    private static Logger log = Logger.getLogger(SessionListener.class);
    public SessionListener() {
    }

    public void sessionCreated(HttpSessionEvent sessionEvent) {

        log.info("session created");
    }

    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
// Get the session that was invalidated
        log.info("session destroyed");

    }
    public List<String> getSessionActivitylist() {
       	return Constant.onlineUserList;
    }
}