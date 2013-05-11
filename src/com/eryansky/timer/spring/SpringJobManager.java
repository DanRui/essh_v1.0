package com.eryansky.timer.spring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Spring3中使用注解(@Scheduled)创建计划任务.
 * <br>使用注解方式.
 * @author 尔演&Eryan eryanwcp@gmail.com
 * @date 2013-2-21 上午09:08:18
 */
//@Component
public class SpringJobManager {

	private static final Logger logger = LoggerFactory
            .getLogger(SpringJobManager.class);
	
//    @Scheduled(cron="*/10 * * * * *") 
    public void s10(){
    	logger.info("==== 十秒执行一次=======10s");
    }
    
    public void xmlTest(){
    	logger.info("xmlTest");
    }
    
}