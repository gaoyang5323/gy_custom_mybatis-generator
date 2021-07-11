package net.example.mybatisgenerator;

import net.example.mybatisgenerator.tool.MybaitsPlusGenatorTool;
import org.junit.Test;
import org.mybatis.generator.api.ShellRunner;

public class RunToGenerator {

    @Test
    public void plus() {
        String[] tables = {"wf_sys_user"};
        MybaitsPlusGenatorTool.generator(tables);
    }

    @Test
    public void xml() {
        String[] args = new String[]{"-configfile", "C:\\wf\\mybatis-generator\\src\\main\\resources\\mybatis-generator.xml", "-overwrite"};
        ShellRunner.main(args);
    }
}
