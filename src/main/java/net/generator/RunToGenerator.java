package net.generator;

import net.generator.tool.MybaitsPlusGenatorTool;
import org.junit.Test;
import org.mybatis.generator.api.ShellRunner;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class RunToGenerator {
    private String url;
    private String username;
    private String password;
    private String url2;
    private String username2;
    private String password2;

    {
        Properties properties = new Properties();
        InputStream in = RunToGenerator.class.getClassLoader().getResourceAsStream("application.properties");
        try {
            properties.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
        url = properties.getProperty("url");
        username = properties.getProperty("username");
        password = properties.getProperty("password");
        url2 = properties.getProperty("url2");
        username2 = properties.getProperty("username2");
        password2 = properties.getProperty("password2");
    }


    //课程
    @Test
    public void course() {
        String[] tables = {"wf_member_study_backup"};
        String packagePath = "study";
        MybaitsPlusGenatorTool.generator(url, username, password, packagePath, tables);
    }

    //评论
    @Test
    public void comment() {
        String[] tables = {"wf_course_admin_comment"};
        String packagePath = "comment";
        MybaitsPlusGenatorTool.generator(url2, username2, password2, packagePath, tables);
    }

    //@Test
    public void xml() {
        String[] args = new String[]{"-configfile", "C:\\wf\\mybatis-generator\\src\\main\\resources\\mybatis-generator.xml", "-overwrite"};
        ShellRunner.main(args);
    }
}
