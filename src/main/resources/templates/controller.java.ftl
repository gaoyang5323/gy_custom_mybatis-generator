package ${package.Controller};

import ${package.Entity}.${entity};
import ${package.Entity?replace("entity","vo")}.${entity}VO;
import ${package.Service}.${table.serviceName};
import com.xfs.iqc.utils.restful.Result;
import com.xfs.iqc.utils.*;
import com.xfs.iqc.utils.annotation.*;
import com.xfs.iqc.utils.enums.*;
import com.xfs.iqc.utils.exception.*;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
<#--import ${package.Entity?replace("entity","utils")}.*;
import ${package.Entity?replace("entity","utils")}.annotation.*;
import ${package.Entity?replace("entity","utils")}.enums.*;
import ${package.Entity?replace("entity","utils")}.exception.*;-->
<#if restControllerStyle>
<#else>
    import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
    import ${superControllerClassPackage};
</#if>


import java.util.List;

<#--/**
* <p>
    * ${table.comment} 前端控制器
    * </p>
*
* @author ${author}
* @since ${date}
*/-->
/**
 * @version v1.0
 * @ProjectName: IQC
 * @ClassName: ${table.controllerName}
 * @Description: TODO${table.comment}Controller
 * @Author:  ${author}
 * @Date:  ${.now}
 */
<#--@Api(tags = "${table.comment}")-->
@Api(value = "${table.comment}", tags = {"${table.comment}Controller"})
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("/${table.controllerName?uncap_first}")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName}  {
<#else>
public class ${table.controllerName}  {
</#if>


    @Autowired
    private ${table.serviceName} ${table.entityPath}Service;

    /**
     * @Title add${table.entityPath?cap_first}
     * @Description TODO(${table.comment}新增)
     * @Params [${entity}VO]
     * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
     * @Author ${author}
     * @Date   ${.now}
     * @throws CustomException
     */
    //@Log(title = "${table.comment}新增", businessType = BusinessType.INSERT)
    @ApiOperation(value = "${table.comment}新增", notes = "描述：${table.comment}新增", httpMethod = "POST")
    @RequestMapping(value = "/add/${table.entityPath?cap_first}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result add${table.entityPath?cap_first}(@RequestBody ${entity}VO parmEntityVO) throws CustomException {
        return Result.success(${table.entityPath}Service.add${table.entityPath?cap_first}(parmEntityVO));
    }


    /**
     * @Title delete${table.entityPath?cap_first}By<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>
     * @Description TODO(${table.comment}删除)
     * @Params [<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>]
     * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
     * @Author ${author}
     * @Date   ${.now}
     * @throws CustomException
     */
    //@Log(title = "${table.comment}删除", businessType = BusinessType.INSERT)
    @ApiOperation(value = "${table.comment}id删除(单条)", notes = "描述：${table.comment}id删除(单条)", httpMethod = "POST")
    @RequestMapping(value = "/delete/${table.entityPath?cap_first}By<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result delete${table.entityPath?cap_first}By<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>(@RequestParam(required = true, defaultValue = "") String <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>) throws CustomException {
        ${table.entityPath}Service.delete${table.entityPath?cap_first}ById(<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>);
        return Result.success();
    }


    /**
     * @Title delete${table.entityPath?cap_first}ByIds
     * @Description TODO(${table.comment}批量删除)
     * @Params [List<String>]
     * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
     * @Author ${author}
     * @Date   ${.now}
     * @throws CustomException
     */
    //@Log(title = "${table.comment}批量删除删除", businessType = BusinessType.INSERT)
    @ApiOperation(value = "${table.comment}批量删除(多条)", notes = "描述：${table.comment}批量删除(多条)", httpMethod = "POST")
    @RequestMapping(value = "/delete/${table.entityPath?cap_first}ByIds", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result delete${table.entityPath?cap_first}ByIds(@RequestBody List<String> idList) throws CustomException {
        ${table.entityPath}Service.delete${table.entityPath?cap_first}ByIds(idList);
        return Result.success();
    }

    /**
     * @Title update${table.entityPath?cap_first}
     * @Description TODO(${table.comment}修改)
     * @Params [${entity}VO]
     * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
     * @Author ${author}
     * @Date   ${.now}
     * @throws CustomException
     */
    //@Log(title = "${table.comment}修改", businessType = BusinessType.UPDATE)
    @ApiOperation(value = "${table.comment}修改", notes = "描述：${table.comment}修改", httpMethod = "POST")
    @RequestMapping(value = "/update/${table.entityPath?cap_first}", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result update${table.entityPath?cap_first}(@RequestBody ${entity}VO parmEntityVO) throws CustomException {
        return Result.success(${table.entityPath}Service.update${table.entityPath?cap_first}(parmEntityVO));
    }

    /**
     * @Title get${table.entityPath?cap_first}InforBy<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>
     * @Description TODO(Id查询${table.comment}信息)
     * @Params [<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>]
     * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
     * @Author ${author}
     * @Date   ${.now}
     * @throws CustomException
     */
    @ApiOperation(value = "Id查询${table.comment}信息", notes = "描述：Id查询${table.comment}信息-单条", httpMethod = "POST")
    @ApiParam(name = "id", value = "主键id", defaultValue = "", required = true)
    @RequestMapping(value = "/get/${table.entityPath?cap_first}InforBy<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result get${table.entityPath?cap_first}InforBy<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>(@RequestParam(required = true, defaultValue = "") String <#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>) throws CustomException {
        return Result.success(${table.entityPath}Service.get${table.entityPath?cap_first}InforById(<#list table.fields as field><#if field.keyFlag>${field.propertyName?cap_first}</#if></#list>));
    }

    /**
     * @Title get${table.entityPath?cap_first}ListByPage
     * @Description TODO(分页查询${table.comment}信息)
     * @Params [parmEntityVO]
     * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
     * @Author ${author}
     * @Date   ${.now}
     * @throws CustomException
     */
    @ApiOperation(value = "分页查询${table.comment}信息", notes = "描述：分页查询${table.comment}信息", httpMethod = "POST")
    @RequestMapping(value = "/get/${table.entityPath?cap_first}ListByPage", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public Result get${table.entityPath?cap_first}ListByPage(@RequestBody ${entity}VO parmVO,
                                          @RequestParam(required = true, defaultValue = "1", name = "pageNum") Integer pageNum,
                                          @RequestParam(required = true, defaultValue = "10", name = "pageSize") Integer pageSize) throws CustomException {
        return Result.success(${table.entityPath}Service.get${table.entityPath?cap_first}ListByPage(parmVO, pageNum, pageSize));
    }

     /**
       * @Title getSfeManagerMapdataCityListByPage
       * @Description TODO(根据条件检索${table.comment}信息)
       * @Params [parmEntityVO]
       * @Return ${package.Entity?replace("entity","utils")}.AjaxJson
       * @Author ${author}
       * @Date   ${.now}
       * @throws CustomException
       */
     @ApiOperation(value = "根据条件检索${table.comment}信息", notes = "描述：根据条件检索${table.comment}信息", httpMethod = "POST")
     @RequestMapping(value = "/get/${table.entityPath?cap_first}ListByParm", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
     public Result get${table.entityPath?cap_first}ListByParm(@RequestBody ${entity}VO parmVO) throws CustomException {
        return Result.success(${table.entityPath}Service.get${table.entityPath?cap_first}ListByParm(parmVO));
     }

}
        </#if>
