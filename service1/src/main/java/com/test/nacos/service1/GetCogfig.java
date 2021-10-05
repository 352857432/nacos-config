package com.test.nacos.service1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//1.自动刷新
@RefreshScope
public class GetCogfig {

    //通过value注解读取配置信息
    //nacos已经通知客户端，客户端不会更新
    @Value("${common.name}")

    private String name;
    @GetMapping("/getConfig1")
    public  String getConfig1(){
        System.out.println(name);
        return name;
    }




    //2.自动刷新
    @Autowired
    ConfigurableApplicationContext applicationContext;

    @GetMapping("/getConfig2")
    public  String getConfig2(){
        System.out.println(name);
        return applicationContext.getEnvironment().getProperty("common.name");
    }


    /**
     * 共享配置文件
     * @return
     */
    @GetMapping(value = "/getConfig3")
    public String getConfigs2(){
        String name = applicationContext.getEnvironment().getProperty("common.name");
        String age =  applicationContext.getEnvironment().getProperty("common.age");
        String address =  applicationContext.getEnvironment().getProperty("common.address");
        String birthday=  applicationContext.getEnvironment().getProperty("common.birthday");
        String fullname =  applicationContext.getEnvironment().getProperty("common.fullname");
        return name+"+"+ age+"+"+address+"+"+ birthday+"+"+ fullname;
    }

}
